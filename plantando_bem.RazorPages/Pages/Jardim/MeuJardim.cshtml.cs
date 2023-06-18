using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;

namespace plantando_bem.RazorPages.Pages.Jardim
{
    [Authorize]
    public class MeuJardim : PageModel
    {
        private readonly ILogger<MeuJardim> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        [BindProperty]
        public List<UserPlantas>? UserPlantas { get; set; } = new();
        [BindProperty]
        public UserModel? Usuario { get; set; } = new();

        public MeuJardim(IHttpContextAccessor httpContextAccessor, ILogger<MeuJardim> logger, IdentityDataContext context, UserManager<IdentityUser> userManager)
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
            Usuario = await _context.User!.Include(t => t.Estado).Include(m => m.Estado!.Regiao).FirstAsync(t => t.IdNetUser == userNet!.Id);

            UserPlantas = await _context.UserPlantas!
                                            .Where(u => u.UserId == Usuario.Id)
                                            .ToListAsync();

            for(int i=0; i<UserPlantas.Count; i++) {
                UserPlantas[i].Planta = await _context.Planta!.Include(r => r.Dias).Include(l => l.EpocasRegiao).FirstAsync(p => p.Id == UserPlantas[i].PlantaId);
            }

            return Page();
        }
    }
}