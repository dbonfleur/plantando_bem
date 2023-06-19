using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;
using plantando_bem.RazorPages.Models.Jardim;

namespace plantando_bem.RazorPages.Pages.IrrigacaoJardim
{
    [Authorize]
    public class Irrigacoes : PageModel
    {
        private readonly ILogger<Irrigacoes> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        [BindProperty]
        public List<IrrigacaoPlanta>? IrrigacaoPlantas { get; set; }
        public Irrigacoes(ILogger<Irrigacoes> logger, 
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
            var usuario = await _context.User!.FirstAsync(t => t.IdNetUser == userNet!.Id);
            var strData = DateTime.Now.ToString("dd/MM/yyyy");

            IrrigacaoPlantas = await _context.IrrigacaoPlantas!
                                            .Include(o => o.Planta)
                                            .Include(i => i.Irrigacao)
                                            .Where(k => k.UserId == usuario.Id && k.Irrigacao!.Data == strData)
                                            .ToListAsync();

            for(int i=0;i<IrrigacaoPlantas.Count;i++) {
                IrrigacaoPlantas[i].Planta!.IrrigacaoPlanta = null;
                IrrigacaoPlantas[i].Planta!.UsuariosPlantas = null;
                IrrigacaoPlantas[i].Usuario!.IrrigacaoPlantas = null;
                IrrigacaoPlantas[i].Usuario!.UsuarioPlantas = null;
                IrrigacaoPlantas[i].Irrigacao!.IrrigacaoPlantas = null;
            }
            
            return Page();
        }
    }
}