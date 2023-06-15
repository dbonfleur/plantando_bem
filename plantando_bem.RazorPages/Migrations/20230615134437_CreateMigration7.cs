using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    /// <inheritdoc />
    public partial class CreateMigration7 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserPlantas_Planta_PlantaId1",
                table: "UserPlantas");

            migrationBuilder.DropForeignKey(
                name: "FK_UserPlantas_User_UserId1",
                table: "UserPlantas");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserPlantas",
                table: "UserPlantas");

            migrationBuilder.DropIndex(
                name: "IX_UserPlantas_PlantaId1",
                table: "UserPlantas");

            migrationBuilder.DropIndex(
                name: "IX_UserPlantas_UserId",
                table: "UserPlantas");

            migrationBuilder.DropIndex(
                name: "IX_UserPlantas_UserId1",
                table: "UserPlantas");

            migrationBuilder.DropColumn(
                name: "PlantaId1",
                table: "UserPlantas");

            migrationBuilder.DropColumn(
                name: "UserId1",
                table: "UserPlantas");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserPlantas",
                table: "UserPlantas",
                columns: new[] { "UserId", "PlantaId" });

            migrationBuilder.CreateIndex(
                name: "IX_UserPlantas_PlantaId",
                table: "UserPlantas",
                column: "PlantaId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_UserPlantas",
                table: "UserPlantas");

            migrationBuilder.DropIndex(
                name: "IX_UserPlantas_PlantaId",
                table: "UserPlantas");

            migrationBuilder.AddColumn<int>(
                name: "PlantaId1",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UserId1",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserPlantas",
                table: "UserPlantas",
                columns: new[] { "PlantaId", "UserId" });

            migrationBuilder.CreateIndex(
                name: "IX_UserPlantas_PlantaId1",
                table: "UserPlantas",
                column: "PlantaId1");

            migrationBuilder.CreateIndex(
                name: "IX_UserPlantas_UserId",
                table: "UserPlantas",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPlantas_UserId1",
                table: "UserPlantas",
                column: "UserId1");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_Planta_PlantaId1",
                table: "UserPlantas",
                column: "PlantaId1",
                principalTable: "Planta",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_User_UserId1",
                table: "UserPlantas",
                column: "UserId1",
                principalTable: "User",
                principalColumn: "Id");
        }
    }
}
