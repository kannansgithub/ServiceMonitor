using Microsoft.EntityFrameworkCore;
using ServiceMonitoring.Core.Watchers;
using ServiceMonitoring.Model.Entity;
namespace ServiceMonitoring.Model
{
    public class ServiceMonitoringDbContext : DbContext
    {
        public ServiceMonitoringDbContext(DbContextOptions<ServiceMonitoringDbContext> options)
            : base(options)
        {
        }
        public DbSet<Environment> Environments { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Service> Services { get; set; }
        public DbSet<ServiceCategory> ServiceCategories { get; set; }
        public DbSet<ServiceEnvironment> ServiceEnvironments { get; set; }
        public DbSet<ServiceOwner> ServiceOwners { get; set; }
        public DbSet<ServiceStatus> ServiceStatuses { get; set; }
        public DbSet<ServiceStatusLog> ServiceStatusLogs { get; set; }
        public DbSet<UserInRole> UserInRoles { get; set; }
        public DbSet<ServiceWatcher> ServiceWatchers { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Watcher> Watchers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<Environment>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");
            modelBuilder.Entity<Role>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");
            modelBuilder.Entity<Service>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");
            modelBuilder.Entity<ServiceCategory>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");
            modelBuilder.Entity<ServiceEnvironment>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");
            modelBuilder.Entity<ServiceStatus>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");
            modelBuilder.Entity<ServiceStatusLog>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");
            modelBuilder.Entity<ServiceWatcher>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");
            modelBuilder.Entity<User>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");
            modelBuilder.Entity<Watcher>()
                .Property(x => x.Id)
                .HasDefaultValueSql("newid()");

            modelBuilder.Entity<ServiceCategory>()
                .HasData(
                new ServiceCategory { Name = "Database" },
                new ServiceCategory { Name = "RESTful API" },
                new ServiceCategory { Name = "Server" },
                new ServiceCategory { Name = "URL" },
                new ServiceCategory { Name = "Web Service" },
                new ServiceCategory { Name = "Windows Service" }
            );
            modelBuilder.Entity<Environment>().HasData(
                new Environment { Name = "Development" },
                new Environment { Name = "Quality" },
                new Environment { Name = "Production" }

                );
            modelBuilder.Entity<Watcher>().HasData(
                new Watcher
                {
                    Name = "SqlServerDatabaseWatcher",
                    Description = "Watcher for SQL Server databases",
                    AssemblyQualifiedName = typeof(SqlServerDatabaseWatcher).AssemblyQualifiedName
                },
                new Watcher
                {
                    Name = "HttpRequestWatcher",
                    Description = "Watcher for http requests",
                    AssemblyQualifiedName = typeof(HttpRequestWatcher).AssemblyQualifiedName
                },
                new Watcher
                {
                    Name = "PingWatcher",
                    Description = "Watcher for ping requests",
                    AssemblyQualifiedName = typeof(PingWatcher).AssemblyQualifiedName
                },
                new Watcher
                {
                    Name = "WindowsServiceWatcher",
                    Description = "Watcher for Windows Services",
                    AssemblyQualifiedName = typeof(WindowsServiceWatcher).AssemblyQualifiedName
                }
                );
            modelBuilder.Entity<UserInRole>().HasKey(x => new { x.UserId, x.RoleId });
            modelBuilder.Entity<ServiceOwner>().HasKey(x => new { x.RoleId, x.ServiceEnvironmentId });

            base.OnModelCreating(modelBuilder);
        }
    }
}
