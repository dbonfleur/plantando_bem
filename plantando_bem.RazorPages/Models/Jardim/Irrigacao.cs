using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace plantando_bem.RazorPages.Models.Jardim
{
    public class Irrigacao
    {
        public int Id { get; set; }
        public DateTime Data { get; set; }
        public bool Irrigado { get; set; }
        public ICollection<IrrigacaoPlanta>? IrrigacaoPlantas { get; set; }
    }
}