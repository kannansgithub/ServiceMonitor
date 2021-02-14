USE [master]
GO
CREATE DATABASE [ServiceMonitorDB]
GO
USE [ServiceMonitorDB]
GO
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
/****** Object:  Table [dbo].[Environments]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[ServiceCategories]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[ServiceEnvironments]    Script Date: 2/14/2021 10:49:07 PM ******/
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
	[FailedNotificationRequired] [bit] NOT NULL,
	[NotificationMailIds] [nvarchar](max) NULL,
	[PasswordKey] [nvarchar](max) NULL,
	[ServerName] [nvarchar](max) NULL,
	[UsernameKey] [nvarchar](max) NULL,
 CONSTRAINT [PK_ServiceEnvironments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceOwners]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[Services]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[ServiceStatuses]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[ServiceStatusLogs]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[ServiceWatchers]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[UserInRoles]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Table [dbo].[Watchers]    Script Date: 2/14/2021 10:49:07 PM ******/
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
/****** Object:  Index [IX_ServiceEnvironments_EnvironmentId]    Script Date: 2/14/2021 10:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceEnvironments_EnvironmentId] ON [dbo].[ServiceEnvironments]
(
	[EnvironmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceEnvironments_ServiceId]    Script Date: 2/14/2021 10:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceEnvironments_ServiceId] ON [dbo].[ServiceEnvironments]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceOwners_ServiceEnvironmentId]    Script Date: 2/14/2021 10:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceOwners_ServiceEnvironmentId] ON [dbo].[ServiceOwners]
(
	[ServiceEnvironmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Services_ServiceCategoryId]    Script Date: 2/14/2021 10:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Services_ServiceCategoryId] ON [dbo].[Services]
(
	[ServiceCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceStatuses_ServiceEnvironmentId]    Script Date: 2/14/2021 10:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceStatuses_ServiceEnvironmentId] ON [dbo].[ServiceStatuses]
(
	[ServiceEnvironmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceStatusLogs_ServiceStatusId]    Script Date: 2/14/2021 10:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceStatusLogs_ServiceStatusId] ON [dbo].[ServiceStatusLogs]
(
	[ServiceStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceWatchers_ServiceId]    Script Date: 2/14/2021 10:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceWatchers_ServiceId] ON [dbo].[ServiceWatchers]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceWatchers_WatcherId]    Script Date: 2/14/2021 10:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceWatchers_WatcherId] ON [dbo].[ServiceWatchers]
(
	[WatcherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserInRoles_RoleId]    Script Date: 2/14/2021 10:49:07 PM ******/
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
ALTER TABLE [dbo].[ServiceEnvironments] ADD  DEFAULT (CONVERT([bit],(0))) FOR [FailedNotificationRequired]
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
