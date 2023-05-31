using plantando_bem.RazorPages.Models.Localidades;

namespace plantando_bem.RazorPages.Models
{
    public class UserModel
    {
        public string? Nome { get; set; }
        public int? IdEstado { get; set; }
        public EstadoModel? Estado { get; set; }
        public CidadeModel? Cidade { get; set; }
    }
}