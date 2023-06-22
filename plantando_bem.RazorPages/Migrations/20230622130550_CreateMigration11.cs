using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace plantando_bem.RazorPages.Migrations
{
    /// <inheritdoc />
    public partial class CreateMigration11 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PlantaIdentifica",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Imagem = table.Column<byte[]>(type: "BLOB", nullable: true),
                    Descricao = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PlantaIdentifica", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserIdentificaPlanta",
                columns: table => new
                {
                    UserPostId = table.Column<int>(type: "INTEGER", nullable: false),
                    PlantaIdentificaId = table.Column<int>(type: "INTEGER", nullable: false),
                    UserDescId = table.Column<int>(type: "INTEGER", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserIdentificaPlanta", x => new { x.UserPostId, x.PlantaIdentificaId });
                    table.ForeignKey(
                        name: "FK_UserIdentificaPlanta_PlantaIdentifica_PlantaIdentificaId",
                        column: x => x.PlantaIdentificaId,
                        principalTable: "PlantaIdentifica",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserIdentificaPlanta_User_UserPostId",
                        column: x => x.UserPostId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserIdentificaPlanta_PlantaIdentificaId",
                table: "UserIdentificaPlanta",
                column: "PlantaIdentificaId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserIdentificaPlanta");

            migrationBuilder.DropTable(
                name: "PlantaIdentifica");
        }
    }
}
