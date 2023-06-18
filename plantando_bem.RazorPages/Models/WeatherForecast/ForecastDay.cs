using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.WeatherForecast
{
    public class ForecastDay
    {
        [JsonProperty("date")]
        public string? Date { get; set; }
        [JsonProperty("date_epoch")]
        public int DateEpoch { get; set; }
        [JsonProperty("day")]
        public Day? Day { get; set; }
        [JsonProperty("astro")]
        public Astro? Astro { get; set; }
        [JsonProperty("hour")]
        public List<Hour>? Hours { get; set; }
    }
}