using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using plantando_bem.RazorPages.Areas.Identity.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Models.Praga;

namespace plantando_bem.RazorPages.Pages.Pragas
{
    [Authorize]
    public class InformacoesPragas : PageModel
    {
        private readonly ILogger<InformacoesPragas> _logger;
        private readonly IdentityDataContext _context;
        [BindProperty]
        public List<PragaModel>? Pragas { get; set; }
        public InformacoesPragas(ILogger<InformacoesPragas> logger, IdentityDataContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            Pragas = await _context.Pragas!.ToListAsync();
            return Page();
        }
    }
}