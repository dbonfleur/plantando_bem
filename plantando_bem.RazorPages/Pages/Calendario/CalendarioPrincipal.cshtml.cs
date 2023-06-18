using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;

namespace plantando_bem.RazorPages.Pages.Calendario
{
    [Authorize]
    public class CalendarioPrincipal : PageModel
    {
        private readonly ILogger<CalendarioPrincipal> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        
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

            return Page();
        }
    }

}