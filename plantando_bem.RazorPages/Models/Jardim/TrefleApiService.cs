using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using RestSharp;

namespace plantando_bem.RazorPages.Models.Jardim
{
    public class TrefleApiService
    {
        private const string BaseUrl = "https://trefle.io";
        private const string Token = "e7Q9B8US9UjMPkyOuLmzfyxbhzE7zC5TIutBXRU4RqY";

        private readonly RestClient _client;

        public TrefleApiService()
        {
            _client = new RestClient(BaseUrl);
        }

        public async Task<List<Planta>> ObterPlantas()
        {
            var request = new RestRequest("/api/v1/plants", Method.Get);
            request.AddParameter("token", Token);

            var response = await _client.ExecuteAsync<List<Planta>>(request);

            if (response.IsSuccessful) {
                
            }
                return response.Data!;

            throw new Exception("Falha ao obter as plantas da API.");
        }
    }
}