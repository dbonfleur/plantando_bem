using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;

namespace plantando_bem.RazorPages.Pages.Identifica
{
    [Authorize]
    public class IdentificaMinhasPlantas : PageModel
    {
        private readonly ILogger<IdentificaMinhasPlantas> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        [BindProperty]
        public List<UserIdentificaPlanta>? UserIdentPlantas { get; set; }
        public IdentificaMinhasPlantas(IHttpContextAccessor httpContextAccessor, ILogger<IdentificaMinhasPlantas> logger, IdentityDataContext context, UserManager<IdentityUser> userManager)
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
            
            UserIdentPlantas = await _context.UserIdentificaPlanta!
                                             .Include(k => k.PlantaIdentifica)
                                             .Where(p => p.UserPostId == user.Id)
                                             .ToListAsync();

            return Page();
        }
    }
}