using System.ComponentModel.DataAnnotations.Schema;

namespace plantando_bem.RazorPages.Models.Jardim
{
    public class Irrigacao
    {
        public int? Id { get; set; }
        public string? Data { get; set; }
        public bool Irrigado { get; set; }
        [NotMapped]
        public ICollection<IrrigacaoPlanta>? IrrigacaoPlantas { get; set; }
    }
}