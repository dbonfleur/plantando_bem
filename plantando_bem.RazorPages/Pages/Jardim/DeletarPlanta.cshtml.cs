using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using plantando_bem.RazorPages.Areas.Identity.Data;

namespace plantando_bem.RazorPages.Pages.Jardim
{
    [Authorize]
    public class DeletarPlanta : PageModel
    {
        private readonly ILogger<DeletarPlanta> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public DeletarPlanta(IHttpContextAccessor httpContextAccessor, ILogger<DeletarPlanta> logger, IdentityDataContext context, UserManager<IdentityUser> userManager)
        {
            _logger = logger;
            _context = context;
            _userManager = userManager;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            HttpContext httpCont = _httpContextAccessor.HttpContext!;

            var userNet = await _userManager.GetUserAsync(httpCont.User);
            var usuario = await _context.User!.FirstAsync(t => t.IdNetUser == userNet!.Id);

            var userPlanta = await _context.UserPlantas!.FirstAsync(p => p.PlantaId == id && p.UserId == usuario.Id);
            var irrPlantas = await _context.IrrigacaoPlantas!.Where(l => l.PlantaId == id && l.UserId == usuario.Id).ToListAsync();

            try {
                foreach(var irrPlanta in irrPlantas)
                    _context.IrrigacaoPlantas!.Remove(irrPlanta);
                _context.UserPlantas!.Remove(userPlanta);
                await _context.SaveChangesAsync();
            } catch(DbException) {
                TempData["ErroDeletarPlanta"] = "Um erro aconteceu ao deletar a planta!";
            }

            return RedirectToPage("/Jardim/MeuJardim");
        }
    }
}