namespace plantando_bem.RazorPages.Models.Localidades
{
    public class EstadoModel
    {
        public int Id { get; set; }
        public string? Sigla { get; set; }
        public string? Nome { get; set; }
        public int? IdRegiao { get; set; }
        public RegiaoModel? Regiao { get; set; }
    }
}