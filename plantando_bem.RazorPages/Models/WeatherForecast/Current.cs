using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.WeatherForecast
{
    public class Current
    {
        [JsonProperty("last_updated_epoch")]
        public int LastUpdatedEpoch { get; set; }

        [JsonProperty("last_updated")]
        public string? LastUpdated { get; set; }

        [JsonProperty("temp_c")]
        public double TemperatureC { get; set; }

        [JsonProperty("temp_f")]
        public double TemperatureF { get; set; }

        [JsonProperty("is_day")]
        public int IsDay { get; set; }

        [JsonProperty("condition")]
        public Condition? WeatherCondition { get; set; }

        [JsonProperty("wind_mph")]
        public double WindSpeedMph { get; set; }

        [JsonProperty("wind_kph")]
        public double WindSpeedKph { get; set; }

        [JsonProperty("wind_degree")]
        public double WindDegree { get; set; }

        [JsonProperty("wind_dir")]
        public string? WindDirection { get; set; }

        [JsonProperty("pressure_mb")]
        public double PressureMb { get; set; }

        [JsonProperty("pressure_in")]
        public double PressureIn { get; set; }

        [JsonProperty("precip_mm")]
        public string? PrecipitationMm { get; set; }

        [JsonProperty("precip_in")]
        public string? PrecipitationIn { get; set; }

        [JsonProperty("humidity")]
        public double Humidity { get; set; }

        [JsonProperty("cloud")]
        public double Cloud { get; set; }

        [JsonProperty("feelslike_c")]
        public double FeelsLikeC { get; set; }

        [JsonProperty("feelslike_f")]
        public double FeelsLikeF { get; set; }

        [JsonProperty("vis_km")]
        public double VisibilityKm { get; set; }

        [JsonProperty("vis_miles")]
        public double VisibilityMiles { get; set; }

        [JsonProperty("uv")]
        public double UV { get; set; }

        [JsonProperty("gust_mph")]
        public double GustMph { get; set; }

        [JsonProperty("gust_kph")]
        public double GustKph { get; set; }
    }
}