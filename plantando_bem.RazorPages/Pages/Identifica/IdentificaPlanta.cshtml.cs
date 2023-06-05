using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace plantando_bem.RazorPages.Pages.Identifica
{
    [Authorize]
    public class IdentificaPlanta : PageModel
    {
        private readonly ILogger<IdentificaPlanta> _logger;

        public IdentificaPlanta(ILogger<IdentificaPlanta> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}