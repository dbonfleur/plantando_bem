using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace plantando_bem.RazorPages.Pages.Jardim
{
    [Authorize]
    public class MeuJardim : PageModel
    {
        private readonly ILogger<MeuJardim> _logger;

        public MeuJardim(ILogger<MeuJardim> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}