using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.PrevisaoDoTempo
{
    public class Localidade
    {
        [JsonProperty("name")]
        public string? Nome { get; set; }
        [JsonProperty("region")]
        public string? Regiao { get; set; }
        [JsonProperty("country")]
        public string? Pais { get; set; }
        [JsonProperty("lat")]
        public double Latitude { get; set; }
        [JsonProperty("lon")]
        public double Longitude { get; set; }
        [JsonProperty("tz_id")]
        public string? ZonaTempoId { get; set; }
        [JsonProperty("localtime")]
        public string? TempoLocal { get; set; }
    }
}