using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace plantando_bem.RazorPages.Pages.Pragas
{
    [Authorize]
    public class InformacoesPragas : PageModel
    {
        private readonly ILogger<InformacoesPragas> _logger;

        public InformacoesPragas(ILogger<InformacoesPragas> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}