using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;

namespace plantando_bem.RazorPages.Pages.Irrigacao
{
    [Authorize]
    public class Irrigacoes : PageModel
    {
        private readonly ILogger<Irrigacoes> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;

        [BindProperty]
        public List<UserPlantas>? UserPlantas { get; set; } = new();
        public Irrigacoes(ILogger<Irrigacoes> logger, 
                            IdentityDataContext context,
                            UserManager<IdentityUser> userManager,
                            IHttpContextAccessor httpContextAccessor)
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
            var user = await _context.User!.FirstAsync(t => t.IdNetUser == userNet!.Id);
            UserPlantas = await _context.UserPlantas!
                                        .Include(p => p.Planta)
                                        .Where(u => u.UserId == user.Id)
                                        .ToListAsync();
                                        
            return Page();
        }
    }
}