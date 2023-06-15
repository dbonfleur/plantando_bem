namespace plantando_bem.RazorPages.Models.Jardim
{
    public class Planta
    {
        public int? Id { get; set; }
        public int? IdDias { get; set; }
        public DiasPlanta? Dias { get; set; }
        public List<EpocaRegiao>? EpocasRegiao { get; set; }
        public ICollection<UserPlantas>? UsuariosPlantas { get; set; }
        public string? Nome { get; set; }
        public string? NomeCientifico { get; set; }
        public string? Descricao { get; set; }
        public string? RegiaoPlantio { get; set; }
        public string? RecomAprov { get; set; }
    }
}