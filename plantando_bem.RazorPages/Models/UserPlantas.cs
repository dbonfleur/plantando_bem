using plantando_bem.RazorPages.Models.Jardim;

namespace plantando_bem.RazorPages.Models
{
    public class UserPlantas
    {
        public int? UserId { get; set; }
        public int? PlantaId { get; set; }
        public UserModel? User { get; set; }
        public Planta? Planta { get; set; }
        public string? DataInicio { get; set; }
        public string? DataFinalMin { get; set; }
        public string? DataFinalMax { get; set; }
        public string RetornaIdPng() {
            return PlantaId + ".png";
        }
    }
}