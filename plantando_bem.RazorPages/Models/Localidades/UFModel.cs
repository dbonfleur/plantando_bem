namespace plantando_bem.RazorPages.Models.Localidades
{
    public class UFModel
    {
        public int Id { get; set; }
        public string? Sigla { get; set; }
        public string? Nome { get; set; }
        public RegiaoModel? Regiao { get; set; }
    }
}