using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace plantando_bem.RazorPages.Pages.Calendario
{
    [Authorize]
    public class CalendarioPrincipal : PageModel
    {
        private readonly ILogger<CalendarioPrincipal> _logger;

        public CalendarioPrincipal(ILogger<CalendarioPrincipal> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}