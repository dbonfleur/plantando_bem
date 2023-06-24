using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using plantando_bem.RazorPages.Areas.Identity.Data;

namespace plantando_bem.RazorPages.Pages.Identifica
{
    public class IdentificaRemoverPlanta : PageModel
    {
        private readonly ILogger<IdentificaRemoverPlanta> _logger;
        private readonly IdentityDataContext _context;

        public IdentificaRemoverPlanta(ILogger<IdentificaRemoverPlanta> logger, IdentityDataContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            var userIdentPlanta = await _context.UserIdentificaPlanta!.FirstAsync(k => k.PlantaIdentificaId == id);
            var identPlanta = await _context.PlantaIdentifica!.FirstAsync(k => k.Id == id);

            try {
                _context.UserIdentificaPlanta!.Remove(userIdentPlanta);
                _context.PlantaIdentifica!.Remove(identPlanta);
                await _context.SaveChangesAsync();
            }catch (DbUpdateException) {
                TempData["erroDeletar"] = "Erro ao deletar a imagem!";
            }

            return RedirectToPage("/Identifica/IdentificaMinhasPlantas");
        }
    }
}