using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;

namespace plantando_bem.RazorPages.Pages.Identifica
{
    public class IdentificaPlantaUsers : PageModel
    {
        private readonly ILogger<IdentificaPlantaUsers> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        [BindProperty]
        public List<UserIdentificaPlanta>? UserIdentPlantas { get; set; }
        public IdentificaPlantaUsers(IHttpContextAccessor httpContextAccessor, ILogger<IdentificaPlantaUsers> logger, IdentityDataContext context, UserManager<IdentityUser> userManager)
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
                                             .Where(l => l.UserPostId != user.Id)
                                             .ToListAsync();

            return Page();
        }
    }
}