using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    /// <inheritdoc />
    public partial class CreateMigration8 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Irrigacao",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Data = table.Column<DateTime>(type: "TEXT", nullable: false),
                    Irrigado = table.Column<bool>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Irrigacao", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "IrrigacaoPlanta",
                columns: table => new
                {
                    IrrigacaoId = table.Column<int>(type: "INTEGER", nullable: false),
                    PlantaId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IrrigacaoPlanta", x => new { x.IrrigacaoId, x.PlantaId });
                    table.ForeignKey(
                        name: "FK_IrrigacaoPlanta_Irrigacao_IrrigacaoId",
                        column: x => x.IrrigacaoId,
                        principalTable: "Irrigacao",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_IrrigacaoPlanta_Planta_PlantaId",
                        column: x => x.PlantaId,
                        principalTable: "Planta",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_IrrigacaoPlanta_PlantaId",
                table: "IrrigacaoPlanta",
                column: "PlantaId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "IrrigacaoPlanta");

            migrationBuilder.DropTable(
                name: "Irrigacao");
        }
    }
}
