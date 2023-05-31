namespace plantando_bem.RazorPages.Models.Localidades
{
    public class CidadeModel
    {
        public int Id { get; set; }
        public string? Nome { get; set; }
        public MicrorregiaoModel? Microrregiao { get; set; }
        public RegiaoImediataModel? RegiaoImediata { get; set; }
    }
}