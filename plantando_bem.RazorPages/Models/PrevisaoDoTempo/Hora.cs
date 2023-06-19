using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.PrevisaoDoTempo
{
    public class Hora
    {
        [JsonProperty("time_epoch")]
        public int TempoEpoca { get; set; }
        [JsonProperty("time")]
        public string? Tempo { get; set; }
        [JsonProperty("temp_c")]
        public double TemperaturaEmC { get; set; }
        [JsonProperty("temp_f")]
        public double TemperaturaEmF { get; set; }
        [JsonProperty("is_day")]
        public int EstaDia { get; set; }
        [JsonProperty("condition")]
        public Condicao? CondicaoTempo { get; set; }
        [JsonProperty("wind_kph")]
        public double VelocVentoKmph { get; set; }
        [JsonProperty("wind_degree")]
        public double GrausVento { get; set; }
        [JsonProperty("wind_dir")]
        public string? DirecaoVento { get; set; }
        [JsonProperty("pressure_mb")]
        public double PressaoMb { get; set; }
        [JsonProperty("precip_mm")]
        public double PrecipitacaoMm { get; set; }
        [JsonProperty("humidity")]
        public double Humidade { get; set; }
        [JsonProperty("cloud")]
        public int Nuvens { get; set; }
        [JsonProperty("feelslike_c")]
        public double SensacaoGrausC { get; set; }
        [JsonProperty("will_it_rain")]
        public int EstaChovendo { get; set; }
        [JsonProperty("chance_of_rain")]
        public int ChanceDeChuva { get; set; }
        [JsonProperty("uv")]
        public double UV { get; set; }
    }
}