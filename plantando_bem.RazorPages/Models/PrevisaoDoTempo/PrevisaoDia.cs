using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.PrevisaoDoTempo
{
    public class PrevisaoDia
    {
        [JsonProperty("date")]
        public string? Data { get; set; }
        [JsonProperty("date_epoch")]
        public int DataEpoca { get; set; }
        [JsonProperty("day")]
        public Dia? Dia { get; set; }
        [JsonProperty("astro")]
        public Astro? Astro { get; set; }
        [JsonProperty("hour")]
        public List<Hora>? Horas { get; set; }
    }
}