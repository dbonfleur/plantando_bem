using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    /// <inheritdoc />
    public partial class CreateMigration6 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserPlantas_Planta_IdPlanta",
                table: "UserPlantas");

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
                name: "IX_UserPlantas_IdUser",
                table: "UserPlantas");

            migrationBuilder.DropIndex(
                name: "IX_UserPlantas_PlantaId",
                table: "UserPlantas");

            migrationBuilder.DropColumn(
                name: "IdPlanta",
                table: "UserPlantas");

            migrationBuilder.DropColumn(
                name: "IdUser",
                table: "UserPlantas");

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "INTEGER",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "PlantaId",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "INTEGER",
                oldNullable: true);

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
                name: "IX_UserPlantas_UserId1",
                table: "UserPlantas",
                column: "UserId1");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_Planta_PlantaId",
                table: "UserPlantas",
                column: "PlantaId",
                principalTable: "Planta",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_Planta_PlantaId1",
                table: "UserPlantas",
                column: "PlantaId1",
                principalTable: "Planta",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_User_UserId",
                table: "UserPlantas",
                column: "UserId",
                principalTable: "User",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_User_UserId1",
                table: "UserPlantas",
                column: "UserId1",
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
                name: "FK_UserPlantas_Planta_PlantaId1",
                table: "UserPlantas");

            migrationBuilder.DropForeignKey(
                name: "FK_UserPlantas_User_UserId",
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
                name: "IX_UserPlantas_UserId1",
                table: "UserPlantas");

            migrationBuilder.DropColumn(
                name: "PlantaId1",
                table: "UserPlantas");

            migrationBuilder.DropColumn(
                name: "UserId1",
                table: "UserPlantas");

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "INTEGER");

            migrationBuilder.AlterColumn<int>(
                name: "PlantaId",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "INTEGER");

            migrationBuilder.AddColumn<int>(
                name: "IdPlanta",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "IdUser",
                table: "UserPlantas",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserPlantas",
                table: "UserPlantas",
                columns: new[] { "IdPlanta", "IdUser" });

            migrationBuilder.CreateIndex(
                name: "IX_UserPlantas_IdUser",
                table: "UserPlantas",
                column: "IdUser");

            migrationBuilder.CreateIndex(
                name: "IX_UserPlantas_PlantaId",
                table: "UserPlantas",
                column: "PlantaId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPlantas_Planta_IdPlanta",
                table: "UserPlantas",
                column: "IdPlanta",
                principalTable: "Planta",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

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
    }
}
