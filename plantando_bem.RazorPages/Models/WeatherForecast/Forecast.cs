using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.WeatherForecast
{
    public class Forecast
    {
        [JsonProperty("forecastday")]
        public List<ForecastDay>? ForecastDays { get; set; }
    }
}