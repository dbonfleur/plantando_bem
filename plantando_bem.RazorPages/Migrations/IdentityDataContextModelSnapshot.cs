﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using plantando_bem.RazorPages.Areas.Identity.Data;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    [DbContext(typeof(IdentityDataContext))]
    partial class IdentityDataContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder.HasAnnotation("ProductVersion", "7.0.5");

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRole", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("TEXT");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.Property<string>("NormalizedName")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("NormalizedName")
                        .IsUnique()
                        .HasDatabaseName("RoleNameIndex");

                    b.ToTable("AspNetRoles", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("ClaimType")
                        .HasColumnType("TEXT");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("TEXT");

                    b.Property<string>("RoleId")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetRoleClaims", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUser", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("TEXT");

                    b.Property<int>("AccessFailedCount")
                        .HasColumnType("INTEGER");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("TEXT");

                    b.Property<string>("Email")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.Property<bool>("EmailConfirmed")
                        .HasColumnType("INTEGER");

                    b.Property<bool>("LockoutEnabled")
                        .HasColumnType("INTEGER");

                    b.Property<DateTimeOffset?>("LockoutEnd")
                        .HasColumnType("TEXT");

                    b.Property<string>("NormalizedEmail")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.Property<string>("NormalizedUserName")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.Property<string>("PasswordHash")
                        .HasColumnType("TEXT");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("TEXT");

                    b.Property<bool>("PhoneNumberConfirmed")
                        .HasColumnType("INTEGER");

                    b.Property<string>("SecurityStamp")
                        .HasColumnType("TEXT");

                    b.Property<bool>("TwoFactorEnabled")
                        .HasColumnType("INTEGER");

                    b.Property<string>("UserName")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("NormalizedEmail")
                        .HasDatabaseName("EmailIndex");

                    b.HasIndex("NormalizedUserName")
                        .IsUnique()
                        .HasDatabaseName("UserNameIndex");

                    b.ToTable("AspNetUsers", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("ClaimType")
                        .HasColumnType("TEXT");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("TEXT");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserClaims", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128)
                        .HasColumnType("TEXT");

                    b.Property<string>("ProviderKey")
                        .HasMaxLength(128)
                        .HasColumnType("TEXT");

                    b.Property<string>("ProviderDisplayName")
                        .HasColumnType("TEXT");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("LoginProvider", "ProviderKey");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserLogins", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("TEXT");

                    b.Property<string>("RoleId")
                        .HasColumnType("TEXT");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetUserRoles", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("TEXT");

                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128)
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasMaxLength(128)
                        .HasColumnType("TEXT");

                    b.Property<string>("Value")
                        .HasColumnType("TEXT");

                    b.HasKey("UserId", "LoginProvider", "Name");

                    b.ToTable("AspNetUserTokens", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.CidadeModel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdMicrorregiao")
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdRegiaoImediata")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("IdMicrorregiao");

                    b.HasIndex("IdRegiaoImediata");

                    b.ToTable("Cidade", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.EstadoModel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdRegiao")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.Property<string>("Sigla")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("IdRegiao");

                    b.ToTable("Estado", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.MesorregiaoModel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdUF")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("IdUF");

                    b.ToTable("Mesorregiao", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.MicrorregiaoModel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdMessorregiao")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("IdMessorregiao");

                    b.ToTable("Microrregiao", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.RegiaoImediataModel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdRegiaoInt")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("IdRegiaoInt");

                    b.ToTable("RegiaoImediata", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.RegiaoIntermediariaModel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdUF")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("IdUF");

                    b.ToTable("RegiaoIntermediaria", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.RegiaoModel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.Property<string>("Sigla")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Regiao", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.UFModel", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdRegiao")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.Property<string>("Sigla")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("IdRegiao");

                    b.ToTable("UF", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.UserModel", b =>
                {
                    b.Property<int?>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdCidade")
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdEstado")
                        .HasColumnType("INTEGER");

                    b.Property<int?>("IdNetUser")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("IdCidade");

                    b.HasIndex("IdEstado");

                    b.ToTable("User", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.CidadeModel", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.MicrorregiaoModel", "Microrregiao")
                        .WithMany()
                        .HasForeignKey("IdMicrorregiao");

                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.RegiaoImediataModel", "RegiaoImediata")
                        .WithMany()
                        .HasForeignKey("IdRegiaoImediata");

                    b.Navigation("Microrregiao");

                    b.Navigation("RegiaoImediata");
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.EstadoModel", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.RegiaoModel", "Regiao")
                        .WithMany()
                        .HasForeignKey("IdRegiao");

                    b.Navigation("Regiao");
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.MesorregiaoModel", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.UFModel", "UF")
                        .WithMany()
                        .HasForeignKey("IdUF");

                    b.Navigation("UF");
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.MicrorregiaoModel", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.MesorregiaoModel", "Mesorregiao")
                        .WithMany()
                        .HasForeignKey("IdMessorregiao");

                    b.Navigation("Mesorregiao");
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.RegiaoImediataModel", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.RegiaoIntermediariaModel", "RegiaoIntermediaria")
                        .WithMany()
                        .HasForeignKey("IdRegiaoInt");

                    b.Navigation("RegiaoIntermediaria");
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.RegiaoIntermediariaModel", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.UFModel", "UF")
                        .WithMany()
                        .HasForeignKey("IdUF");

                    b.Navigation("UF");
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Localidades.UFModel", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.RegiaoModel", "Regiao")
                        .WithMany()
                        .HasForeignKey("IdRegiao");

                    b.Navigation("Regiao");
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.UserModel", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.CidadeModel", "Cidade")
                        .WithMany()
                        .HasForeignKey("IdCidade");

                    b.HasOne("plantando_bem.RazorPages.Models.Localidades.EstadoModel", "Estado")
                        .WithMany()
                        .HasForeignKey("IdEstado");

                    b.Navigation("Cidade");

                    b.Navigation("Estado");
                });
#pragma warning restore 612, 618
        }
    }
}
