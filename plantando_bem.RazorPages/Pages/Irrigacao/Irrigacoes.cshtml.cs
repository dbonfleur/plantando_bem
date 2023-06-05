using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace plantando_bem.RazorPages.Pages.Irrigacao
{
    [Authorize]
    public class Irrigacoes : PageModel
    {
        private readonly ILogger<Irrigacoes> _logger;

        public Irrigacoes(ILogger<Irrigacoes> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}