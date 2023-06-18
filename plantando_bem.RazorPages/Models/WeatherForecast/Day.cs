using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.WeatherForecast
{
    public class Day
    {
        [JsonProperty("maxtemp_c")]
        public double MaxTemperatureC { get; set; }
        [JsonProperty("maxtemp_f")]
        public double MaxTemperatureF { get; set; }
        [JsonProperty("mintemp_c")]
        public double MinTemperatureC { get; set; }
        [JsonProperty("mintemp_f")]
        public double MinTemperatureF { get; set; }
        [JsonProperty("avgtemp_c")]
        public double AverageTemperatureC { get; set; }
        [JsonProperty("avgtemp_f")]
        public double AverageTemperatureF { get; set; }
        [JsonProperty("maxwind_mph")]
        public double MaxWindSpeedMph { get; set; }
        [JsonProperty("maxwind_kph")]
        public double MaxWindSpeedKph { get; set; }
        [JsonProperty("totalprecip_mm")]
        public double TotalPrecipitationMm { get; set; }
        [JsonProperty("totalprecip_in")]
        public double TotalPrecipitationIn { get; set; }
        [JsonProperty("totalsnow_cm")]
        public double TotalSnowCm { get; set; }
        [JsonProperty("avgvis_km")]
        public double AverageVisibilityKm { get; set; }
        [JsonProperty("avgvis_miles")]
        public double AverageVisibilityMiles { get; set; }
        [JsonProperty("avghumidity")]
        public double AverageHumidity { get; set; }
        [JsonProperty("daily_will_it_rain")]
        public int WillItRain { get; set; }
        [JsonProperty("daily_chance_of_rain")]
        public int ChanceOfRain { get; set; }
        [JsonProperty("daily_will_it_snow")]
        public int WillItSnow { get; set; }
        [JsonProperty("daily_chance_of_snow")]
        public int ChanceOfSnow { get; set; }
        [JsonProperty("condition")]
        public Condition? WeatherCondition { get; set; }
        [JsonProperty("uv")]
        public double UV { get; set; }
    }
}