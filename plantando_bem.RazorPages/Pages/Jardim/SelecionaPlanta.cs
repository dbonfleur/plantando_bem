using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;
using plantando_bem.RazorPages.Models.Jardim;
using plantando_bem.RazorPages.Models.Localidades;

namespace plantando_bem.RazorPages.Pages.Jardim
{

    [Authorize]
    public class SelecionaPlanta : PageModel
    {
        private readonly ILogger<SelecionaPlanta> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        [BindProperty]
        public string? Epoca { get; set; }
        [BindProperty]
        public RegiaoModel RegiaoUser { get; set; } = new();
        [BindProperty]
        public List<Planta> Plantas { get; set; } = new();

        public SelecionaPlanta(IHttpContextAccessor httpContextAccessor, ILogger<SelecionaPlanta> logger, IdentityDataContext context, UserManager<IdentityUser> userManager)
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
            var user = await _context.User!.Include(p => p.Estado).FirstAsync(t => t.IdNetUser == userNet!.Id);
            RegiaoUser = await _context.Regiao!.FirstAsync(l => l.Id == user.Estado!.IdRegiao);
            
            Plantas = await _context.Planta!
                                    .Include(p => p.Dias)
                                    .Include(k => k.EpocasRegiao)
                                    .ToListAsync();
            
            return Page();
        }
    }
}