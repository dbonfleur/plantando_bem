using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.PrevisaoDoTempo
{
    public class Astro
    {
        [JsonProperty("sunrise")]
        public string? NascerDoSol { get; set; }
        [JsonProperty("sunset")]
        public string? PorDoSol { get; set; }
        [JsonProperty("moonrise")]
        public string? NascerDaLua { get; set; }
        [JsonProperty("moonset")]
        public string? PorDaLua { get; set; }
        [JsonProperty("moon_phase")]
        public string? FaseDaLua { get; set; }
        [JsonProperty("moon_illumination")]
        public string? IluminacaoLua { get; set; }
    }
}