using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace plantando_bem.RazorPages.Models.Jardim
{
    public class IrrigacaoPlanta
    {
        public int IrrigacaoId { get; set; }
        public Irrigacao? Irrigacao { get; set; }
        public int PlantaId { get; set; }
        public Planta? Planta { get; set; }
        public int UserId { get; set; }
        public UserModel? Usuario { get; set; }
    }
}