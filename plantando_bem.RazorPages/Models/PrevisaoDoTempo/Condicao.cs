using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.PrevisaoDoTempo
{
    public class Condicao
    {
        [JsonProperty("text")]
        public string? Texto { get; set; }
        [JsonProperty("icon")]
        public string? Icone { get; set; }
        [JsonProperty("code")]
        public int Codigo { get; set; }
    }
}