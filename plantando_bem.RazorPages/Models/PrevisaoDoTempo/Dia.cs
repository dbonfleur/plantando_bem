using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.PrevisaoDoTempo
{
    public class Dia
    {
        [JsonProperty("maxtemp_c")]
        public double TempMaxC { get; set; }
        [JsonProperty("mintemp_c")]
        public double TempMinC { get; set; }
        [JsonProperty("avgtemp_c")]
        public double TempMediaC { get; set; }
        [JsonProperty("maxwind_kph")]
        public double MaxVentoKmph { get; set; }
        [JsonProperty("totalprecip_mm")]
        public double TotalPrecipitacaoMm { get; set; }
        [JsonProperty("avghumidity")]
        public double MediaHumidade { get; set; }
        [JsonProperty("daily_will_it_rain")]
        public int DiaComChuva { get; set; }
        [JsonProperty("daily_chance_of_rain")]
        public int ChaceDeChuva { get; set; }
        [JsonProperty("condition")]
        public Condicao? CondicaoTempo { get; set; }
        [JsonProperty("uv")]
        public double UV { get; set; }
    }
}