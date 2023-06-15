using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    /// <inheritdoc />
    public partial class CreateMigration5 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Planta_User_UserModelId",
                table: "Planta");

            migrationBuilder.DropForeignKey(
                name: "FK_UserPlantas_User_IdUser",
                table: "UserPlantas");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserPlantas",
                table: "UserPlantas");

            migrationBuilder.DropIndex(
                name: "IX_Planta_UserModelId",
                table: "Planta");

            migrationBuilder.DropColumn(
                name: "UserModelId",
                table: "Planta");

            migrationBuilder.AlterColumn<int>(
                name: "IdUser",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "INTEGER",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "PlantaId",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserPlantas",
                table: "UserPlantas",
                columns: new[] { "IdPlanta", "IdUser" });

            migrationBuilder.CreateIndex(
                name: "IX_UserPlantas_PlantaId",
                table: "UserPlantas",
                column: "PlantaId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPlantas_UserId",
                table: "UserPlantas",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_Planta_PlantaId",
                table: "UserPlantas",
                column: "PlantaId",
                principalTable: "Planta",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_User_IdUser",
                table: "UserPlantas",
                column: "IdUser",
                principalTable: "User",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_User_UserId",
                table: "UserPlantas",
                column: "UserId",
                principalTable: "User",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserPlantas_Planta_PlantaId",
                table: "UserPlantas");

            migrationBuilder.DropForeignKey(
                name: "FK_UserPlantas_User_IdUser",
                table: "UserPlantas");

            migrationBuilder.DropForeignKey(
                name: "FK_UserPlantas_User_UserId",
                table: "UserPlantas");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserPlantas",
                table: "UserPlantas");

            migrationBuilder.DropIndex(
                name: "IX_UserPlantas_PlantaId",
                table: "UserPlantas");

            migrationBuilder.DropIndex(
                name: "IX_UserPlantas_UserId",
                table: "UserPlantas");

            migrationBuilder.DropColumn(
                name: "PlantaId",
                table: "UserPlantas");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "UserPlantas");

            migrationBuilder.AlterColumn<int>(
                name: "IdUser",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "INTEGER");

            migrationBuilder.AddColumn<int>(
                name: "UserModelId",
                table: "Planta",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserPlantas",
                table: "UserPlantas",
                column: "IdPlanta");

            migrationBuilder.CreateIndex(
                name: "IX_Planta_UserModelId",
                table: "Planta",
                column: "UserModelId");

            migrationBuilder.AddForeignKey(
                name: "FK_Planta_User_UserModelId",
                table: "Planta",
                column: "UserModelId",
                principalTable: "User",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_User_IdUser",
                table: "UserPlantas",
                column: "IdUser",
                principalTable: "User",
                principalColumn: "Id");
        }
    }
}
