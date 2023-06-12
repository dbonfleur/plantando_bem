using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;

namespace plantando_bem.RazorPages.Pages.Jardim
{
    public class AdicionaPlanta : PageModel
    {
        private readonly ILogger<AdicionaPlanta> _logger;
        private readonly IdentityDataContext _context;

        public AdicionaPlanta(ILogger<AdicionaPlanta> logger, IdentityDataContext context)
        {
            _logger = logger;
            _context = context;
        }

        public void OnGet(int? id)
        {
            var planta = _context.Planta!
                                    .Include(o => o.Dias)
                                    .Include(o => o.EpocasRegiao)
                                    .First(t => t.Id == id);
        }
    }
}