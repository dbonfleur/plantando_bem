using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Areas.Identity.Data;

namespace plantando_bem.RazorPages.Pages.Calendario
{
    [Authorize]
    public class CalendarioPrincipal : PageModel
    {
        private readonly ILogger<CalendarioPrincipal> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public CalendarioPrincipal(ILogger<CalendarioPrincipal> logger, 
                                    IdentityDataContext context,
                                    UserManager<IdentityUser> userManager)
        {
            _logger = logger;
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            string weatherApiKey = "29ce5cbd6dd841ae924115448230506";
            var usuario = await _context.User!.Include(p => p.Cidade).Include(p => p.Cidade!.Microrregiao).FirstOrDefaultAsync(k => k.Nome == User.Identity!.Name);
            string nomeCidade = usuario!.Cidade!.Microrregiao!.Nome!.Replace(" ", "_");

            using (HttpClient client = new HttpClient())
            {
                try
                {
                    string apiUrl = $"https://api.weatherapi.com/v1/current.json?key={weatherApiKey}&q={nomeCidade}";
                    HttpResponseMessage response = await client.GetAsync(apiUrl);

                    if (response.IsSuccessStatusCode)
                    {
                        string json = await response.Content.ReadAsStringAsync();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Ocorreu um erro ao fazer a requisição: {ex.Message}");
                }
                
                return Page(); 
            }
        }
    }
}