using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Models;
using plantando_bem.RazorPages.Models.Jardim;
using plantando_bem.RazorPages.Models.Localidades;

namespace plantando_bem.RazorPages.Areas.Identity.Data;

public class IdentityDataContext : IdentityDbContext<IdentityUser>
{
    public DbSet<RegiaoModel>? Regiao { get; set; }
    public DbSet<UFModel>? UF { get; set; }
    public DbSet<RegiaoIntermediariaModel>?  RegiaoIntermediaria { get; set; }
    public DbSet<RegiaoImediataModel>? RegiaoImediata { get; set; }
    public DbSet<MicrorregiaoModel>? Microrregiao { get; set; }
    public DbSet<MesorregiaoModel>? Mesorregiao { get; set; }
    public DbSet<EstadoModel>? Estado { get; set; }
    public DbSet<CidadeModel>? Cidade { get; set; }
    public DbSet<UserModel>? User { get; set; }
    public DbSet<DiasPlanta>? DiasPlanta { get; set; }
    public DbSet<EpocaRegiao>? EpocaRegiao { get; set; }
    public DbSet<Planta>? Planta { get; set; }
    private readonly IConfiguration _configuration;
    public IdentityDataContext(DbContextOptions<IdentityDataContext> options, IConfiguration configuration)
        : base(options)
    {
        _configuration = configuration;
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            optionsBuilder.UseSqlServer(_configuration.GetConnectionString("DefaultConnection"));
        }
    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        
        builder.Entity<UserModel>().ToTable("User").HasKey(k => k.Id);
        builder.Entity<UserModel>().Property(o => o.Id).ValueGeneratedOnAdd();
        builder.Entity<UserModel>().HasOne(e => e.Cidade).WithMany().HasForeignKey("IdCidade");
        builder.Entity<UserModel>().HasOne(e => e.Estado).WithMany().HasForeignKey("IdEstado");
        builder.Entity<RegiaoModel>().ToTable("Regiao").HasKey(k => k.Id);
        builder.Entity<UFModel>().ToTable("UF").HasKey(k => k.Id);
        builder.Entity<UFModel>().HasOne(e => e.Regiao).WithMany().HasForeignKey("IdRegiao");
        builder.Entity<RegiaoIntermediariaModel>().ToTable("RegiaoIntermediaria").HasKey(k => k.Id);
        builder.Entity<RegiaoIntermediariaModel>().HasOne(e => e.UF).WithMany().HasForeignKey("IdUF");
        builder.Entity<RegiaoImediataModel>().ToTable("RegiaoImediata").HasKey(k => k.Id);
        builder.Entity<RegiaoImediataModel>().HasOne(e => e.RegiaoIntermediaria).WithMany().HasForeignKey("IdRegiaoInt");
        builder.Entity<MesorregiaoModel>().ToTable("Mesorregiao").HasKey(k => k.Id);
        builder.Entity<MesorregiaoModel>().HasOne(e => e.UF).WithMany().HasForeignKey("IdUF");
        builder.Entity<MicrorregiaoModel>().ToTable("Microrregiao").HasKey(k => k.Id);
        builder.Entity<MicrorregiaoModel>().HasOne(e => e.Mesorregiao).WithMany().HasForeignKey("IdMessorregiao");
        builder.Entity<EstadoModel>().ToTable("Estado").HasKey(k => k.Id);
        builder.Entity<EstadoModel>().HasOne(e => e.Regiao).WithMany().HasForeignKey("IdRegiao");
        builder.Entity<CidadeModel>().ToTable("Cidade").HasKey(k => k.Id);
        builder.Entity<CidadeModel>().HasOne(e => e.Microrregiao).WithMany().HasForeignKey("IdMicrorregiao");
        builder.Entity<CidadeModel>().HasOne(e => e.RegiaoImediata).WithMany().HasForeignKey("IdRegiaoImediata");
        builder.Entity<DiasPlanta>().ToTable("DiasPlanta").HasKey(k => k.Id);
        builder.Entity<DiasPlanta>().Property(o => o.Id).ValueGeneratedOnAdd();
        builder.Entity<EpocaRegiao>().ToTable("EpocaRegiao").HasKey(k => k.Id);
        builder.Entity<EpocaRegiao>().Property(o => o.Id).ValueGeneratedOnAdd();
        builder.Entity<Planta>().ToTable("Planta").HasKey(k => k.Id);
        builder.Entity<Planta>().Property(o => o.Id).ValueGeneratedOnAdd();
        builder.Entity<Planta>().HasOne(e => e.Dias).WithMany().HasForeignKey("IdDias");
        builder.Entity<Planta>()
            .HasMany(k => k.EpocasRegiao)
            .WithMany()
            .UsingEntity<Dictionary<string, object>>(
                "EpocaRegiaoPlanta",
                j => j.HasOne<EpocaRegiao>().WithMany().HasForeignKey("IdEpocaRegiao"),
                k => k.HasOne<Planta>().WithMany().HasForeignKey("IdPlanta"),
                jK => {
                    jK.HasKey("IdEpocaRegiao", "IdPlanta");
                    jK.ToTable("EpocaRegiaoPlanta");
                }
            );
        builder.Entity<UserModel>()
            .HasMany(user => user.Plantas)
            .WithMany()
            .UsingEntity<Dictionary<string, object>>(
                "UserPlantas",
                j => j.HasOne<Planta>().WithMany().HasForeignKey("IdPlanta"),
                j => j.HasOne<UserModel>().WithMany().HasForeignKey("IdUser"),
                j =>
                {
                    j.HasKey("IdUser", "IdPlanta");
                    j.Property("DataInicio").HasColumnType("datetime");
                    j.Property("DataMinFinal").HasColumnType("datetime");
                    j.Property("DataMaxFinal").HasColumnType("datetime");
                    j.ToTable("UserPlantas");
                }
            );
    }
}
