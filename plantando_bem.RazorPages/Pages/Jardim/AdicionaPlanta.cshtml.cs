using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;

namespace plantando_bem.RazorPages.Pages.Jardim
{
    [Authorize]
    public class AdicionaPlanta : PageModel
    {
        private readonly ILogger<AdicionaPlanta> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public AdicionaPlanta(IHttpContextAccessor httpContextAccessor, ILogger<AdicionaPlanta> logger, IdentityDataContext context, UserManager<IdentityUser> userManager)
        {
            _logger = logger;
            _context = context;
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            HttpContext httpCont = _httpContextAccessor.HttpContext!;
            var planta = await _context.Planta!.Include(o => o.Dias).FirstAsync(t => t.Id == id);
            var userNet = await _userManager.GetUserAsync(httpCont.User);
            var user = await _context.User!.FirstAsync(t => t.IdNetUser == userNet!.Id);

            UserPlantas userPlanta = new() {
                UserId = user.Id,
                PlantaId = planta.Id,
                User = user,
                Planta = planta,
                DataInicio = DateTime.Now.ToString("dd/MM/yyyy"),
                DataFinalMin = DateTime.Now.AddDays((double) planta.Dias!.DiaMin!).ToString("dd/MM/yyyy"),
                DataFinalMax = DateTime.Now.AddDays((double) planta.Dias!.DiaMax!).ToString("dd/MM/yyyy")
            };
 
            try {
                await _context.AddAsync(userPlanta);
                await _context.SaveChangesAsync();
            } catch(DbUpdateException) {
                return RedirectToPage("/Error");
            }

            return RedirectToPage("/Jardim/MeuJardim");
        }
    }
}