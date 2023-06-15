﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using plantando_bem.RazorPages.Areas.Identity.Data;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    [DbContext(typeof(IdentityDataContext))]
    [Migration("20230614233807_CreateMigration3")]
    partial class CreateMigration3
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder.HasAnnotation("ProductVersion", "7.0.5");

            modelBuilder.Entity("EpocaRegiaoPlanta", b =>
                {
                    b.Property<int>("IdEpocaRegiao")
                        .HasColumnType("INTEGER");

                    b.Property<int>("IdPlanta")
                        .HasColumnType("INTEGER");

                    b.HasKey("IdEpocaRegiao", "IdPlanta");

                    b.HasIndex("IdPlanta");

                    b.ToTable("EpocaRegiaoPlanta", (string)null);
                });

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

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Jardim.DiasPlanta", b =>
                {
                    b.Property<int?>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("DiaMax")
                        .HasColumnType("INTEGER");

                    b.Property<int?>("DiaMin")
                        .HasColumnType("INTEGER");

                    b.HasKey("Id");

                    b.ToTable("DiasPlanta", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Jardim.EpocaRegiao", b =>
                {
                    b.Property<int?>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Meses")
                        .HasColumnType("TEXT");

                    b.Property<string>("Regiao")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("EpocaRegiao", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Jardim.Planta", b =>
                {
                    b.Property<int?>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Descricao")
                        .HasColumnType("TEXT");

                    b.Property<int?>("IdDias")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.Property<string>("NomeCientifico")
                        .HasColumnType("TEXT");

                    b.Property<string>("RecomAprov")
                        .HasColumnType("TEXT");

                    b.Property<string>("RegiaoPlantio")
                        .HasColumnType("TEXT");

                    b.Property<int?>("UserModelId")
                        .HasColumnType("INTEGER");

                    b.HasKey("Id");

                    b.HasIndex("IdDias");

                    b.HasIndex("UserModelId");

                    b.ToTable("Planta", (string)null);
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

                    b.Property<string>("IdNetUser")
                        .HasColumnType("TEXT");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("IdCidade");

                    b.HasIndex("IdEstado");

                    b.ToTable("User", (string)null);
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.UserPlantas", b =>
                {
                    b.Property<int?>("IdPlanta")
                        .HasColumnType("INTEGER");

                    b.Property<DateTime?>("DataFinalMax")
                        .HasColumnType("TEXT");

                    b.Property<DateTime?>("DataFinalMin")
                        .HasColumnType("TEXT");

                    b.Property<DateTime?>("DataInicio")
                        .HasColumnType("TEXT");

                    b.Property<int?>("IdUser")
                        .HasColumnType("INTEGER");

                    b.HasKey("IdPlanta");

                    b.HasIndex("IdUser");

                    b.ToTable("UserPlantas", (string)null);
                });

            modelBuilder.Entity("EpocaRegiaoPlanta", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Jardim.EpocaRegiao", null)
                        .WithMany()
                        .HasForeignKey("IdEpocaRegiao")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("plantando_bem.RazorPages.Models.Jardim.Planta", null)
                        .WithMany()
                        .HasForeignKey("IdPlanta")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
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

            modelBuilder.Entity("plantando_bem.RazorPages.Models.Jardim.Planta", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Jardim.DiasPlanta", "Dias")
                        .WithMany()
                        .HasForeignKey("IdDias");

                    b.HasOne("plantando_bem.RazorPages.Models.UserModel", null)
                        .WithMany("Plantas")
                        .HasForeignKey("UserModelId");

                    b.Navigation("Dias");
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

            modelBuilder.Entity("plantando_bem.RazorPages.Models.UserPlantas", b =>
                {
                    b.HasOne("plantando_bem.RazorPages.Models.Jardim.Planta", "Planta")
                        .WithMany()
                        .HasForeignKey("IdPlanta")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("plantando_bem.RazorPages.Models.UserModel", "User")
                        .WithMany()
                        .HasForeignKey("IdUser");

                    b.Navigation("Planta");

                    b.Navigation("User");
                });

            modelBuilder.Entity("plantando_bem.RazorPages.Models.UserModel", b =>
                {
                    b.Navigation("Plantas");
                });
#pragma warning restore 612, 618
        }
    }
}
