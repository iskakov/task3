USE [master]
GO

/****** Object:  Database [Task3]    Script Date: 09.07.2020 10:56:19 ******/
CREATE DATABASE [Task3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Task3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Task3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Task3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Task3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Task3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Task3] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Task3] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Task3] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Task3] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Task3] SET ARITHABORT OFF 
GO

ALTER DATABASE [Task3] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Task3] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Task3] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Task3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Task3] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Task3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Task3] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Task3] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Task3] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Task3] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Task3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Task3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Task3] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Task3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Task3] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Task3] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Task3] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Task3] SET RECOVERY FULL 
GO

ALTER DATABASE [Task3] SET  MULTI_USER 
GO

ALTER DATABASE [Task3] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Task3] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Task3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Task3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Task3] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Task3] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Task3] SET  READ_WRITE 
GO

USE [Task3]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[primarykey] [uniqueidentifier] NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[street] [nvarchar](100) NOT NULL,
	[number] [int] NOT NULL,
	[housing] [nvarchar](20) NULL,
	[network_area_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[primarykey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consumer]    Script Date: 09.07.2020 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consumer](
	[primarykey] [uniqueidentifier] NOT NULL,
	[personal_account] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Consumer] PRIMARY KEY CLUSTERED 
(
	[primarykey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetworkArea]    Script Date: 09.07.2020 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetworkArea](
	[primarykey] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NetworkArea] PRIMARY KEY CLUSTERED 
(
	[primarykey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetworkSection]    Script Date: 09.07.2020 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetworkSection](
	[primarykey] [uniqueidentifier] NOT NULL,
	[number] [int] NOT NULL,
	[year_pipeline] [int] NOT NULL,
	[type_pipeline_id] [uniqueidentifier] NOT NULL,
	[type_isolation_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NetworkSection] PRIMARY KEY CLUSTERED 
(
	[primarykey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetworkSection2ObjectHeatConsum]    Script Date: 09.07.2020 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetworkSection2ObjectHeatConsum](
	[network_section_id] [uniqueidentifier] NOT NULL,
	[object_heat_consum_id] [uniqueidentifier] NOT NULL,
	[is_inside] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObjectHeatConsumption]    Script Date: 09.07.2020 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjectHeatConsumption](
	[primarykey] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[date_registration] [date] NOT NULL,
	[consumer_id] [uniqueidentifier] NOT NULL,
	[building_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ObjectHeatConsumption] PRIMARY KEY CLUSTERED 
(
	[primarykey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeIsolation]    Script Date: 09.07.2020 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeIsolation](
	[primarykey] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeIsolation] PRIMARY KEY CLUSTERED 
(
	[primarykey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePipeline]    Script Date: 09.07.2020 14:57:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePipeline](
	[primarykey] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypePipeline] PRIMARY KEY CLUSTERED 
(
	[primarykey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_NetworkArea] FOREIGN KEY([network_area_id])
REFERENCES [dbo].[NetworkArea] ([primarykey])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Building_NetworkArea]
GO
ALTER TABLE [dbo].[NetworkSection]  WITH CHECK ADD  CONSTRAINT [FK_NetworkSection_TypeIsolation] FOREIGN KEY([type_isolation_id])
REFERENCES [dbo].[TypeIsolation] ([primarykey])
GO
ALTER TABLE [dbo].[NetworkSection] CHECK CONSTRAINT [FK_NetworkSection_TypeIsolation]
GO
ALTER TABLE [dbo].[NetworkSection]  WITH CHECK ADD  CONSTRAINT [FK_NetworkSection_TypePipeline] FOREIGN KEY([type_pipeline_id])
REFERENCES [dbo].[TypePipeline] ([primarykey])
GO
ALTER TABLE [dbo].[NetworkSection] CHECK CONSTRAINT [FK_NetworkSection_TypePipeline]
GO
ALTER TABLE [dbo].[NetworkSection2ObjectHeatConsum]  WITH CHECK ADD  CONSTRAINT [FK_NetworkSection2ObjectHeatConsum_NetworkSection] FOREIGN KEY([network_section_id])
REFERENCES [dbo].[NetworkSection] ([primarykey])
GO
ALTER TABLE [dbo].[NetworkSection2ObjectHeatConsum] CHECK CONSTRAINT [FK_NetworkSection2ObjectHeatConsum_NetworkSection]
GO
ALTER TABLE [dbo].[NetworkSection2ObjectHeatConsum]  WITH CHECK ADD  CONSTRAINT [FK_NetworkSection2ObjectHeatConsum_ObjectHeatConsumption] FOREIGN KEY([object_heat_consum_id])
REFERENCES [dbo].[ObjectHeatConsumption] ([primarykey])
GO
ALTER TABLE [dbo].[NetworkSection2ObjectHeatConsum] CHECK CONSTRAINT [FK_NetworkSection2ObjectHeatConsum_ObjectHeatConsumption]
GO
ALTER TABLE [dbo].[ObjectHeatConsumption]  WITH CHECK ADD  CONSTRAINT [FK_ObjectHeatConsumption_Building] FOREIGN KEY([building_id])
REFERENCES [dbo].[Building] ([primarykey])
GO
ALTER TABLE [dbo].[ObjectHeatConsumption] CHECK CONSTRAINT [FK_ObjectHeatConsumption_Building]
GO
ALTER TABLE [dbo].[ObjectHeatConsumption]  WITH CHECK ADD  CONSTRAINT [FK_ObjectHeatConsumption_Consumer] FOREIGN KEY([consumer_id])
REFERENCES [dbo].[Consumer] ([primarykey])
GO
ALTER TABLE [dbo].[ObjectHeatConsumption] CHECK CONSTRAINT [FK_ObjectHeatConsumption_Consumer]
GO



