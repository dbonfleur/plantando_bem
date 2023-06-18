using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.WeatherForecast
{
    public class Hour
    {
        [JsonProperty("time_epoch")]
        public int TimeEpoch { get; set; }

        [JsonProperty("time")]
        public string? Time { get; set; }

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
        public double PrecipitationMm { get; set; }

        [JsonProperty("precip_in")]
        public double PrecipitationIn { get; set; }

        [JsonProperty("humidity")]
        public double Humidity { get; set; }

        [JsonProperty("cloud")]
        public int Cloud { get; set; }

        [JsonProperty("feelslike_c")]
        public double FeelsLikeC { get; set; }

        [JsonProperty("feelslike_f")]
        public double FeelsLikeF { get; set; }

        [JsonProperty("windchill_c")]
        public double WindChillC { get; set; }

        [JsonProperty("windchill_f")]
        public double WindChillF { get; set; }

        [JsonProperty("heatindex_c")]
        public double HeatIndexC { get; set; }

        [JsonProperty("heatindex_f")]
        public double HeatIndexF { get; set; }

        [JsonProperty("dewpoint_c")]
        public double DewPointC { get; set; }

        [JsonProperty("dewpoint_f")]
        public double DewPointF { get; set; }

        [JsonProperty("will_it_rain")]
        public int WillItRain { get; set; }

        [JsonProperty("chance_of_rain")]
        public int ChanceOfRain { get; set; }

        [JsonProperty("will_it_snow")]
        public int WillItSnow { get; set; }

        [JsonProperty("chance_of_snow")]
        public int ChanceOfSnow { get; set; }

        [JsonProperty("vis_km")]
        public double VisibilityKm { get; set; }

        [JsonProperty("vis_miles")]
        public double VisibilityMiles { get; set; }

        [JsonProperty("gust_mph")]
        public double GustMph { get; set; }

        [JsonProperty("gust_kph")]
        public double GustKph { get; set; }

        [JsonProperty("uv")]
        public double UV { get; set; }
    }
}