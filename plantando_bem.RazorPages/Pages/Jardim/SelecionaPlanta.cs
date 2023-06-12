using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models.Jardim;

namespace plantando_bem.RazorPages.Pages.Jardim
{

    [Authorize]
    public class SelecionaPlanta : PageModel
    {
        private readonly ILogger<SelecionaPlanta> _logger;
        private readonly IdentityDataContext _context;
        [BindProperty]
        public List<Planta> Plantas { get; set; } = new();

        public SelecionaPlanta(ILogger<SelecionaPlanta> logger, IdentityDataContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            Plantas = await _context.Planta!
                                    .Include(p => p.Dias)
                                    .Include(k => k.EpocasRegiao)
                                    .ToListAsync();
            return Page();
        }
    }
}