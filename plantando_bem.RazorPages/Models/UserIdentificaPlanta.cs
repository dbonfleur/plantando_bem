using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using plantando_bem.RazorPages.Models.Identifica;

namespace plantando_bem.RazorPages.Models
{
    public class UserIdentificaPlanta
    {
        public int? UserPostId { get; set; }
        public int? PlantaIdentificaId { get; set; }
        public int? UserDescId { get; set; }
        public UserModel? UserPost { get; set; }
        public PlantaIdentifica? PlantaIdentifica { get; set; }
    }
}