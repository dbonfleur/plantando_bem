using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace plantando_bem.RazorPages.Models.Jardim
{
    public class Planta
    {
        public string? Nome { get; set; }
        public string? NomeCientifico { get; set; }
        public string? Descricao { get; set; }
    }
}