using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ServiceMonitoring.Model.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Environments",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Environments", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Roles",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Roles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ServiceCategories",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ServiceCategories", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    UserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Watchers",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AssemblyQualifiedName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Watchers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Services",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ServiceCategoryId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Services", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Services_ServiceCategories_ServiceCategoryId",
                        column: x => x.ServiceCategoryId,
                        principalTable: "ServiceCategories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserInRoles",
                columns: table => new
                {
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    RoleId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserInRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_UserInRoles_Roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserInRoles_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ServiceEnvironments",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    Url = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConnectionString = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TypeName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    WindowsServiceName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Interval = table.Column<int>(type: "int", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ServiceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EnvironmentId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ServiceEnvironments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ServiceEnvironments_Environments_EnvironmentId",
                        column: x => x.EnvironmentId,
                        principalTable: "Environments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ServiceEnvironments_Services_ServiceId",
                        column: x => x.ServiceId,
                        principalTable: "Services",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ServiceWatchers",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    ServiceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    WatcherId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ServiceWatchers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ServiceWatchers_Services_ServiceId",
                        column: x => x.ServiceId,
                        principalTable: "Services",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ServiceWatchers_Watchers_WatcherId",
                        column: x => x.WatcherId,
                        principalTable: "Watchers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ServiceOwners",
                columns: table => new
                {
                    RoleId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ServiceEnvironmentId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ServiceOwners", x => new { x.RoleId, x.ServiceEnvironmentId });
                    table.ForeignKey(
                        name: "FK_ServiceOwners_Roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ServiceOwners_ServiceEnvironments_ServiceEnvironmentId",
                        column: x => x.ServiceEnvironmentId,
                        principalTable: "ServiceEnvironments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ServiceStatuses",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    SuccessStatus = table.Column<bool>(type: "bit", nullable: false),
                    NumberOfWatch = table.Column<int>(type: "int", nullable: false),
                    LastWatch = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ServiceEnvironmentId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ServiceStatuses", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ServiceStatuses_ServiceEnvironments_ServiceEnvironmentId",
                        column: x => x.ServiceEnvironmentId,
                        principalTable: "ServiceEnvironments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ServiceStatusLogs",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newid()"),
                    Target = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ActionName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SuccessfulStatus = table.Column<bool>(type: "bit", nullable: false),
                    Message = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ServiceStatusId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreatedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ModifiedBy = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ServiceStatusLogs", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ServiceStatusLogs_ServiceStatuses_ServiceStatusId",
                        column: x => x.ServiceStatusId,
                        principalTable: "ServiceStatuses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Environments",
                columns: new[] { "Id", "CreatedBy", "CreatedOn", "IsActive", "ModifiedBy", "ModifiedOn", "Name" },
                values: new object[,]
                {
                    { new Guid("c92b798a-9325-43b3-8f59-4a5986fd96bb"), null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4), true, null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(18), "Development" },
                    { new Guid("05449736-b7ff-4e46-b26d-ab8c73d2de25"), null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(778), true, null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(786), "Quality" },
                    { new Guid("fe205020-2b75-4cf6-a079-eb37d8346a52"), null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(790), true, null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(791), "Production" }
                });

            migrationBuilder.InsertData(
                table: "ServiceCategories",
                columns: new[] { "Id", "CreatedBy", "CreatedOn", "IsActive", "ModifiedBy", "ModifiedOn", "Name" },
                values: new object[,]
                {
                    { new Guid("9aeaff71-2d98-4b5e-8245-6039b61e7d1b"), null, new DateTime(2021, 2, 9, 9, 26, 20, 853, DateTimeKind.Local).AddTicks(1084), true, null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(3317), "Database" },
                    { new Guid("051c5d53-0c21-4aac-b468-cfba72f42a57"), null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4282), true, null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4291), "RESTful API" },
                    { new Guid("f5d008f4-7e5a-4486-b097-fd1f25f7443a"), null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4296), true, null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4297), "Server" },
                    { new Guid("021e1a87-8626-4a40-a646-0616e13777d7"), null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4300), true, null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4301), "URL" },
                    { new Guid("605b7399-adec-47e0-96e5-9a08c6d3b000"), null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4304), true, null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4305), "Web Service" },
                    { new Guid("019a6091-09f7-4d6c-b609-a039faf1cb7c"), null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4307), true, null, new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4309), "Windows Service" }
                });

            migrationBuilder.InsertData(
                table: "Watchers",
                columns: new[] { "Id", "AssemblyQualifiedName", "CreatedBy", "CreatedOn", "Description", "IsActive", "ModifiedBy", "ModifiedOn", "Name" },
                values: new object[,]
                {
                    { new Guid("f059cc22-01de-442c-ab04-ffbc9ff3ab04"), "ServiceMonitoring.Core.Watchers.SqlServerDatabaseWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(1802), "Watcher for SQL Server databases", true, null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(1810), "SqlServerDatabaseWatcher" },
                    { new Guid("48665a08-2566-461c-be7c-be5280562264"), "ServiceMonitoring.Core.Watchers.HttpRequestWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4440), "Watcher for http requests", true, null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4450), "HttpRequestWatcher" },
                    { new Guid("62067c36-7ed5-4650-9395-f1c55a293471"), "ServiceMonitoring.Core.Watchers.PingWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4520), "Watcher for ping requests", true, null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4522), "PingWatcher" },
                    { new Guid("6f49f783-3c07-45c6-8ee9-3280944078d8"), "ServiceMonitoring.Core.Watchers.WindowsServiceWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4572), "Watcher for Windows Services", true, null, new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4575), "WindowsServiceWatcher" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_ServiceEnvironments_EnvironmentId",
                table: "ServiceEnvironments",
                column: "EnvironmentId");

            migrationBuilder.CreateIndex(
                name: "IX_ServiceEnvironments_ServiceId",
                table: "ServiceEnvironments",
                column: "ServiceId");

            migrationBuilder.CreateIndex(
                name: "IX_ServiceOwners_ServiceEnvironmentId",
                table: "ServiceOwners",
                column: "ServiceEnvironmentId");

            migrationBuilder.CreateIndex(
                name: "IX_Services_ServiceCategoryId",
                table: "Services",
                column: "ServiceCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_ServiceStatuses_ServiceEnvironmentId",
                table: "ServiceStatuses",
                column: "ServiceEnvironmentId");

            migrationBuilder.CreateIndex(
                name: "IX_ServiceStatusLogs_ServiceStatusId",
                table: "ServiceStatusLogs",
                column: "ServiceStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_ServiceWatchers_ServiceId",
                table: "ServiceWatchers",
                column: "ServiceId");

            migrationBuilder.CreateIndex(
                name: "IX_ServiceWatchers_WatcherId",
                table: "ServiceWatchers",
                column: "WatcherId");

            migrationBuilder.CreateIndex(
                name: "IX_UserInRoles_RoleId",
                table: "UserInRoles",
                column: "RoleId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ServiceOwners");

            migrationBuilder.DropTable(
                name: "ServiceStatusLogs");

            migrationBuilder.DropTable(
                name: "ServiceWatchers");

            migrationBuilder.DropTable(
                name: "UserInRoles");

            migrationBuilder.DropTable(
                name: "ServiceStatuses");

            migrationBuilder.DropTable(
                name: "Watchers");

            migrationBuilder.DropTable(
                name: "Roles");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "ServiceEnvironments");

            migrationBuilder.DropTable(
                name: "Environments");

            migrationBuilder.DropTable(
                name: "Services");

            migrationBuilder.DropTable(
                name: "ServiceCategories");
        }
    }
}
