using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.WeatherForecast
{
    public class WeatherData
    {
        [JsonProperty("location")]
        public Location? Location { get; set; }
        [JsonProperty("current")]
        public Current? Current { get; set; }
        [JsonProperty("forecast")]
        public Forecast? Forecast { get; set; }
    }
}