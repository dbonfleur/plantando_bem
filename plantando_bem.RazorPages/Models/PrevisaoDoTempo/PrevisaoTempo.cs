using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.PrevisaoDoTempo
{
    public class PrevisaoTempo
    {
        [JsonProperty("location")]
        public Localidade? Localidade { get; set; }
        [JsonProperty("current")]
        public PrevisaoAtual? PrevisaoAtual { get; set; }
        [JsonProperty("forecast")]
        public Previsao? Previsao { get; set; }
    }
}