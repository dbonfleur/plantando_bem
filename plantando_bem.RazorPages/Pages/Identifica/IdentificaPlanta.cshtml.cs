using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models;
using plantando_bem.RazorPages.Models.Identifica;

namespace plantando_bem.RazorPages.Pages.Identifica
{
    [Authorize]
    public class IdentificaPlanta : PageModel
    {
        private readonly ILogger<IdentificaPlanta> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public PlantaIdentifica? IdentPlanta { get; set; } = new();
        public IdentificaPlanta(IHttpContextAccessor httpContextAccessor, ILogger<IdentificaPlanta> logger, IdentityDataContext context, UserManager<IdentityUser> userManager)
        {
            _logger = logger;
            _context = context;
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
        }

        public void OnGet()
        {
            
        }

        public async Task<IActionResult> OnPostAsync(IFormFile file)
        {

            if (file.Length > 0)
            {
                HttpContext httpCont = _httpContextAccessor.HttpContext!;
                var userNet = await _userManager.GetUserAsync(httpCont.User);
                var user = await _context.User!.FirstAsync(t => t.IdNetUser == userNet!.Id);

                using var memoryStream = new MemoryStream();
                await file.CopyToAsync(memoryStream);
                IdentPlanta!.Imagem = memoryStream.ToArray();

                try {
                    await _context.PlantaIdentifica!.AddAsync(IdentPlanta);
                    await _context.SaveChangesAsync();
                }catch(DbUpdateException) {
                    TempData["erroSalvar"] = "Erro ao processar a imagem!";
                    return Page();
                }

                UserIdentificaPlanta usrIdentPlant = new () {
                    UserPostId = user.Id,
                    PlantaIdentificaId = IdentPlanta.Id
                };

                try {
                    await _context.UserIdentificaPlanta!.AddAsync(usrIdentPlant);
                    await _context.SaveChangesAsync();
                    TempData["successImg"] = "Imagem salva com sucesso! Aguarde para alguem identificá-la!";
                }catch(DbUpdateException) {
                    _context.PlantaIdentifica!.Remove(IdentPlanta);
                    TempData["erroImg"] = "Erro ao salvar a imagem!";
                    return Page();
                }
            }

            return Page();
        }
    }
}