namespace plantando_bem.RazorPages.Models.Localidades
{
    public class MicrorregiaoModel
    {
        public int Id { get; set; }
        public string? Nome { get; set; }
        public MesorregiaoModel? Mesorregiao { get; set; }
    }
}