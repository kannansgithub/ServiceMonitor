USE [master]
GO
/****** Object:  Database [ServiceMonitorDB]    Script Date: 2/10/2021 9:10:50 PM ******/
CREATE DATABASE [ServiceMonitorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ServiceMonitorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ServiceMonitorDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ServiceMonitorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ServiceMonitorDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ServiceMonitorDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ServiceMonitorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ServiceMonitorDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ServiceMonitorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ServiceMonitorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ServiceMonitorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ServiceMonitorDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ServiceMonitorDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ServiceMonitorDB] SET  MULTI_USER 
GO
ALTER DATABASE [ServiceMonitorDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ServiceMonitorDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ServiceMonitorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ServiceMonitorDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ServiceMonitorDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ServiceMonitorDB', N'ON'
GO
ALTER DATABASE [ServiceMonitorDB] SET QUERY_STORE = OFF
GO
USE [ServiceMonitorDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Environments]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Environments](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Environments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategories]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategories](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ServiceCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceEnvironments]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceEnvironments](
	[Id] [uniqueidentifier] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[ConnectionString] [nvarchar](max) NULL,
	[TypeName] [nvarchar](max) NULL,
	[WindowsServiceName] [nvarchar](max) NULL,
	[Interval] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ServiceId] [uniqueidentifier] NOT NULL,
	[EnvironmentId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ServiceEnvironments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceOwners]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOwners](
	[RoleId] [uniqueidentifier] NOT NULL,
	[ServiceEnvironmentId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ServiceOwners] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[ServiceEnvironmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ServiceCategoryId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceStatuses]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceStatuses](
	[Id] [uniqueidentifier] NOT NULL,
	[SuccessStatus] [bit] NOT NULL,
	[NumberOfWatch] [int] NOT NULL,
	[LastWatch] [datetime2](7) NOT NULL,
	[ServiceEnvironmentId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ServiceStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceStatusLogs]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceStatusLogs](
	[Id] [uniqueidentifier] NOT NULL,
	[Target] [nvarchar](max) NULL,
	[ActionName] [nvarchar](max) NULL,
	[SuccessfulStatus] [bit] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ServiceStatusId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ServiceStatusLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceWatchers]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceWatchers](
	[Id] [uniqueidentifier] NOT NULL,
	[ServiceId] [uniqueidentifier] NOT NULL,
	[WatcherId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ServiceWatchers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInRoles]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserInRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Watchers]    Script Date: 2/10/2021 9:10:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Watchers](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[AssemblyQualifiedName] [nvarchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Watchers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210209035621_InitialCreate', N'5.0.2')
GO
INSERT [dbo].[Environments] ([Id], [Name], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'c92b798a-9325-43b3-8f59-4a5986fd96bb', N'Development', NULL, CAST(N'2021-02-09T09:26:20.8560004' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8560018' AS DateTime2), 1)
GO
INSERT [dbo].[Environments] ([Id], [Name], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'05449736-b7ff-4e46-b26d-ab8c73d2de25', N'Quality', NULL, CAST(N'2021-02-09T09:26:20.8560778' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8560786' AS DateTime2), 1)
GO
INSERT [dbo].[Environments] ([Id], [Name], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'fe205020-2b75-4cf6-a079-eb37d8346a52', N'Production', NULL, CAST(N'2021-02-09T09:26:20.8560790' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8560791' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceCategories] ([Id], [Name], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'021e1a87-8626-4a40-a646-0616e13777d7', N'URL', NULL, CAST(N'2021-02-09T09:26:20.8544300' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8544301' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceCategories] ([Id], [Name], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'9aeaff71-2d98-4b5e-8245-6039b61e7d1b', N'Database', NULL, CAST(N'2021-02-09T09:26:20.8531084' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8543317' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceCategories] ([Id], [Name], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'605b7399-adec-47e0-96e5-9a08c6d3b000', N'Web Service', NULL, CAST(N'2021-02-09T09:26:20.8544304' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8544305' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceCategories] ([Id], [Name], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'019a6091-09f7-4d6c-b609-a039faf1cb7c', N'Windows Service', NULL, CAST(N'2021-02-09T09:26:20.8544307' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8544309' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceCategories] ([Id], [Name], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'051c5d53-0c21-4aac-b468-cfba72f42a57', N'RESTful API', NULL, CAST(N'2021-02-09T09:26:20.8544282' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8544291' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceCategories] ([Id], [Name], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'f5d008f4-7e5a-4486-b097-fd1f25f7443a', N'Server', NULL, CAST(N'2021-02-09T09:26:20.8544296' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8544297' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceEnvironments] ([Id], [Url], [Address], [ConnectionString], [TypeName], [WindowsServiceName], [Interval], [Description], [ServiceId], [EnvironmentId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e514f95f-3d80-4c65-9772-09615e657732', NULL, NULL, N'server=.;database=ServiceMonitorDB;integrated security=yes;', NULL, NULL, 15000, N'SQL Server Local Instance', N'd223ba25-a1a2-4639-81ed-efd02ee92dbb', N'c92b798a-9325-43b3-8f59-4a5986fd96bb', NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceEnvironments] ([Id], [Url], [Address], [ConnectionString], [TypeName], [WindowsServiceName], [Interval], [Description], [ServiceId], [EnvironmentId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'f1aa7629-8677-4756-9fe0-6017ee0c2520', NULL, N'192.168.1.1', NULL, NULL, NULL, 15000, N'DNS gateway', N'e7be45db-900f-496c-bea8-c81dd8baf6d3', N'c92b798a-9325-43b3-8f59-4a5986fd96bb', NULL, CAST(N'2021-02-09T09:26:20.8560004' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8560004' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceEnvironments] ([Id], [Url], [Address], [ConnectionString], [TypeName], [WindowsServiceName], [Interval], [Description], [ServiceId], [EnvironmentId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'3043ff7b-3d95-4862-9b1a-c65f09e94c0d', NULL, NULL, NULL, NULL, N'Themes', 15000, N'Local Windows Service Test', N'1e2aed79-7769-41a6-9eae-cdee1ace95d9', N'c92b798a-9325-43b3-8f59-4a5986fd96bb', NULL, CAST(N'2021-02-09T09:26:20.8560004' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8560004' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceEnvironments] ([Id], [Url], [Address], [ConnectionString], [TypeName], [WindowsServiceName], [Interval], [Description], [ServiceId], [EnvironmentId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'41a973c6-6cd5-43dc-8691-f85bee30f8a1', N'http://localhost:10010/api/v1/Dashboard/ServiceWatcherItem', NULL, NULL, NULL, NULL, 15000, N'Self Service', N'f37e40af-61c4-4c40-af20-73c51d0c1fab', N'c92b798a-9325-43b3-8f59-4a5986fd96bb', NULL, CAST(N'2021-02-09T09:26:20.8560004' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8560004' AS DateTime2), 1)
GO
INSERT [dbo].[Services] ([Id], [Name], [Description], [ServiceCategoryId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'f37e40af-61c4-4c40-af20-73c51d0c1fab', N'ServiceMonitorAPI', N'Self API', N'051c5d53-0c21-4aac-b468-cfba72f42a57', NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), 1)
GO
INSERT [dbo].[Services] ([Id], [Name], [Description], [ServiceCategoryId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e7be45db-900f-496c-bea8-c81dd8baf6d3', N'MY-DESKTOP', N'Local Server', N'f5d008f4-7e5a-4486-b097-fd1f25f7443a', NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), 1)
GO
INSERT [dbo].[Services] ([Id], [Name], [Description], [ServiceCategoryId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'1e2aed79-7769-41a6-9eae-cdee1ace95d9', N'Themes', N'My Local Windows Service', N'019a6091-09f7-4d6c-b609-a039faf1cb7c', NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), 1)
GO
INSERT [dbo].[Services] ([Id], [Name], [Description], [ServiceCategoryId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'd223ba25-a1a2-4639-81ed-efd02ee92dbb', N'ServiceMonitorDB', N'Self Database', N'9aeaff71-2d98-4b5e-8245-6039b61e7d1b', NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatuses] ([Id], [SuccessStatus], [NumberOfWatch], [LastWatch], [ServiceEnvironmentId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', 1, 28, CAST(N'2021-02-09T10:17:06.7102453' AS DateTime2), N'f1aa7629-8677-4756-9fe0-6017ee0c2520', NULL, CAST(N'2021-02-09T10:10:05.6461849' AS DateTime2), NULL, CAST(N'2021-02-09T10:10:05.6461884' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatuses] ([Id], [SuccessStatus], [NumberOfWatch], [LastWatch], [ServiceEnvironmentId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', 1, 28, CAST(N'2021-02-09T10:17:06.6922980' AS DateTime2), N'e514f95f-3d80-4c65-9772-09615e657732', NULL, CAST(N'2021-02-09T09:56:09.7501322' AS DateTime2), NULL, CAST(N'2021-02-09T09:56:09.7501324' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatuses] ([Id], [SuccessStatus], [NumberOfWatch], [LastWatch], [ServiceEnvironmentId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', 1, 28, CAST(N'2021-02-09T10:17:06.7112157' AS DateTime2), N'3043ff7b-3d95-4862-9b1a-c65f09e94c0d', NULL, CAST(N'2021-02-09T09:56:09.7501138' AS DateTime2), NULL, CAST(N'2021-02-09T09:56:09.7501166' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatuses] ([Id], [SuccessStatus], [NumberOfWatch], [LastWatch], [ServiceEnvironmentId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'587fd292-b329-4d2e-b021-b48edb0fccff', 1, 28, CAST(N'2021-02-09T10:17:06.7372768' AS DateTime2), N'41a973c6-6cd5-43dc-8691-f85bee30f8a1', NULL, CAST(N'2021-02-09T09:56:09.7501186' AS DateTime2), NULL, CAST(N'2021-02-09T09:56:09.7501200' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'31ecf548-fce4-42be-aa7d-0041a4e08810', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:33.2037461' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:33.1911764' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'cc1c5740-7faf-41d5-9c0b-022f6170012c', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:14.9572911' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:14.9463679' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'1e2ad259-06ee-438f-977f-028ecaedf274', N'Themes', N'WindowsService', 0, N'Current Status of the Service is Stopped', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:42.4351985' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:42.4216397' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'f8b72453-d6af-4e0e-81af-032620c77072', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:57.6037358' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:57.5937979' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e4e4d48e-59a5-45b1-86d4-0748da19ff69', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:15:45.0590087' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:44.8567576' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'af109d1f-aa19-44a7-aa4c-099e99d83c3a', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:24.1093839' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:24.0929060' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'ce135c68-2985-440c-a16a-0a544fe95daf', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:17:00.6529246' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:00.6425102' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'9e22890e-2092-4a32-bf1e-0ac809cc8852', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:08.9543714' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:08.9171249' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b5f6df6c-1702-4426-8cdc-0b1ca25ca3fc', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:21.0672219' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:21.0592540' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'35d1dd6c-7523-4487-bd78-0cef23e33d4d', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:15:47.6362765' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:47.6282637' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'96131305-8a58-43b5-a233-0e55c0bd0a37', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:36.2590225' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:36.2450783' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'45c9c351-9b1a-4055-9cc8-0ee498ce4652', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:05.8868033' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:05.8726300' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b74a8bc5-ca85-4a4b-893e-11eada13a8b0', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:57.6269325' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:57.6146059' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'1fb3df43-5a91-4cc0-98d2-136af1afd2b2', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:39.3651317' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:39.3475947' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e902539b-0e53-4650-a3a6-15030e31d4b0', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:08.9484979' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:08.9179280' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b37ee0b1-729a-4dcd-ba4f-16983b9f7962', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:15:50.6359644' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:50.6252248' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'95c7c637-1b9f-436d-adde-1f59ac3d3c9d', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:17:00.6338299' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:00.6237452' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'bdfb83e3-4c45-4860-afab-206d3266d376', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:11.9386946' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:11.9275012' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'31cc346d-40ec-44c9-8267-26c64672f876', N'Themes', N'WindowsService', 0, N'Current Status of the Service is Stopped', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:45.4891659' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:45.4690441' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'4d97751b-f1db-4c48-ade4-28259603d9bf', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:15:53.6899911' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:53.6807186' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'6027d7c4-1178-4f0c-839f-295dab6ce0ef', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:02.8479405' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:02.8294859' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'0b16d11d-f9d2-4607-83bd-2c7f0478c423', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:14.9865480' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:14.9697939' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'3c1f68c8-e96f-499f-93a6-2d9128ad1d54', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:17:00.6502871' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:00.6421567' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'9d6a7b48-f042-4f27-9e8b-2fe644d6e3c7', N'Themes', N'WindowsService', 0, N'Current Status of the Service is Stopped', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:33.2539306' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:33.2431593' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'1a736fce-ce4a-4b30-86a7-314162bb2f44', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:15:47.6043225' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:47.5871577' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'ff1d2d47-f980-41ce-9601-33cac0a3f5c6', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:15:45.0573207' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:44.8567509' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'96269e15-c3f2-43c7-9eb8-3a70321147b7', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:39.6915410' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:39.5022392' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'86e7fb74-46d2-4303-b2d9-3ab0414f29ae', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:36.2814367' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:36.2717043' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'4033c2a5-e2c0-4db3-a464-3b09b0ccc7b0', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:27.1898592' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:27.1712137' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'9e7a5032-4a32-4d0d-9db8-3b33e643b27f', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:15:47.6212605' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:47.6116611' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'238c336f-300b-4ffe-b9a7-3b924bf1b163', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:24.1328524' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:24.1213118' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b0eb8b79-da5b-45fa-8f42-3be020c8d056', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:15:50.7244513' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:50.7026625' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'5e7d7f7a-a589-411f-9544-3bfcec308a28', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:30.2465564' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:30.2196912' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b3b28fd1-3a9e-4f64-be0e-3d640127a998', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:17:06.7198467' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:06.7023924' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b697d00b-c7e1-4d69-bcf2-3ffa14ad22d1', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:05.9416759' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:05.8984649' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'0b34366e-4415-4222-a598-416128befe1d', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:33.2454531' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:33.2307261' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'd6499600-e66a-45ad-9dde-44499dfb35a9', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:14.9777427' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:14.9645778' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e58cdcfd-25f8-4eb3-bebc-44cc7cc89168', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:15:59.8042272' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:59.7943060' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b08c48c4-6d58-4681-9c2b-46c0db64f1b8', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:17:03.6963282' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:03.6893221' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'105a97a8-6a34-4efd-a1ff-470917c9b6ce', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:30.1986754' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:30.1881401' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'dba1e0d1-4951-4e8f-87d0-4838ddddcdf9', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:27.1782544' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:27.1526553' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'06000155-39dd-4500-89b0-488b3e8de29f', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:15:59.7655253' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:59.7564787' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'ef9d76ea-35b1-43c6-95af-4d01722ef866', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:21.0378476' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:21.0272209' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'52b2de87-8ebe-4ae3-9ed7-523e80172e71', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:54.6072472' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:54.5613549' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'a59e2d5e-a221-4077-abb0-54df602f9c01', N'Themes', N'WindowsService', 0, N'Current Status of the Service is Stopped', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:36.2568648' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:36.2464583' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'a18431e3-1d4f-46f2-a084-5725cf28642a', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:17.9952769' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:17.9823918' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'61e8620b-4062-457b-8497-59af9f4b9077', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:17:03.6782989' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:03.6670568' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'bc5872f9-c4fb-4abe-8ec3-5dd92398c90d', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:42.4179184' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:42.4092795' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'cdbda144-510d-4fba-8d45-5f67b8a09f45', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:15.0011511' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:14.9933821' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'99b2d3a7-5ff1-4392-9d84-5fdc42d23e1f', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:42.4305134' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:42.4216397' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e76cef9e-952c-4640-b4d1-6106be4f84f5', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:17:00.6637856' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:00.6563725' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'4a2bd263-1636-412a-8630-664fbe486fe2', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:14:43.1135271' AS DateTime2), NULL, CAST(N'2021-02-09T10:14:43.0681653' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'd049ccc8-931c-49be-b12f-67c9b37aca9c', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:17:03.6576687' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:03.6492529' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'70cef641-797b-4645-b5a8-6c7cb2f350e3', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:48.4888605' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:48.4799194' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'd0f1e6a2-07c6-4a9f-a04c-6ced0a1cbaec', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:48.5298952' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:48.5178966' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'fbff532b-1e2d-460b-a17d-6e6949975177', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:39.4762941' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:39.4168071' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'967dd045-ed5c-45ce-997e-7d362def6e90', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:27.1391721' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:27.1249611' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'4171e75c-18c5-443b-800b-7e820d0f4b9d', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:15:56.7083023' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:56.6984639' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'406e1e9f-dc9b-416d-8bc1-84ed60388a95', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:42.4603438' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:42.4461664' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'c0bc7df8-0789-49a8-9f0b-854e91d3c24e', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:18.0371435' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:18.0291797' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'fa4863e3-dad2-434e-95ac-876b8d2db41f', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:21.0928573' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:21.0778562' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'28ac6a33-9604-465e-9e84-87d59c743e83', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:05.8574209' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:05.8506663' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b0172a71-73a5-460d-88b5-885f03458ed8', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:15:56.7302077' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:56.7138539' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'f19d0636-4ce8-44f0-b5e8-8909d67408fe', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:15:45.0565368' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:44.8567396' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'2d57d820-ea55-4cb5-bedf-8945b8268484', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:30.2013823' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:30.1882395' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'28d050b2-6ae4-4e9b-8f68-8eaed94edebf', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:11.9452046' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:11.9299054' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'7583b86b-9a5e-4628-85f0-8fcec415e733', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:57.6339731' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:57.6229095' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'd2ba42b2-6d46-40ac-8f5e-95d923ab98a3', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:14:43.1713093' AS DateTime2), NULL, CAST(N'2021-02-09T10:14:43.0783229' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'5d400034-ee8a-4051-a28d-97072d4ec9b2', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:02.8387765' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:02.8301309' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'10f5de56-3cd4-4b94-8cc0-9d24d694f512', N'Themes', N'WindowsService', 0, N'Current Status of the Service is Stopped', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:51.5370098' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:51.5243926' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'786c579a-dfe0-4ec5-9cf7-a0a103c2aa64', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:24.1705349' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:24.1532092' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'cca4788d-d6ab-410c-b9b2-a1a0a03226b3', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:02.8228186' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:02.8078750' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'3b0d8764-3000-463e-9865-a33e74a2d762', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:14:43.1466457' AS DateTime2), NULL, CAST(N'2021-02-09T10:14:43.0901699' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'a9a44359-98a0-4880-bd67-a47a33fe7b2d', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:15:59.7950559' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:59.7837997' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'87f7e91c-6c77-4344-b1df-aa9637869b57', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:18.0238744' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:18.0092302' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'be7fa485-3986-4a71-82d0-adb4d4f3b458', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:45.4726297' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:45.4636391' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'382f1b4a-6d89-466b-bf72-ae3e992e27e1', N'Themes', N'WindowsService', 0, N'Current Status of the Service is Stopped', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:39.4994060' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:39.4631745' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'45802013-f165-437f-9c13-aeacbc22b8cc', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:09.0251750' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:08.9712078' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'c1e7f5a7-0c50-47cf-9697-b13344527883', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:11.9162395' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:11.9091411' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'64920a39-d80c-4810-96cc-b45ad228939d', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:15:47.6241601' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:47.6114476' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'fc9aabb0-afec-41e7-bfd0-b532dfd56b12', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:15:50.6437997' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:50.6343727' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'4a95455f-e47f-4dca-a93b-b7d8bbb1eafc', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:51.5172908' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:51.5087473' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e09147b2-2132-40ba-973d-b87b40205de1', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:36.2374531' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:36.2312895' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'a34e51e7-0008-4654-978f-ba740f16290e', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:45.4576993' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:45.4516435' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'd560bdc5-bdc4-42e5-9412-c0728ab85159', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:54.6299468' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:54.6135450' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'88b65033-9012-4c2a-b437-c65259bf0e8a', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:17:06.7421659' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:06.7289270' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'ae81cf2d-7ea6-42c4-b613-c716e3a07f96', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:02.8557143' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:02.8480407' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'05997241-9099-42e7-b1c5-c85572fd73e5', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:54.6683179' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:54.6511453' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'62d25e0d-4e4e-4600-8dd3-ca4a0bc37180', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:17:03.6686646' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:03.6622250' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'445aa92d-8460-48d1-bba7-cb7b827a6bc4', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:15:56.7421862' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:56.7304027' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'451b8f56-506c-407f-88c9-cc4e436aa748', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:51.5666991' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:51.5469950' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'336e91e9-70ac-4e19-b737-cc63202b24ad', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:17:06.7122797' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:06.7023924' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e9f01489-67e9-42be-889b-cdc505badae4', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:14:43.2064985' AS DateTime2), NULL, CAST(N'2021-02-09T10:14:43.1743366' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'c01858d4-8d9c-448d-87af-ce44f3d66895', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:18.0114137' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:18.0012800' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'66f13816-063f-4418-8022-d01acfeb3975', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:27.1641988' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:27.1473925' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'674afbc2-5a1a-4e06-a5a4-d2d029db1ffd', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:15:53.7193195' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:53.7037226' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'20aacbe1-d9a9-4773-8f93-d33a1a837dc1', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:30.1739833' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:30.1653058' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'ebddc866-2e47-4905-818f-d3afc67919d8', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:15:56.7212764' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:56.7126930' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b20d99b1-e335-4686-bbaf-d49b1295b08d', N'Themes', N'WindowsService', 1, N'Current Status of the Service is Running', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:05.8939199' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:05.8744119' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'72e20c12-aaf1-4786-82d6-d8901b31c89c', N'Themes', N'WindowsService', 0, N'Current Status of the Service is Stopped', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:48.5115946' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:48.4992961' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'c3a41150-f6e3-443f-9dec-d96394de5fc0', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:15:50.6203200' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:50.6117850' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'f2cce842-c4a0-49c5-a471-da51cb977e6e', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:33.2233784' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:33.2117599' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'dcd43989-0f9e-44da-b93a-dc431b6cffe3', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:15:59.7814958' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:59.7734531' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'cf13f837-4e1b-4760-a1ce-dc58bb71190a', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:16:08.8972623' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:08.8873848' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'acac29b1-0cdf-4ce7-bd5b-e1dd2edf9157', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:51.5342023' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:51.5243926' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'b3ca9835-e6c4-4a8a-a1ca-e6fe15544925', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:15:53.6801898' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:53.6737264' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'478b3487-6ffe-49e5-adc5-e8c0efec10ce', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:45.5084304' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:45.4969668' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'4af95c17-175f-47dc-9e04-e9063d3de2b7', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:11.9543863' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:11.9427915' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'566a5558-cfd4-4a0b-9c59-eb3874cf9b19', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:17:06.6956733' AS DateTime2), NULL, CAST(N'2021-02-09T10:17:06.6869324' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'6ca16e8b-4caa-4b1e-8339-ec1a549c68b1', N'Themes', N'WindowsService', 0, N'Current Status of the Service is Stopped', NULL, N'8006c6f3-1002-4ad5-95c2-5afedbb6db58', NULL, CAST(N'2021-02-09T10:16:54.6267792' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:54.6121114' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e1a42ff8-0f59-436e-ae54-f1373e81cc48', N'ServiceMonitorAPI', N'HttpRequest', 1, NULL, NULL, N'587fd292-b329-4d2e-b021-b48edb0fccff', NULL, CAST(N'2021-02-09T10:16:57.6465390' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:57.6386274' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'ea97c736-743e-4a98-9e15-f49372ed63f4', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:15:45.0605030' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:44.8567428' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'd56f1f93-f9b6-4492-b928-f68b7df374fd', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:21.0592363' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:21.0505663' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'925829b9-2851-4817-ae7e-f9de805a2846', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:24.1304799' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:24.1213118' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'a7d20065-b3a3-42e5-a218-fb1f143f478a', N'MY-DESKTOP', N'Ping', 1, N'Successful ping', NULL, N'99c72356-fc6b-4b5f-8b05-1188fdc0b430', NULL, CAST(N'2021-02-09T10:16:48.5133364' AS DateTime2), NULL, CAST(N'2021-02-09T10:16:48.4992961' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceStatusLogs] ([Id], [Target], [ActionName], [SuccessfulStatus], [Message], [Description], [ServiceStatusId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'7a834e1f-ce3e-4a5c-adb5-fcb8f3c5888f', N'ServiceMonitorDB', N'OpenDatabaseConnection', 1, NULL, NULL, N'c8036e20-28cc-43f2-8e9f-4f6eb4cbf312', NULL, CAST(N'2021-02-09T10:15:53.6630612' AS DateTime2), NULL, CAST(N'2021-02-09T10:15:53.6536419' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceWatchers] ([Id], [ServiceId], [WatcherId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'de9e545c-cb45-4513-82bb-157ac6f613eb', N'e7be45db-900f-496c-bea8-c81dd8baf6d3', N'62067c36-7ed5-4650-9395-f1c55a293471', NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceWatchers] ([Id], [ServiceId], [WatcherId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'0ab1fad0-2394-4f72-bfb1-1b36acf77e92', N'1e2aed79-7769-41a6-9eae-cdee1ace95d9', N'6f49f783-3c07-45c6-8ee9-3280944078d8', NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceWatchers] ([Id], [ServiceId], [WatcherId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'e303fac1-be6a-4af7-9340-72facc635ccd', N'f37e40af-61c4-4c40-af20-73c51d0c1fab', N'48665a08-2566-461c-be7c-be5280562264', NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), 1)
GO
INSERT [dbo].[ServiceWatchers] ([Id], [ServiceId], [WatcherId], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'38e524c4-ec6d-4a7c-b24b-c69eb66715d2', N'd223ba25-a1a2-4639-81ed-efd02ee92dbb', N'f059cc22-01de-442c-ab04-ffbc9ff3ab04', NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), NULL, CAST(N'2021-02-09T09:29:29.1200000' AS DateTime2), 1)
GO
INSERT [dbo].[Watchers] ([Id], [Name], [Description], [AssemblyQualifiedName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'6f49f783-3c07-45c6-8ee9-3280944078d8', N'WindowsServiceWatcher', N'Watcher for Windows Services', N'ServiceMonitoring.Core.Watchers.WindowsServiceWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null', NULL, CAST(N'2021-02-09T09:26:20.8564572' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8564575' AS DateTime2), 1)
GO
INSERT [dbo].[Watchers] ([Id], [Name], [Description], [AssemblyQualifiedName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'48665a08-2566-461c-be7c-be5280562264', N'HttpRequestWatcher', N'Watcher for http requests', N'ServiceMonitoring.Core.Watchers.HttpRequestWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null', NULL, CAST(N'2021-02-09T09:26:20.8564440' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8564450' AS DateTime2), 1)
GO
INSERT [dbo].[Watchers] ([Id], [Name], [Description], [AssemblyQualifiedName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'62067c36-7ed5-4650-9395-f1c55a293471', N'PingWatcher', N'Watcher for ping requests', N'ServiceMonitoring.Core.Watchers.PingWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null', NULL, CAST(N'2021-02-09T09:26:20.8564520' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8564522' AS DateTime2), 1)
GO
INSERT [dbo].[Watchers] ([Id], [Name], [Description], [AssemblyQualifiedName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive]) VALUES (N'f059cc22-01de-442c-ab04-ffbc9ff3ab04', N'SqlServerDatabaseWatcher', N'Watcher for SQL Server databases', N'ServiceMonitoring.Core.Watchers.SqlServerDatabaseWatcher, ServiceMonitoring.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null', NULL, CAST(N'2021-02-09T09:26:20.8561802' AS DateTime2), NULL, CAST(N'2021-02-09T09:26:20.8561810' AS DateTime2), 1)
GO
/****** Object:  Index [IX_ServiceEnvironments_EnvironmentId]    Script Date: 2/10/2021 9:10:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceEnvironments_EnvironmentId] ON [dbo].[ServiceEnvironments]
(
	[EnvironmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceEnvironments_ServiceId]    Script Date: 2/10/2021 9:10:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceEnvironments_ServiceId] ON [dbo].[ServiceEnvironments]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceOwners_ServiceEnvironmentId]    Script Date: 2/10/2021 9:10:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceOwners_ServiceEnvironmentId] ON [dbo].[ServiceOwners]
(
	[ServiceEnvironmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Services_ServiceCategoryId]    Script Date: 2/10/2021 9:10:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Services_ServiceCategoryId] ON [dbo].[Services]
(
	[ServiceCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceStatuses_ServiceEnvironmentId]    Script Date: 2/10/2021 9:10:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceStatuses_ServiceEnvironmentId] ON [dbo].[ServiceStatuses]
(
	[ServiceEnvironmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceStatusLogs_ServiceStatusId]    Script Date: 2/10/2021 9:10:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceStatusLogs_ServiceStatusId] ON [dbo].[ServiceStatusLogs]
(
	[ServiceStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceWatchers_ServiceId]    Script Date: 2/10/2021 9:10:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceWatchers_ServiceId] ON [dbo].[ServiceWatchers]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceWatchers_WatcherId]    Script Date: 2/10/2021 9:10:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceWatchers_WatcherId] ON [dbo].[ServiceWatchers]
(
	[WatcherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserInRoles_RoleId]    Script Date: 2/10/2021 9:10:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserInRoles_RoleId] ON [dbo].[UserInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Environments] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ServiceCategories] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ServiceEnvironments] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ServiceStatuses] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ServiceStatusLogs] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ServiceWatchers] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Watchers] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ServiceEnvironments]  WITH CHECK ADD  CONSTRAINT [FK_ServiceEnvironments_Environments_EnvironmentId] FOREIGN KEY([EnvironmentId])
REFERENCES [dbo].[Environments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceEnvironments] CHECK CONSTRAINT [FK_ServiceEnvironments_Environments_EnvironmentId]
GO
ALTER TABLE [dbo].[ServiceEnvironments]  WITH CHECK ADD  CONSTRAINT [FK_ServiceEnvironments_Services_ServiceId] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceEnvironments] CHECK CONSTRAINT [FK_ServiceEnvironments_Services_ServiceId]
GO
ALTER TABLE [dbo].[ServiceOwners]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOwners_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceOwners] CHECK CONSTRAINT [FK_ServiceOwners_Roles_RoleId]
GO
ALTER TABLE [dbo].[ServiceOwners]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOwners_ServiceEnvironments_ServiceEnvironmentId] FOREIGN KEY([ServiceEnvironmentId])
REFERENCES [dbo].[ServiceEnvironments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceOwners] CHECK CONSTRAINT [FK_ServiceOwners_ServiceEnvironments_ServiceEnvironmentId]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_ServiceCategories_ServiceCategoryId] FOREIGN KEY([ServiceCategoryId])
REFERENCES [dbo].[ServiceCategories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_ServiceCategories_ServiceCategoryId]
GO
ALTER TABLE [dbo].[ServiceStatuses]  WITH CHECK ADD  CONSTRAINT [FK_ServiceStatuses_ServiceEnvironments_ServiceEnvironmentId] FOREIGN KEY([ServiceEnvironmentId])
REFERENCES [dbo].[ServiceEnvironments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceStatuses] CHECK CONSTRAINT [FK_ServiceStatuses_ServiceEnvironments_ServiceEnvironmentId]
GO
ALTER TABLE [dbo].[ServiceStatusLogs]  WITH CHECK ADD  CONSTRAINT [FK_ServiceStatusLogs_ServiceStatuses_ServiceStatusId] FOREIGN KEY([ServiceStatusId])
REFERENCES [dbo].[ServiceStatuses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceStatusLogs] CHECK CONSTRAINT [FK_ServiceStatusLogs_ServiceStatuses_ServiceStatusId]
GO
ALTER TABLE [dbo].[ServiceWatchers]  WITH CHECK ADD  CONSTRAINT [FK_ServiceWatchers_Services_ServiceId] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceWatchers] CHECK CONSTRAINT [FK_ServiceWatchers_Services_ServiceId]
GO
ALTER TABLE [dbo].[ServiceWatchers]  WITH CHECK ADD  CONSTRAINT [FK_ServiceWatchers_Watchers_WatcherId] FOREIGN KEY([WatcherId])
REFERENCES [dbo].[Watchers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceWatchers] CHECK CONSTRAINT [FK_ServiceWatchers_Watchers_WatcherId]
GO
ALTER TABLE [dbo].[UserInRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInRoles] CHECK CONSTRAINT [FK_UserInRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserInRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserInRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInRoles] CHECK CONSTRAINT [FK_UserInRoles_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [ServiceMonitorDB] SET  READ_WRITE 
GO
