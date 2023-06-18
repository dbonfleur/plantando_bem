using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using plantando_bem.RazorPages.Areas.Identity.Data;
using plantando_bem.RazorPages.Models.WeatherForecast;

namespace plantando_bem.RazorPages.Pages.Calendario
{
    [Authorize]
    public class CalendarioPrevisaoTempo : PageModel
    {
        private readonly ILogger<CalendarioPrevisaoTempo> _logger;
        private readonly IdentityDataContext _context;
        private readonly IHttpClientFactory _clientFactory;
        [BindProperty]
        public WeatherData PrevisaoTempo { get; set; } = new();

        public CalendarioPrevisaoTempo(IdentityDataContext context, ILogger<CalendarioPrevisaoTempo> logger, IHttpClientFactory clientFactory)
        {
            _logger = logger;
            _context = context;
            _clientFactory = clientFactory;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            string apiKey = "29ce5cbd6dd841ae924115448230506";
            var usuario = await _context.User!.Include(p => p.Cidade).Include(p => p.Cidade!.Microrregiao).FirstOrDefaultAsync(k => k.Nome == User.Identity!.Name);
            string location = usuario!.Cidade!.Microrregiao!.Nome!.Replace(" ", "_");
            int numberOfDays = 5;

            string url = $"https://api.weatherapi.com/v1/forecast.json?key={apiKey}&q={location}&days={numberOfDays}";

            var client = _clientFactory.CreateClient();
            var response = await client.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                var json = await response.Content.ReadAsStringAsync();
                PrevisaoTempo = JsonConvert.DeserializeObject<WeatherData>(json)!;
                
                return Page();
            }

            return Content("Error retrieving weather forecast");
        }
    }
}