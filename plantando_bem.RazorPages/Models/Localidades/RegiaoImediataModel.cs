using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.Localidades
{
    public class RegiaoImediataModel
    {
        public int Id { get; set; }
        public string? Nome { get; set; }
        public int? IdRegiaoInt { get; set; }
        [JsonProperty("regiao-intermediaria")]
        public RegiaoIntermediariaModel? RegiaoIntermediaria { get; set; }

    }
}