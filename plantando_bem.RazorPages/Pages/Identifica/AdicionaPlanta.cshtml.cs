using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace plantando_bem.RazorPages.Pages.Identifica
{
    public class AdicionaPlanta : PageModel
    {
        private readonly ILogger<AdicionaPlanta> _logger;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public AdicionaPlanta(ILogger<AdicionaPlanta> logger, IWebHostEnvironment webHostEnvironment)
        {
            _logger = logger;
            _webHostEnvironment = webHostEnvironment;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync(IFormFile file)
        {
            if (file != null && file.Length > 0)
            {

                // Crie um caminho único para salvar o arquivo
                string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "uploads");
                string uniqueFileName = GetUniqueFileName(file.FileName);
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                // Salve o arquivo no disco
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(fileStream);
                }

                // Realize qualquer processamento adicional necessário com o arquivo

                // Redirecione para uma página de sucesso ou exiba uma mensagem de sucesso
                return RedirectToPage("Sucesso");
            }

            // Se não houver arquivo selecionado, exiba uma mensagem de erro
            ModelState.AddModelError("file", "Nenhum arquivo selecionado.");
            return Page();
        }

        private string GetUniqueFileName(string fileName)
        {
            // Implemente a lógica para gerar um nome de arquivo exclusivo
            // Aqui está um exemplo simples que adiciona um prefixo único (timestamp) ao nome do arquivo
            string timestamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");
            return $"{timestamp}_{fileName}";
        }
    }
}