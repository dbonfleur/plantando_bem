using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using plantando_bem.RazorPages.Models;
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
    }
}
