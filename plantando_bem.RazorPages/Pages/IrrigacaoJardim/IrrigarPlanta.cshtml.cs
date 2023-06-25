using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using plantando_bem.RazorPages.Areas.Identity.Data;

namespace plantando_bem.RazorPages.Pages.IrrigacaoJardim
{
    [Authorize]
    public class IrrigarPlanta : PageModel
    {
        private readonly ILogger<IrrigarPlanta> _logger;
        private readonly IdentityDataContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public IrrigarPlanta(ILogger<IrrigarPlanta> logger, 
                            IdentityDataContext context,
                            UserManager<IdentityUser> userManager,
                            IHttpContextAccessor httpContextAccessor)
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
            var strData = DateTime.Now.ToString("dd/MM/yyyy");
            
            var irrigacaoTrue = await _context.Irrigacao!.FirstAsync(p => p.Data!.Equals(strData) && p.Irrigado == true);

            var irrPlanta = await _context.IrrigacaoPlantas!.Include(u => u.Irrigacao).Where(k => k.PlantaId == id && 
                                                                                             k.UserId == usuario.Id &&
                                                                                             k.Irrigacao!.Data!.Equals(strData))
                                                                                             .FirstOrDefaultAsync();
            
            irrPlanta!.Irrigacao = irrigacaoTrue;

            try {
                _context.IrrigacaoPlantas!.Update(irrPlanta);
                await _context.SaveChangesAsync();
            } catch(DbUpdateException) {

            }
            
            return RedirectToPage("/IrrigacaoJardim/Irrigacoes");
        }
    }
}