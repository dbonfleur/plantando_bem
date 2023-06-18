using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    /// <inheritdoc />
    public partial class CreateMigration9 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "IrrigacaoPlanta",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_IrrigacaoPlanta_UserId",
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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_IrrigacaoPlanta_User_UserId",
                table: "IrrigacaoPlanta");

            migrationBuilder.DropIndex(
                name: "IX_IrrigacaoPlanta_UserId",
                table: "IrrigacaoPlanta");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "IrrigacaoPlanta");
        }
    }
}
