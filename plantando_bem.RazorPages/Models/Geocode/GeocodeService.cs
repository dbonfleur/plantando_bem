using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace plantando_bem.RazorPages.Models.Geocode
{
    public interface IGeocodeService
    {
        Task<GeocodeResult> GetCoordinates(string city);
    }

    public class GeocodeService : IGeocodeService
    {
        private readonly HttpClient _httpClient;

        public GeocodeService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<GeocodeResult> GetCoordinates(string city)
        {
            string apiUrl = $"https://nominatim.openstreetmap.org/search?q={Uri.EscapeDataString(city)}&format=json&limit=1";

            var response = await _httpClient.GetFromJsonAsync<GeocodeResponse>(apiUrl);

            if (response?.Results?.Count > 0)
            {
                return response.Results[0];
            }

            return null!;
        }
    }
}