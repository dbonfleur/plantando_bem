using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    /// <inheritdoc />
    public partial class CreateMigration10 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_IrrigacaoPlanta_User_UserId",
                table: "IrrigacaoPlanta");

            migrationBuilder.DropPrimaryKey(
                name: "PK_IrrigacaoPlanta",
                table: "IrrigacaoPlanta");

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "IrrigacaoPlanta",
                type: "INTEGER",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "INTEGER");

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "IrrigacaoPlanta",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0)
                .Annotation("Sqlite:Autoincrement", true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_IrrigacaoPlanta",
                table: "IrrigacaoPlanta",
                column: "Id");

            migrationBuilder.CreateIndex(
                name: "IX_IrrigacaoPlanta_UserId",
                table: "IrrigacaoPlanta",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_IrrigacaoPlanta_User_UserId",
                table: "IrrigacaoPlanta",
                column: "UserId",
                principalTable: "User",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_IrrigacaoPlanta_User_UserId",
                table: "IrrigacaoPlanta");

            migrationBuilder.DropPrimaryKey(
                name: "PK_IrrigacaoPlanta",
                table: "IrrigacaoPlanta");

            migrationBuilder.DropIndex(
                name: "IX_IrrigacaoPlanta_UserId",
                table: "IrrigacaoPlanta");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "IrrigacaoPlanta");

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "IrrigacaoPlanta",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "INTEGER",
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_IrrigacaoPlanta",
                table: "IrrigacaoPlanta",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_IrrigacaoPlanta_User_UserId",
                table: "IrrigacaoPlanta",
                column: "UserId",
                principalTable: "User",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
