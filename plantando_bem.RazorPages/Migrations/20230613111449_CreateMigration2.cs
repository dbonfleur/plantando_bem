using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    /// <inheritdoc />
    public partial class CreateMigration2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UserModelId",
                table: "Planta",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "UserPlantas",
                columns: table => new
                {
                    IdPlanta = table.Column<int>(type: "INTEGER", nullable: false),
                    IdUser = table.Column<int>(type: "INTEGER", nullable: true),
                    DataInicio = table.Column<DateTime>(type: "TEXT", nullable: true),
                    DataFinalMin = table.Column<DateTime>(type: "TEXT", nullable: true),
                    DataFinalMax = table.Column<DateTime>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserPlantas", x => x.IdPlanta);
                    table.ForeignKey(
                        name: "FK_UserPlantas_Planta_IdPlanta",
                        column: x => x.IdPlanta,
                        principalTable: "Planta",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserPlantas_User_IdUser",
                        column: x => x.IdUser,
                        principalTable: "User",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Planta_UserModelId",
                table: "Planta",
                column: "UserModelId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPlantas_IdUser",
                table: "UserPlantas",
                column: "IdUser");

            migrationBuilder.AddForeignKey(
                name: "FK_Planta_User_UserModelId",
                table: "Planta",
                column: "UserModelId",
                principalTable: "User",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Planta_User_UserModelId",
                table: "Planta");

            migrationBuilder.DropTable(
                name: "UserPlantas");

            migrationBuilder.DropIndex(
                name: "IX_Planta_UserModelId",
                table: "Planta");

            migrationBuilder.DropColumn(
                name: "UserModelId",
                table: "Planta");
        }
    }
}
