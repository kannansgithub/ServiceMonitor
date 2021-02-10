﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using ServiceMonitoring.Model;

namespace ServiceMonitoring.Model.Migrations
{
    [DbContext(typeof(ServiceMonitoringDbContext))]
    partial class ServiceMonitoringDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .UseIdentityColumns()
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.2");

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.Environment", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Environments");

                    b.HasData(
                        new
                        {
                            Id = new Guid("c92b798a-9325-43b3-8f59-4a5986fd96bb"),
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4),
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(18),
                            Name = "Development"
                        },
                        new
                        {
                            Id = new Guid("05449736-b7ff-4e46-b26d-ab8c73d2de25"),
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(778),
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(786),
                            Name = "Quality"
                        },
                        new
                        {
                            Id = new Guid("fe205020-2b75-4cf6-a079-eb37d8346a52"),
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(790),
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(791),
                            Name = "Production"
                        });
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.Role", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.Service", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<Guid>("ServiceCategoryId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("ServiceCategoryId");

                    b.ToTable("Services");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceCategory", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("ServiceCategories");

                    b.HasData(
                        new
                        {
                            Id = new Guid("9aeaff71-2d98-4b5e-8245-6039b61e7d1b"),
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 853, DateTimeKind.Local).AddTicks(1084),
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(3317),
                            Name = "Database"
                        },
                        new
                        {
                            Id = new Guid("051c5d53-0c21-4aac-b468-cfba72f42a57"),
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4282),
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4291),
                            Name = "RESTful API"
                        },
                        new
                        {
                            Id = new Guid("f5d008f4-7e5a-4486-b097-fd1f25f7443a"),
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4296),
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4297),
                            Name = "Server"
                        },
                        new
                        {
                            Id = new Guid("021e1a87-8626-4a40-a646-0616e13777d7"),
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4300),
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4301),
                            Name = "URL"
                        },
                        new
                        {
                            Id = new Guid("605b7399-adec-47e0-96e5-9a08c6d3b000"),
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4304),
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4305),
                            Name = "Web Service"
                        },
                        new
                        {
                            Id = new Guid("019a6091-09f7-4d6c-b609-a039faf1cb7c"),
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4307),
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 854, DateTimeKind.Local).AddTicks(4309),
                            Name = "Windows Service"
                        });
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceEnvironment", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ConnectionString")
                        .HasColumnType("nvarchar(max)");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<Guid>("EnvironmentId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<int>("Interval")
                        .HasColumnType("int");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("ServiceId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("TypeName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Url")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("WindowsServiceName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("EnvironmentId");

                    b.HasIndex("ServiceId");

                    b.ToTable("ServiceEnvironments");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceOwner", b =>
                {
                    b.Property<Guid>("RoleId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("ServiceEnvironmentId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("RoleId", "ServiceEnvironmentId");

                    b.HasIndex("ServiceEnvironmentId");

                    b.ToTable("ServiceOwners");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceStatus", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<DateTime>("LastWatch")
                        .HasColumnType("datetime2");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<int>("NumberOfWatch")
                        .HasColumnType("int");

                    b.Property<Guid>("ServiceEnvironmentId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<bool>("SuccessStatus")
                        .HasColumnType("bit");

                    b.HasKey("Id");

                    b.HasIndex("ServiceEnvironmentId");

                    b.ToTable("ServiceStatuses");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceStatusLog", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<string>("ActionName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<string>("Message")
                        .HasColumnType("nvarchar(max)");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("ServiceStatusId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<bool>("SuccessfulStatus")
                        .HasColumnType("bit");

                    b.Property<string>("Target")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("ServiceStatusId");

                    b.ToTable("ServiceStatusLogs");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceWatcher", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("ServiceId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("WatcherId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("ServiceId");

                    b.HasIndex("WatcherId");

                    b.ToTable("ServiceWatchers");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.User", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("UserName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.UserInRole", b =>
                {
                    b.Property<Guid>("UserId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("RoleId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("UserInRoles");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.Watcher", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier")
                        .HasDefaultValueSql("newid()");

                    b.Property<string>("AssemblyQualifiedName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<Guid?>("CreatedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreatedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("IsActive")
                        .HasColumnType("bit");

                    b.Property<Guid?>("ModifiedBy")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("ModifiedOn")
                        .HasColumnType("datetime2");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Watchers");

                    b.HasData(
                        new
                        {
                            Id = new Guid("f059cc22-01de-442c-ab04-ffbc9ff3ab04"),
                            AssemblyQualifiedName = "ServiceMonitoring.Core.Watchers.SqlServerDatabaseWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null",
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(1802),
                            Description = "Watcher for SQL Server databases",
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(1810),
                            Name = "SqlServerDatabaseWatcher"
                        },
                        new
                        {
                            Id = new Guid("48665a08-2566-461c-be7c-be5280562264"),
                            AssemblyQualifiedName = "ServiceMonitoring.Core.Watchers.HttpRequestWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null",
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4440),
                            Description = "Watcher for http requests",
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4450),
                            Name = "HttpRequestWatcher"
                        },
                        new
                        {
                            Id = new Guid("62067c36-7ed5-4650-9395-f1c55a293471"),
                            AssemblyQualifiedName = "ServiceMonitoring.Core.Watchers.PingWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null",
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4520),
                            Description = "Watcher for ping requests",
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4522),
                            Name = "PingWatcher"
                        },
                        new
                        {
                            Id = new Guid("6f49f783-3c07-45c6-8ee9-3280944078d8"),
                            AssemblyQualifiedName = "ServiceMonitoring.Core.Watchers.WindowsServiceWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null",
                            CreatedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4572),
                            Description = "Watcher for Windows Services",
                            IsActive = true,
                            ModifiedOn = new DateTime(2021, 2, 9, 9, 26, 20, 856, DateTimeKind.Local).AddTicks(4575),
                            Name = "WindowsServiceWatcher"
                        });
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.Service", b =>
                {
                    b.HasOne("ServiceMonitoring.Model.Entity.ServiceCategory", "ServiceCategory")
                        .WithMany("Services")
                        .HasForeignKey("ServiceCategoryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("ServiceCategory");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceEnvironment", b =>
                {
                    b.HasOne("ServiceMonitoring.Model.Entity.Environment", "Environment")
                        .WithMany("ServiceEnvironments")
                        .HasForeignKey("EnvironmentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ServiceMonitoring.Model.Entity.Service", "Service")
                        .WithMany("ServiceEnvironments")
                        .HasForeignKey("ServiceId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Environment");

                    b.Navigation("Service");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceOwner", b =>
                {
                    b.HasOne("ServiceMonitoring.Model.Entity.Role", "Role")
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ServiceMonitoring.Model.Entity.ServiceEnvironment", "ServiceEnvironment")
                        .WithMany("ServiceOwners")
                        .HasForeignKey("ServiceEnvironmentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Role");

                    b.Navigation("ServiceEnvironment");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceStatus", b =>
                {
                    b.HasOne("ServiceMonitoring.Model.Entity.ServiceEnvironment", "ServiceEnvironment")
                        .WithMany("ServiceStatuses")
                        .HasForeignKey("ServiceEnvironmentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("ServiceEnvironment");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceStatusLog", b =>
                {
                    b.HasOne("ServiceMonitoring.Model.Entity.ServiceStatus", "ServiceStatus")
                        .WithMany("ServiceStatusLogs")
                        .HasForeignKey("ServiceStatusId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("ServiceStatus");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceWatcher", b =>
                {
                    b.HasOne("ServiceMonitoring.Model.Entity.Service", "Service")
                        .WithMany("ServiceWatchers")
                        .HasForeignKey("ServiceId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ServiceMonitoring.Model.Entity.Watcher", "Watcher")
                        .WithMany("ServiceWatchers")
                        .HasForeignKey("WatcherId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Service");

                    b.Navigation("Watcher");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.UserInRole", b =>
                {
                    b.HasOne("ServiceMonitoring.Model.Entity.Role", "Role")
                        .WithMany("UserInRole")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ServiceMonitoring.Model.Entity.User", "User")
                        .WithMany("UserInRole")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Role");

                    b.Navigation("User");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.Environment", b =>
                {
                    b.Navigation("ServiceEnvironments");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.Role", b =>
                {
                    b.Navigation("UserInRole");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.Service", b =>
                {
                    b.Navigation("ServiceEnvironments");

                    b.Navigation("ServiceWatchers");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceCategory", b =>
                {
                    b.Navigation("Services");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceEnvironment", b =>
                {
                    b.Navigation("ServiceOwners");

                    b.Navigation("ServiceStatuses");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.ServiceStatus", b =>
                {
                    b.Navigation("ServiceStatusLogs");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.User", b =>
                {
                    b.Navigation("UserInRole");
                });

            modelBuilder.Entity("ServiceMonitoring.Model.Entity.Watcher", b =>
                {
                    b.Navigation("ServiceWatchers");
                });
#pragma warning restore 612, 618
        }
    }
}