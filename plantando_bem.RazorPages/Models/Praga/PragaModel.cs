using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace plantando_bem.RazorPages.Models.Praga
{
    public class PragaModel
    {
        public int? Id { get; set; }
        public string? Nome { get; set; }
        public string? Descricao { get; set; }
        public string? Solucao { get; set; } 
    }
}