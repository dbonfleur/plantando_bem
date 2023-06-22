using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace plantando_bem.RazorPages.Pages.Identifica
{
    public class IdentificaPlantaUsers : PageModel
    {
        private readonly ILogger<IdentificaPlantaUsers> _logger;

        public IdentificaPlantaUsers(ILogger<IdentificaPlantaUsers> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}