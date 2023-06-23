using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using plantando_bem.RazorPages.Models;
using plantando_bem.RazorPages.Areas.Identity.Data;
using Microsoft.EntityFrameworkCore;

namespace plantando_bem.RazorPages.Pages.Identifica
{
    public class IdentificaAdicionaDescricao : PageModel
    {
        private readonly ILogger<IdentificaAdicionaDescricao> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        [BindProperty]
        public UserIdentificaPlanta UserIdentPlanta { get; set; } = new();
        public IdentificaAdicionaDescricao(IHttpContextAccessor httpContextAccessor, ILogger<IdentificaAdicionaDescricao> logger, IdentityDataContext context, UserManager<IdentityUser> userManager)
        {
            _logger = logger;
            _context = context;
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            UserIdentPlanta = await _context.UserIdentificaPlanta!
                                            .Include(t => t.PlantaIdentifica)
                                            .Where(k => k.PlantaIdentificaId == id)
                                            .FirstAsync();
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            HttpContext httpCont = _httpContextAccessor.HttpContext!;
            var userNet = await _userManager.GetUserAsync(httpCont.User);
            var user = await _context.User!.FirstAsync(t => t.IdNetUser == userNet!.Id);

            var plantIdent = await _context.PlantaIdentifica!.FirstAsync(k => k.Id == id);
            var userPlantIdent = await _context.UserIdentificaPlanta!.FirstAsync(k => k.PlantaIdentificaId == id);

            plantIdent.Descricao = UserIdentPlanta.PlantaIdentifica!.Descricao;
            userPlantIdent.UserDescId = user.Id;

            try {
                _context.PlantaIdentifica!.Update(plantIdent);
                _context.UserIdentificaPlanta!.Update(userPlantIdent);
                await _context.SaveChangesAsync();
            }catch(DbUpdateException) {
                TempData["erroDescricao"] = "Erro ao adicionar a descrição!";
                return Page();
            }

            return RedirectToPage("/Identifica/IdentificaPlantaUsers");
        }
    }
}