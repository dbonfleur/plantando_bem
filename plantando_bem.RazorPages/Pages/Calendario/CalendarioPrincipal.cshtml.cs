using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;
using plantando_bem.RazorPages.Models.Jardim;

namespace plantando_bem.RazorPages.Pages.Calendario
{
    [Authorize]
    public class CalendarioPrincipal : PageModel
    {
        private readonly ILogger<CalendarioPrincipal> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        
        public Irrigacao? IrrigacaoTrue { get; set; } = new();
        public Irrigacao? IrrigacaoFalse { get; set; } = new();
        [BindProperty]
        public string? Estacao { get; set; }
        [BindProperty]
        public List<UserPlantas>? UserPlantas { get; set; } = new();
        [BindProperty]
        public List<UserPlantas>? UserPlantasJson { get; set; } = new();

        public CalendarioPrincipal(ILogger<CalendarioPrincipal> logger, 
                                    IdentityDataContext context,
                                    UserManager<IdentityUser> userManager,
                                    IHttpContextAccessor httpContextAccessor)
        {
            _logger = logger;
            _context = context;
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            HttpContext httpCont = _httpContextAccessor.HttpContext!;

            var userNet = await _userManager.GetUserAsync(httpCont.User);
            var user = await _context.User!.FirstAsync(t => t.IdNetUser == userNet!.Id);
            UserPlantas = await _context.UserPlantas!
                                        .Include(p => p.Planta)
                                        .Where(u => u.UserId == user.Id)
                                        .ToListAsync();

            foreach(var userPlanta in UserPlantas) {
                UserPlantasJson!.Add(new UserPlantas(){
                    DataInicio = userPlanta.DataInicio,
                    DataFinalMin = userPlanta.DataFinalMin,
                    DataFinalMax = userPlanta.DataFinalMax,
                    PlantaId = userPlanta.PlantaId,
                    UserId = userPlanta.UserId
                });
            }

            int month = DateTime.Now.Month;

            if (month >= 3 && month <= 5) {
                Estacao = "Outono";
            } else if (month >= 6 && month <= 8) {
                Estacao = "Inverno";
            } else if (month >= 9 && month <= 11) {
                Estacao = "Primavera";
            } else {
                Estacao = "Verão";
            }

            var strData = DateTime.Now.ToString("dd/MM/yyyy");

            IrrigacaoTrue = await _context.Irrigacao!.Where(p => p.Data == strData && p.Irrigado).FirstOrDefaultAsync();
            IrrigacaoFalse = await _context.Irrigacao!.Where(p => p.Data == strData && !p.Irrigado).FirstOrDefaultAsync();
            
            int? idFalse, idTrue;
            if(IrrigacaoTrue == null && IrrigacaoFalse == null) {

                Irrigacao irrigacaoTrue = new() {
                    Data = DateTime.Now.ToString("dd/MM/yyyy"),
                    Irrigado = true
                };

                Irrigacao irrigacaoFalse = new() {
                    Data = DateTime.Now.ToString("dd/MM/yyyy"),
                    Irrigado = false
                };

                try {
                    await _context.Irrigacao!.AddAsync(irrigacaoTrue);
                    await _context.Irrigacao!.AddAsync(irrigacaoFalse);
                    await _context.SaveChangesAsync();
                } catch(DbUpdateException) {
                    return RedirectToPage("/Calendario/CalendarioPrincipal");
                }

                idFalse = irrigacaoFalse.Id;
                idTrue = irrigacaoTrue.Id;
            } else {
                idFalse = IrrigacaoFalse!.Id;
                idTrue = IrrigacaoTrue!.Id;
            }
            
            foreach(var userPlanta in UserPlantas) {
                var plantaIrr = await _context.IrrigacaoPlantas!.Include(y => y.Irrigacao)
                                                                .Where(p => p.PlantaId == userPlanta.PlantaId 
                                                                && p.UserId == userPlanta.UserId 
                                                                && (p.IrrigacaoId == idFalse || p.IrrigacaoId == idTrue)
                                                                && p.Irrigacao!.Data!.Equals(strData))
                                                                .FirstOrDefaultAsync();
                if(plantaIrr == null) {
                    IrrigacaoPlanta irrigacaoPlanta = new() {
                        PlantaId = userPlanta.PlantaId,
                        UserId = userPlanta.UserId,
                        IrrigacaoId = idFalse
                    };
                    try {
                        await _context.IrrigacaoPlantas!.AddAsync(irrigacaoPlanta);
                        await _context.SaveChangesAsync();
                    } catch (DbUpdateException) {
                        return Page();
                    }
                }
            }

            return Page();
        }
    }

}