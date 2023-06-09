using System.ComponentModel.DataAnnotations.Schema;
using plantando_bem.RazorPages.Models.Jardim;
using plantando_bem.RazorPages.Models.Localidades;

namespace plantando_bem.RazorPages.Models
{
    public class UserModel
    {
        public int? Id { get; set; }
        public string? Nome { get; set; }
        public int? IdEstado { get; set; }
        public int? IdCidade { get; set; }
        public string? IdNetUser { get; set; }
        public EstadoModel? Estado { get; set; }
        public CidadeModel? Cidade { get; set; }
        [NotMapped]
        public ICollection<UserPlantas>? UsuarioPlantas { get; set; }
        [NotMapped]
        public ICollection<IrrigacaoPlanta>? IrrigacaoPlantas { get; set; }
    }
}