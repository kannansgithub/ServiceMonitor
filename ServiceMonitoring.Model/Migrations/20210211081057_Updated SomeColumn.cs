using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ServiceMonitoring.Model.Migrations
{
    public partial class UpdatedSomeColumn : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Environments",
                keyColumn: "Id",
                keyValue: new Guid("05449736-b7ff-4e46-b26d-ab8c73d2de25"));

            migrationBuilder.DeleteData(
                table: "Environments",
                keyColumn: "Id",
                keyValue: new Guid("c92b798a-9325-43b3-8f59-4a5986fd96bb"));

            migrationBuilder.DeleteData(
                table: "Environments",
                keyColumn: "Id",
                keyValue: new Guid("fe205020-2b75-4cf6-a079-eb37d8346a52"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("019a6091-09f7-4d6c-b609-a039faf1cb7c"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("021e1a87-8626-4a40-a646-0616e13777d7"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("051c5d53-0c21-4aac-b468-cfba72f42a57"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("605b7399-adec-47e0-96e5-9a08c6d3b000"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("9aeaff71-2d98-4b5e-8245-6039b61e7d1b"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("f5d008f4-7e5a-4486-b097-fd1f25f7443a"));

            migrationBuilder.DeleteData(
                table: "Watchers",
                keyColumn: "Id",
                keyValue: new Guid("48665a08-2566-461c-be7c-be5280562264"));

            migrationBuilder.DeleteData(
                table: "Watchers",
                keyColumn: "Id",
                keyValue: new Guid("62067c36-7ed5-4650-9395-f1c55a293471"));

            migrationBuilder.DeleteData(
                table: "Watchers",
                keyColumn: "Id",
                keyValue: new Guid("6f49f783-3c07-45c6-8ee9-3280944078d8"));

            migrationBuilder.DeleteData(
                table: "Watchers",
                keyColumn: "Id",
                keyValue: new Guid("f059cc22-01de-442c-ab04-ffbc9ff3ab04"));

            migrationBuilder.AddColumn<bool>(
                name: "FailedNotificationRequired",
                table: "ServiceEnvironments",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "NotificationMailIds",
                table: "ServiceEnvironments",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PasswordKey",
                table: "ServiceEnvironments",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ServerName",
                table: "ServiceEnvironments",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UsernameKey",
                table: "ServiceEnvironments",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.InsertData(
                table: "Environments",
                columns: new[] { "Id", "CreatedBy", "CreatedOn", "IsActive", "ModifiedBy", "ModifiedOn", "Name" },
                values: new object[,]
                {
                    { new Guid("a5b4bbc4-5606-42fd-86be-b337d770fb09"), null, new DateTime(2021, 2, 11, 13, 40, 56, 501, DateTimeKind.Local).AddTicks(9245), true, null, new DateTime(2021, 2, 11, 13, 40, 56, 501, DateTimeKind.Local).AddTicks(9267), "Development" },
                    { new Guid("7999137c-5d0f-4b03-ad02-bdda553ed106"), null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(73), true, null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(81), "Quality" },
                    { new Guid("bf80c1b6-3f10-475f-995d-23855eafd789"), null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(85), true, null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(86), "Production" }
                });

            migrationBuilder.InsertData(
                table: "ServiceCategories",
                columns: new[] { "Id", "CreatedBy", "CreatedOn", "IsActive", "ModifiedBy", "ModifiedOn", "Name" },
                values: new object[,]
                {
                    { new Guid("de6910ee-006d-420c-bdfc-7c8ee76d09c7"), null, new DateTime(2021, 2, 11, 13, 40, 56, 498, DateTimeKind.Local).AddTicks(5192), true, null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(8345), "Database" },
                    { new Guid("727429ce-cef4-4dcf-b19a-dce07bb3b347"), null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9927), true, null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9935), "RESTful API" },
                    { new Guid("224c2ab1-00e2-47bc-bd69-d0661622d440"), null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9941), true, null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9942), "Server" },
                    { new Guid("7900f030-5d7c-43ae-bed2-e2053e5e19e5"), null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9946), true, null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9947), "URL" },
                    { new Guid("fa4920d8-a981-49b1-a008-58a7d535ab17"), null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9950), true, null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9951), "Web Service" },
                    { new Guid("6c2a8432-9f1e-4327-9cc4-13a094b68df9"), null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9954), true, null, new DateTime(2021, 2, 11, 13, 40, 56, 499, DateTimeKind.Local).AddTicks(9955), "Windows Service" }
                });

            migrationBuilder.InsertData(
                table: "Watchers",
                columns: new[] { "Id", "AssemblyQualifiedName", "CreatedBy", "CreatedOn", "Description", "IsActive", "ModifiedBy", "ModifiedOn", "Name" },
                values: new object[,]
                {
                    { new Guid("1cf00737-a45a-4b20-8306-3a34a135fc80"), "ServiceMonitoring.Core.Watchers.SqlServerDatabaseWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(1398), "Watcher for SQL Server databases", true, null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(1407), "SqlServerDatabaseWatcher" },
                    { new Guid("608aeaf9-8fd1-4b94-9b4c-1a37bdb3552a"), "ServiceMonitoring.Core.Watchers.HttpRequestWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(3894), "Watcher for http requests", true, null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(3904), "HttpRequestWatcher" },
                    { new Guid("fb93a7b0-57d5-4b92-af05-1d1642e9ae03"), "ServiceMonitoring.Core.Watchers.PingWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(3970), "Watcher for ping requests", true, null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(3973), "PingWatcher" },
                    { new Guid("ca00c79e-8521-465e-9670-fd8bdd6f8387"), "ServiceMonitoring.Core.Watchers.WindowsServiceWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(4003), "Watcher for Windows Services", true, null, new DateTime(2021, 2, 11, 13, 40, 56, 502, DateTimeKind.Local).AddTicks(4005), "WindowsServiceWatcher" }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Environments",
                keyColumn: "Id",
                keyValue: new Guid("7999137c-5d0f-4b03-ad02-bdda553ed106"));

            migrationBuilder.DeleteData(
                table: "Environments",
                keyColumn: "Id",
                keyValue: new Guid("a5b4bbc4-5606-42fd-86be-b337d770fb09"));

            migrationBuilder.DeleteData(
                table: "Environments",
                keyColumn: "Id",
                keyValue: new Guid("bf80c1b6-3f10-475f-995d-23855eafd789"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("224c2ab1-00e2-47bc-bd69-d0661622d440"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("6c2a8432-9f1e-4327-9cc4-13a094b68df9"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("727429ce-cef4-4dcf-b19a-dce07bb3b347"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("7900f030-5d7c-43ae-bed2-e2053e5e19e5"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("de6910ee-006d-420c-bdfc-7c8ee76d09c7"));

            migrationBuilder.DeleteData(
                table: "ServiceCategories",
                keyColumn: "Id",
                keyValue: new Guid("fa4920d8-a981-49b1-a008-58a7d535ab17"));

            migrationBuilder.DeleteData(
                table: "Watchers",
                keyColumn: "Id",
                keyValue: new Guid("1cf00737-a45a-4b20-8306-3a34a135fc80"));

            migrationBuilder.DeleteData(
                table: "Watchers",
                keyColumn: "Id",
                keyValue: new Guid("608aeaf9-8fd1-4b94-9b4c-1a37bdb3552a"));

            migrationBuilder.DeleteData(
                table: "Watchers",
                keyColumn: "Id",
                keyValue: new Guid("ca00c79e-8521-465e-9670-fd8bdd6f8387"));

            migrationBuilder.DeleteData(
                table: "Watchers",
                keyColumn: "Id",
                keyValue: new Guid("fb93a7b0-57d5-4b92-af05-1d1642e9ae03"));

            migrationBuilder.DropColumn(
                name: "FailedNotificationRequired",
                table: "ServiceEnvironments");

            migrationBuilder.DropColumn(
                name: "NotificationMailIds",
                table: "ServiceEnvironments");

            migrationBuilder.DropColumn(
                name: "PasswordKey",
                table: "ServiceEnvironments");

            migrationBuilder.DropColumn(
                name: "ServerName",
                table: "ServiceEnvironments");

            migrationBuilder.DropColumn(
                name: "UsernameKey",
                table: "ServiceEnvironments");

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
        }
    }
}
