using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using plantando_bem.RazorPages.Models.Jardim;

namespace plantando_bem.RazorPages.Pages.Jardim
{
    [Authorize]
    public class AdicionarPlanta : PageModel
    {
        private readonly ILogger<AdicionarPlanta> _logger;
        private readonly TrefleApiService _apiService;
        public List<Planta>? Plantas { get; set; } = new();

        public AdicionarPlanta(ILogger<AdicionarPlanta> logger, TrefleApiService apiService)
        {
            _logger = logger;
            _apiService = apiService;
        }

        public void OnGet()
        {
            //StringBuilder texto = new StringBuilder();
            List<string> texto = new List<string>();

            using (PdfReader reader = new PdfReader("D:/GitHub/plantando_bem/plantando_bem.RazorPages/wwwroot/pdf/Catalogo-hortalicas.pdf"))
            { 
                for (int i = 8; i <= reader.NumberOfPages - 3; i++)
                {
                    string pageText = PdfTextExtractor.GetTextFromPage(reader, i);
                    //int indiceInicio = pageText.IndexOf("Nome popular"); 
                    pageText = pageText.ReplaceLineEndings("");
                    int indiceInicio = pageText.IndexOf("me popular – ") + "me popular – ".Length;
                    int indiceFim = pageText.IndexOf("NNome");
                    var nomePop = pageText.Substring(indiceInicio, indiceFim - indiceInicio);

                    indiceInicio = pageText.IndexOf("científico –") + "científico – ".Length;
                    indiceFim = pageText.IndexOf("N...");
                    var nomeCient = pageText.Substring(indiceInicio, indiceFim - indiceInicio);

                    indiceInicio = pageText.IndexOf("Descrição –") + "Descrição –".Length;
                    indiceFim = pageText.IndexOf("Época e regiões para plantio –");
                    var descricao = pageText.Substring(indiceInicio, indiceFim - indiceInicio);
                    
                    indiceInicio = pageText.IndexOf("Época e regiões para plantio –") + "Época e regiões para plantio –".Length;
                    indiceFim = pageText.IndexOf("ÉPOCA MAIS RECOMENDADA");
                    if(indiceFim < 0)
                        indiceFim = pageText.IndexOf("ÉPOCA RECOMENDADA");
                    var epocaRegiao = pageText.Substring(indiceInicio, indiceFim - indiceInicio);

                    var nomeGrande = SubstituirAcentosMinusculos(nomePop); 
                    
                    // indiceInicio = pageText.IndexOf("Época e regiões para plantio –") + "Época e regiões para plantio –".Length;
                    // indiceFim = pageText.IndexOf("ÉPOCA MAIS RECOMENDADA");
                    // var epocaRegiao = pageText.Substring(indiceInicio, indiceFim - indiceInicio);
                    //texto.Add(pageText.Substring(indiceInicio)); 
                }
            }
        }

        string SubstituirAcentosMinusculos(string input)
        {
            StringBuilder sb = new StringBuilder();

            foreach (char c in input)
            {
                int category = c;
                if (category > 122)
                    sb.Append(c);
                else
                    sb.Append(c.ToString().ToUpperInvariant());
            }

            return sb.ToString();
        }
    }
}