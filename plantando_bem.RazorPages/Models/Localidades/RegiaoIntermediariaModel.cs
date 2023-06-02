namespace plantando_bem.RazorPages.Models.Localidades
{
    public class RegiaoIntermediariaModel
    {
        public int Id { get; set; }
        public string? Nome { get; set; }
        public int? IdUF { get; set; }
        public UFModel? UF { get; set; }
    }
}