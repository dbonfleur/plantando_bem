using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.PrevisaoDoTempo
{
    public class PrevisaoAtual
    {
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
        [JsonProperty("pressure_in")]
        public double PressaoIn { get; set; }
        [JsonProperty("precip_mm")]
        public string? PrecipitacaoMm { get; set; }
        [JsonProperty("precip_in")]
        public string? PrecipitacaoIn { get; set; }
        [JsonProperty("humidity")]
        public double Humidade { get; set; }
        [JsonProperty("feelslike_c")]
        public double SensacaoGrausC { get; set; }
        [JsonProperty("uv")]
        public double UV { get; set; }
    }
}