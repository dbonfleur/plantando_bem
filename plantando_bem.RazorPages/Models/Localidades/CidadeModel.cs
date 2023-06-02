using Newtonsoft.Json;

namespace plantando_bem.RazorPages.Models.Localidades
{
    public class CidadeModel
    {
        public int Id { get; set; }
        public string? Nome { get; set; }
        public int? IdMicrorregiao { get; set; }
        public int? IdRegiaoImediata { get; set; }
        public MicrorregiaoModel? Microrregiao { get; set; }
        [JsonProperty("regiao-imediata")]
        public RegiaoImediataModel? RegiaoImediata { get; set; }
    }
}