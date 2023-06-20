using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using plantando_bem.RazorPages.Models;

namespace plantando_bem.RazorPages.Pages.Identifica
{
    [Authorize]
    public class IdentificaPlanta : PageModel
    {
        private readonly ILogger<IdentificaPlanta> _logger;
        [BindProperty]
        public PlantaIdentifica? IdentPlanta { get; set; } = new();
        public IdentificaPlanta(ILogger<IdentificaPlanta> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync(List<IFormFile> files)
        {
            if (files != null && files.Count > 0)
            {
                var file = files[0]; // Assume apenas um arquivo

                if (file.Length > 0)
                {
                    using (var memoryStream = new MemoryStream())
                    {
                        await file.CopyToAsync(memoryStream);
                        IdentPlanta!.Imagem = memoryStream.ToArray();
                        // Salve a imagem no banco de dados aqui
                    }
                }
                
            }

            // Se não houver arquivo enviado, retorne à página de upload
            return Page();
        }
    }
}