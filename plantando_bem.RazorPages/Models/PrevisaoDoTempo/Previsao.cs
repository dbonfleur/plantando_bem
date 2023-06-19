using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.PrevisaoDoTempo
{
    public class Previsao
    {
        [JsonProperty("forecastday")]
        public List<PrevisaoDia>? PrevisaoDias { get; set; }
    }
}