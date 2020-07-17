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

INSERT INTO [dbo].[TypePipeline]
           ([primarykey]
           ,[name])
     VALUES
           ('5a9e1bfc-dd30-4868-b205-c602e9056858'
           ,'Надземная')
GO
INSERT INTO [dbo].[TypePipeline]
           ([primarykey]
           ,[name])
     VALUES
           ('1547accb-cf69-4f0c-a62e-b367d0730594'
           ,'Подземная')
GO
INSERT INTO [dbo].[TypePipeline]
           ([primarykey]
           ,[name])
     VALUES
           ('2daf87a1-cf3b-4615-bfae-2a820f49a384'
           ,'По подвалу')
GO

INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           ('ab515ada-2a5a-4353-b286-1feb2d7e817a'
           ,'ППУ')
GO
INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           ('5a30dc8e-d88e-4f37-9eab-9e9f70605d3c'
           ,'ППМ')
GO
INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           ('56d1b571-ecf5-4cf9-bdf2-59a4ea923065'
           ,'АПБ')
GO
INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           ('345dbab4-074a-4496-b005-956498037e68'
           ,'Изоляция из пенополиэтилена')
GO
INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           ('6b1ccaf3-d04c-4dee-8f93-0007f06656fa'
           ,'ВУС')
GO

INSERT INTO [dbo].[NetworkArea]
           ([primarykey]
           ,[name])
     VALUES
           ('96eb82c2-6f28-484e-bbad-f44a43b6dcde',
           'Район №1')
GO
INSERT INTO [dbo].[NetworkArea]
           ([primarykey]
           ,[name])
     VALUES
           ('50f15f5d-1a33-476b-bb54-5a1d2666f78e',
           'Район №2')
GO
INSERT INTO [dbo].[NetworkArea]
           ([primarykey]
           ,[name])
     VALUES
           ('f05d5dfe-6c50-46c7-ac9e-62b3ec7d71c7',
           'Район №3')
GO
INSERT INTO [dbo].[NetworkArea]
           ([primarykey]
           ,[name])
     VALUES
           ('35c27bf7-962a-4ebd-a640-fc15e039c45f',
           'Район №4')
GO
INSERT INTO [dbo].[NetworkArea]
           ([primarykey]
           ,[name])
     VALUES
           ('d9b28caf-aac8-4986-8768-313803077ec9',
           'Район №5')
GO
INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('4d74b323-ec4d-4f44-854b-de53b8959c00'
           ,'Пермь'
           ,'Пушкина'
           ,1
           ,'96eb82c2-6f28-484e-bbad-f44a43b6dcde')
GO
INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('fa7d13d6-6364-4106-92b8-7882a79cf439'
           ,'Пермь'
           ,'Пушкина'
           ,2
           ,'96eb82c2-6f28-484e-bbad-f44a43b6dcde')
GO
INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('6d41c851-640f-43d5-8b2c-b78745be5565'
           ,'Пермь'
           ,'Пушкина'
           ,3
           ,'96eb82c2-6f28-484e-bbad-f44a43b6dcde')
GO
INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('e6ed73bd-ecfa-4e43-9fe3-fce795535e18'
           ,'Пермь'
           ,'Ленина'
           ,1
           ,'96eb82c2-6f28-484e-bbad-f44a43b6dcde')
GO
INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('4b0465a6-e691-47f3-b1d8-7a6b853cee2f'
           ,'Пермь'
           ,'Ленина'
           ,2
           ,'96eb82c2-6f28-484e-bbad-f44a43b6dcde')
GO

INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('426d5f44-0f0e-45ca-a551-de33fdf16adc'
           ,'Пермь'
           ,'Ленина'
           ,5
           ,'f05d5dfe-6c50-46c7-ac9e-62b3ec7d71c7')
GO
INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('01d59601-bf69-4ae1-ad30-b6af9c21344a'
           ,'Пермь'
           ,'Ленина'
           ,6
           ,'f05d5dfe-6c50-46c7-ac9e-62b3ec7d71c7')
GO
INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('f62f791f-4a8d-4f4c-9060-348dabcd11aa'
           ,'Пермь'
           ,'Ленина'
           ,7
           ,'f05d5dfe-6c50-46c7-ac9e-62b3ec7d71c7')
GO

INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('6b217559-a0f7-4d23-b4ca-5bc7a0f67bbc'
           ,'Пермь'
           ,'Мира'
           ,8
           ,'d9b28caf-aac8-4986-8768-313803077ec9')
GO

INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('4273e949-07b1-4675-b9b0-92909170110c'
           ,'Пермь'
           ,'Мира'
           ,9
           ,'d9b28caf-aac8-4986-8768-313803077ec9')
GO

INSERT INTO [dbo].[Building]
           ([primarykey]
           ,[city]
           ,[street]
           ,[number]
           ,[network_area_id])
     VALUES
           ('943016a2-4408-4497-94f6-d81cbe295d38'
           ,'Пермь'
           ,'Мира'
           ,10
           ,'35c27bf7-962a-4ebd-a640-fc15e039c45f')
GO

INSERT INTO [dbo].[Consumer]
           ([primarykey]
           ,[personal_account])
     VALUES
           ('70a2dfa4-0367-42cf-a7a2-1410bf231a92'
           ,'56347278')
GO
INSERT INTO [dbo].[Consumer]
           ([primarykey]
           ,[personal_account])
     VALUES
           ('d46ac640-2665-44ce-bf01-0856995f73f2'
           ,'34355335')
GO
INSERT INTO [dbo].[Consumer]
           ([primarykey]
           ,[personal_account])
     VALUES
           ('e99f5745-d1a4-4b5a-9bd4-f6da4b67d487'
           ,'45745745')
GO
INSERT INTO [dbo].[Consumer]
           ([primarykey]
           ,[personal_account])
     VALUES
           ('da34972f-733b-4b2d-9e5e-0aad19803b62'
           ,'38732456')
GO
INSERT INTO [dbo].[Consumer]
           ([primarykey]
           ,[personal_account])
     VALUES
           ('a5e1c914-f0d6-488d-a597-80b97250173c'
           ,'84534683')
GO



INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('BD757698-69CB-4341-81E2-DF415A182F08'
           ,'ЭТРАИФ'
           ,'23.05.2018'
           ,'d46ac640-2665-44ce-bf01-0856995f73f2'
           ,'f62f791f-4a8d-4f4c-9060-348dabcd11aa')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('44ED121F-178D-4D92-8D6C-4051A994FCF0'
           ,'ОЕТОЦШ'
           ,'18.04.2018'
           ,'da34972f-733b-4b2d-9e5e-0aad19803b62'
           ,'6b217559-a0f7-4d23-b4ca-5bc7a0f67bbc')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('8B004285-0FDD-4773-8040-2DCFBA412D67'
           ,'ПУШРБТ'
           ,'02.10.2020'
           ,'d46ac640-2665-44ce-bf01-0856995f73f2'
           ,'fa7d13d6-6364-4106-92b8-7882a79cf439')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('24E29549-BB95-442F-8260-68A0E9D42060'
           ,'ЯЕЯРЩД'
           ,'10.09.2020'
           ,'d46ac640-2665-44ce-bf01-0856995f73f2'
           ,'4b0465a6-e691-47f3-b1d8-7a6b853cee2f')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('DED86A13-247D-4A44-81EE-2AA48998043A'
           ,'ДПЯИБХ'
           ,'11.08.2019'
           ,'da34972f-733b-4b2d-9e5e-0aad19803b62'
           ,'4273e949-07b1-4675-b9b0-92909170110c')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('CAAE3651-752C-4701-A28B-EC4276D1F21B'
           ,'ФКЮОЗЗ'
           ,'03.11.2019'
           ,'70a2dfa4-0367-42cf-a7a2-1410bf231a92'
           ,'4273e949-07b1-4675-b9b0-92909170110c')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
           ,'РШЕЖФС'
           ,'18.03.2019'
           ,'a5e1c914-f0d6-488d-a597-80b97250173c'
           ,'01d59601-bf69-4ae1-ad30-b6af9c21344a')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
           ,'ЛНХРМС'
           ,'16.08.2020'
           ,'a5e1c914-f0d6-488d-a597-80b97250173c'
           ,'01d59601-bf69-4ae1-ad30-b6af9c21344a')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('369FC788-1071-440C-8459-99820796770D'
           ,'ПЭЗЯОЗ'
           ,'27.01.2019'
           ,'a5e1c914-f0d6-488d-a597-80b97250173c'
           ,'6b217559-a0f7-4d23-b4ca-5bc7a0f67bbc')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('1097480E-2689-45C3-BF0A-71E8FC4D014E'
           ,'НКЦМШЦ'
           ,'23.11.2019'
           ,'70a2dfa4-0367-42cf-a7a2-1410bf231a92'
           ,'6D41C851-640F-43D5-8B2C-B78745BE5565')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
           ,'ХДДЭХН'
           ,'26.08.2018'
           ,'a5e1c914-f0d6-488d-a597-80b97250173c'
           ,'f62f791f-4a8d-4f4c-9060-348dabcd11aa')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('889017D7-3734-4406-BAEC-E41C6A490F9C'
           ,'ЩАМРЯЖ'
           ,'01.01.2020'
           ,'a5e1c914-f0d6-488d-a597-80b97250173c'
           ,'4b0465a6-e691-47f3-b1d8-7a6b853cee2f')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
           ,'МХНКДМ'
           ,'06.03.2018'
           ,'70a2dfa4-0367-42cf-a7a2-1410bf231a92'
           ,'01d59601-bf69-4ae1-ad30-b6af9c21344a')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('80C9E905-1EB9-4F56-9914-EF79217F18ED'
           ,'ЛРВЛХГ'
           ,'13.03.2019'
           ,'d46ac640-2665-44ce-bf01-0856995f73f2'
           ,'4b0465a6-e691-47f3-b1d8-7a6b853cee2f')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('F93953AE-8D0C-40BF-AF13-956CEA40128C'
           ,'ОХШТБЭ'
           ,'22.02.2020'
           ,'d46ac640-2665-44ce-bf01-0856995f73f2'
           ,'f62f791f-4a8d-4f4c-9060-348dabcd11aa')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('D820BF1F-C56E-4A59-9573-1F943A538FD0'
           ,'ОДЯЛОП'
           ,'21.08.2019'
           ,'70a2dfa4-0367-42cf-a7a2-1410bf231a92'
           ,'01d59601-bf69-4ae1-ad30-b6af9c21344a')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('2CB1ABEE-14E8-4A49-8C9A-6C61523846D3'
           ,'НОУИФМ'
           ,'21.02.2020'
           ,'70a2dfa4-0367-42cf-a7a2-1410bf231a92'
           ,'6D41C851-640F-43D5-8B2C-B78745BE5565')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('4C03B85B-C50A-4686-90DE-F28E403669DD'
           ,'ДЮЭАПФ'
           ,'03.04.2020'
           ,'70a2dfa4-0367-42cf-a7a2-1410bf231a92'
           ,'f62f791f-4a8d-4f4c-9060-348dabcd11aa')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('E4E4B652-52A5-4747-8888-E3852D051FB1'
           ,'ШВДКАЗ'
           ,'25.08.2020'
           ,'da34972f-733b-4b2d-9e5e-0aad19803b62'
           ,'4b0465a6-e691-47f3-b1d8-7a6b853cee2f')
GO
INSERT INTO [dbo].[ObjectHeatConsumption]
           ([primarykey]
           ,[name]
           ,[date_registration]
           ,[consumer_id]
           ,[building_id])
     VALUES
           ('2D041057-AF87-4824-9CCE-3B43DAECCA97'
           ,'ФКМАЛЯ'
           ,'18.10.2018'
           ,'a5e1c914-f0d6-488d-a597-80b97250173c'
           ,'943016a2-4408-4497-94f6-d81cbe295d38')
GO




INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('91d7c028-2631-41b4-b606-03493abad899'
            ,45
            ,2020
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('5191dc5f-043e-403c-9934-b42d5f8e4a1a'
            ,9
            ,2019
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('20e5c1c9-1ff0-43a6-a135-18ecfe884ee7'
            ,11
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('0473f5aa-4bed-4d3c-b2da-418d6dbc9ed3'
            ,49
            ,2019
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('e13c52e1-7d84-46c5-a125-aa98208f92b9'
            ,18
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('fdb35151-c160-42d0-8ddf-f783393add2e'
            ,3
            ,2018
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('11c4b90e-8e21-41ef-a766-7597ad2bea83'
            ,29
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('fab6ab1f-7aed-4802-9fd6-c92456110d4e'
            ,49
            ,2017
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'56D1B571-ECF5-4CF9-BDF2-59A4EA923065')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('6e96677f-181d-4346-aaba-943331cfbd0a'
            ,37
            ,2019
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('6e0bb406-fdca-4238-a747-78eae7f3570a'
            ,41
            ,2017
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('bf1580ae-f8d8-4d14-819f-04986f92459d'
            ,17
            ,2020
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'345DBAB4-074A-4496-B005-956498037E68')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('0fb682b8-139c-4555-bfed-75640cd75d0e'
            ,35
            ,2017
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('e86a4f99-07ca-439f-8166-e2c589d8ead1'
            ,45
            ,2019
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('e32971aa-d56e-48d8-99e5-300f59642479'
            ,28
            ,2018
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'56D1B571-ECF5-4CF9-BDF2-59A4EA923065')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('8d8721b7-e862-46e6-8aab-3ef8604f2d54'
            ,26
            ,2019
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('d2d61935-840f-414c-a045-04342108891d'
            ,12
            ,2017
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('e06cf820-7bf4-44fe-b1c5-9c2eecf387c2'
            ,43
            ,2017
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('1e4ac870-27b5-40e8-b1ae-6ed82600c7b0'
            ,37
            ,2020
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('233ce6df-e669-4ffe-9171-205d797279d1'
            ,10
            ,2017
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('ba5c0241-8d19-465b-b581-9d9ed3ab9b7c'
            ,28
            ,2019
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('0a822c9e-1d95-4536-85cc-8029b18c9429'
            ,16
            ,2017
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('1450f787-3976-4363-86d5-05a2ea4869ab'
            ,20
            ,2017
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('b926e6d1-ca79-4255-be27-52112012b574'
            ,31
            ,2018
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('e818bbf5-23db-4c8c-97de-f03b36db4434'
            ,36
            ,2018
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('57315cf2-69aa-4879-933b-2062ecc9ca1f'
            ,40
            ,2019
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'345DBAB4-074A-4496-B005-956498037E68')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('d44357e7-47d0-44f1-8679-683c5b0695b7'
            ,38
            ,2017
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('5949c179-d156-495d-88bc-ca182c61496f'
            ,23
            ,2018
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'56D1B571-ECF5-4CF9-BDF2-59A4EA923065')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('33bb7772-7fde-40e7-a017-8ea831a77697'
            ,25
            ,2020
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('fd0db4df-92d2-4098-8f83-12fb10e0b4a5'
            ,4
            ,2020
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('2de71cf1-9c00-4eb0-be0c-e3d1b6a82aac'
            ,7
            ,2019
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('1030b8d6-9898-4034-83bf-867cc912cc1b'
            ,4
            ,2017
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'56D1B571-ECF5-4CF9-BDF2-59A4EA923065')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('03ae60fd-4657-4559-b022-ec63f50720d2'
            ,21
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('fc0620de-1cb6-4f3f-8dda-154a3997da29'
            ,49
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('851eba74-ac61-4143-a474-701e4b5cc4d0'
            ,43
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('10b9cef2-938e-42d8-bbb7-1ac77b543f27'
            ,42
            ,2020
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('78a0cd66-32e8-46d4-849a-96900f2038bc'
            ,11
            ,2018
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'345DBAB4-074A-4496-B005-956498037E68')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('0a262fae-bffd-4b74-b0aa-5dd891b7d0ca'
            ,13
            ,2019
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'345DBAB4-074A-4496-B005-956498037E68')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('d017be58-270b-4728-a81a-4e931d647380'
            ,11
            ,2017
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('567af339-5573-44bb-b601-93309a2c7132'
            ,6
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'345DBAB4-074A-4496-B005-956498037E68')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('12ad7249-f7f8-4b48-9e7e-035d8e7ca283'
            ,29
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'345DBAB4-074A-4496-B005-956498037E68')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('1a175675-cf20-41ab-bffd-7206431fa9d1'
            ,39
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'345DBAB4-074A-4496-B005-956498037E68')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('2b02cba1-8a65-4de7-bac6-eaa6f027d830'
            ,20
            ,2017
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('4dc6f997-5dd3-44d2-bd01-ba64c0c07210'
            ,19
            ,2020
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('9c50fd32-620c-4e7f-a9f3-448b012c3455'
            ,35
            ,2019
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'56D1B571-ECF5-4CF9-BDF2-59A4EA923065')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('535c05c4-26e1-4872-996a-6ee36ada275e'
            ,19
            ,2020
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('981b50bb-f4f6-4895-8eae-5fa97658d1f5'
            ,30
            ,2020
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('8f119e21-3e0f-4f39-bbb8-d82a5f5f8c13'
            ,36
            ,2018
            ,'5A9E1BFC-DD30-4868-B205-C602E9056858'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('b784ffa2-d9a2-4632-ba08-07df390372c8'
            ,9
            ,2020
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'5A30DC8E-D88E-4F37-9EAB-9E9F70605D3C')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('cfc7ef8a-c371-41c3-9b5c-cfd214d58cc5'
            ,16
            ,2018
            ,'2DAF87A1-CF3B-4615-BFAE-2A820F49A384'
            ,'AB515ADA-2A5A-4353-B286-1FEB2D7E817A')
Go
INSERT INTO [dbo].[NetworkSection]
           ([primarykey]
           ,[number]
           ,[year_pipeline]
           ,[type_pipeline_id]
           ,[type_isolation_id])
     VALUES
           ('5e82b1df-dcd9-4ebf-a4be-5e0611b7bbf7'
            ,2
            ,2017
            ,'1547ACCB-CF69-4F0C-A62E-B367D0730594'
            ,'6B1CCAF3-D04C-4DEE-8F93-0007F06656FA')
Go

 INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('91D7C028-2631-41B4-B606-03493ABAD899'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('12AD7249-F7F8-4B48-9E7E-035D8E7CA283'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D2D61935-840F-414C-A045-04342108891D'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('BF1580AE-F8D8-4D14-819F-04986F92459D'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1450F787-3976-4363-86D5-05A2EA4869AB'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('B784FFA2-D9A2-4632-BA08-07DF390372C8'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FD0DB4DF-92D2-4098-8F83-12FB10E0B4A5'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FC0620DE-1CB6-4F3F-8DDA-154A3997DA29'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('20E5C1C9-1FF0-43A6-A135-18ECFE884EE7'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('10B9CEF2-938E-42D8-BBB7-1AC77B543F27'
            ,'92AEE48F-1EC4-4098-A505-1B3D2B8F5433'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('91D7C028-2631-41B4-B606-03493ABAD899'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('12AD7249-F7F8-4B48-9E7E-035D8E7CA283'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D2D61935-840F-414C-A045-04342108891D'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('BF1580AE-F8D8-4D14-819F-04986F92459D'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1450F787-3976-4363-86D5-05A2EA4869AB'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('B784FFA2-D9A2-4632-BA08-07DF390372C8'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FD0DB4DF-92D2-4098-8F83-12FB10E0B4A5'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FC0620DE-1CB6-4F3F-8DDA-154A3997DA29'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('20E5C1C9-1FF0-43A6-A135-18ECFE884EE7'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('10B9CEF2-938E-42D8-BBB7-1AC77B543F27'
            ,'F93953AE-8D0C-40BF-AF13-956CEA40128C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('91D7C028-2631-41B4-B606-03493ABAD899'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('12AD7249-F7F8-4B48-9E7E-035D8E7CA283'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D2D61935-840F-414C-A045-04342108891D'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('BF1580AE-F8D8-4D14-819F-04986F92459D'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1450F787-3976-4363-86D5-05A2EA4869AB'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('B784FFA2-D9A2-4632-BA08-07DF390372C8'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FD0DB4DF-92D2-4098-8F83-12FB10E0B4A5'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FC0620DE-1CB6-4F3F-8DDA-154A3997DA29'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('20E5C1C9-1FF0-43A6-A135-18ECFE884EE7'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('10B9CEF2-938E-42D8-BBB7-1AC77B543F27'
            ,'BD757698-69CB-4341-81E2-DF415A182F08'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('91D7C028-2631-41B4-B606-03493ABAD899'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('12AD7249-F7F8-4B48-9E7E-035D8E7CA283'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D2D61935-840F-414C-A045-04342108891D'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('BF1580AE-F8D8-4D14-819F-04986F92459D'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1450F787-3976-4363-86D5-05A2EA4869AB'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('B784FFA2-D9A2-4632-BA08-07DF390372C8'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FD0DB4DF-92D2-4098-8F83-12FB10E0B4A5'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FC0620DE-1CB6-4F3F-8DDA-154A3997DA29'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('20E5C1C9-1FF0-43A6-A135-18ECFE884EE7'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('10B9CEF2-938E-42D8-BBB7-1AC77B543F27'
            ,'4C03B85B-C50A-4686-90DE-F28E403669DD'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('233CE6DF-E669-4FFE-9171-205D797279D1'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('57315CF2-69AA-4879-933B-2062ECC9CA1F'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E32971AA-D56E-48D8-99E5-300F59642479'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('8D8721B7-E862-46E6-8AAB-3EF8604F2D54'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0473F5AA-4BED-4D3C-B2DA-418D6DBC9ED3'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('9C50FD32-620C-4E7F-A9F3-448B012C3455'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D017BE58-270B-4728-A81A-4E931D647380'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('B926E6D1-CA79-4255-BE27-52112012B574'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0A262FAE-BFFD-4B74-B0AA-5DD891B7D0CA'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('5E82B1DF-DCD9-4EBF-A4BE-5E0611B7BBF7'
            ,'24E29549-BB95-442F-8260-68A0E9D42060'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('233CE6DF-E669-4FFE-9171-205D797279D1'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('57315CF2-69AA-4879-933B-2062ECC9CA1F'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E32971AA-D56E-48D8-99E5-300F59642479'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('8D8721B7-E862-46E6-8AAB-3EF8604F2D54'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0473F5AA-4BED-4D3C-B2DA-418D6DBC9ED3'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('9C50FD32-620C-4E7F-A9F3-448B012C3455'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D017BE58-270B-4728-A81A-4E931D647380'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('B926E6D1-CA79-4255-BE27-52112012B574'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0A262FAE-BFFD-4B74-B0AA-5DD891B7D0CA'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('5E82B1DF-DCD9-4EBF-A4BE-5E0611B7BBF7'
            ,'E4E4B652-52A5-4747-8888-E3852D051FB1'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('233CE6DF-E669-4FFE-9171-205D797279D1'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('57315CF2-69AA-4879-933B-2062ECC9CA1F'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E32971AA-D56E-48D8-99E5-300F59642479'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('8D8721B7-E862-46E6-8AAB-3EF8604F2D54'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0473F5AA-4BED-4D3C-B2DA-418D6DBC9ED3'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('9C50FD32-620C-4E7F-A9F3-448B012C3455'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D017BE58-270B-4728-A81A-4E931D647380'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('B926E6D1-CA79-4255-BE27-52112012B574'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0A262FAE-BFFD-4B74-B0AA-5DD891B7D0CA'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('5E82B1DF-DCD9-4EBF-A4BE-5E0611B7BBF7'
            ,'889017D7-3734-4406-BAEC-E41C6A490F9C'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('233CE6DF-E669-4FFE-9171-205D797279D1'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('57315CF2-69AA-4879-933B-2062ECC9CA1F'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E32971AA-D56E-48D8-99E5-300F59642479'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('8D8721B7-E862-46E6-8AAB-3EF8604F2D54'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0473F5AA-4BED-4D3C-B2DA-418D6DBC9ED3'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('9C50FD32-620C-4E7F-A9F3-448B012C3455'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D017BE58-270B-4728-A81A-4E931D647380'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('B926E6D1-CA79-4255-BE27-52112012B574'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0A262FAE-BFFD-4B74-B0AA-5DD891B7D0CA'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('5E82B1DF-DCD9-4EBF-A4BE-5E0611B7BBF7'
            ,'80C9E905-1EB9-4F56-9914-EF79217F18ED'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('981B50BB-F4F6-4895-8EAE-5FA97658D1F5'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D44357E7-47D0-44F1-8679-683C5B0695B7'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1E4AC870-27B5-40E8-B1AE-6ED82600C7B0'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('535C05C4-26E1-4872-996A-6EE36ADA275E'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('851EBA74-AC61-4143-A474-701E4B5CC4D0'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1A175675-CF20-41AB-BFFD-7206431FA9D1'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0FB682B8-139C-4555-BFED-75640CD75D0E'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('11C4B90E-8E21-41EF-A766-7597AD2BEA83'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('6E0BB406-FDCA-4238-A747-78EAE7F3570A'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0A822C9E-1D95-4536-85CC-8029B18C9429'
            ,'E3DDDB49-7D51-4295-8E49-9A09A2BE5442'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('981B50BB-F4F6-4895-8EAE-5FA97658D1F5'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D44357E7-47D0-44F1-8679-683C5B0695B7'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1E4AC870-27B5-40E8-B1AE-6ED82600C7B0'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('535C05C4-26E1-4872-996A-6EE36ADA275E'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('851EBA74-AC61-4143-A474-701E4B5CC4D0'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1A175675-CF20-41AB-BFFD-7206431FA9D1'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0FB682B8-139C-4555-BFED-75640CD75D0E'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('11C4B90E-8E21-41EF-A766-7597AD2BEA83'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('6E0BB406-FDCA-4238-A747-78EAE7F3570A'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0A822C9E-1D95-4536-85CC-8029B18C9429'
            ,'DCD022EB-3AB2-46A8-A71B-6F82F90FE658'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('981B50BB-F4F6-4895-8EAE-5FA97658D1F5'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D44357E7-47D0-44F1-8679-683C5B0695B7'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1E4AC870-27B5-40E8-B1AE-6ED82600C7B0'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('535C05C4-26E1-4872-996A-6EE36ADA275E'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('851EBA74-AC61-4143-A474-701E4B5CC4D0'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1A175675-CF20-41AB-BFFD-7206431FA9D1'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0FB682B8-139C-4555-BFED-75640CD75D0E'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('11C4B90E-8E21-41EF-A766-7597AD2BEA83'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('6E0BB406-FDCA-4238-A747-78EAE7F3570A'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0A822C9E-1D95-4536-85CC-8029B18C9429'
            ,'B7718AB3-BD23-4EDD-AEDA-66AA202A254B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('981B50BB-F4F6-4895-8EAE-5FA97658D1F5'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('D44357E7-47D0-44F1-8679-683C5B0695B7'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1E4AC870-27B5-40E8-B1AE-6ED82600C7B0'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('535C05C4-26E1-4872-996A-6EE36ADA275E'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('851EBA74-AC61-4143-A474-701E4B5CC4D0'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1A175675-CF20-41AB-BFFD-7206431FA9D1'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0FB682B8-139C-4555-BFED-75640CD75D0E'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('11C4B90E-8E21-41EF-A766-7597AD2BEA83'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('6E0BB406-FDCA-4238-A747-78EAE7F3570A'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('0A822C9E-1D95-4536-85CC-8029B18C9429'
            ,'D820BF1F-C56E-4A59-9573-1F943A538FD0'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1030B8D6-9898-4034-83BF-867CC912CC1B'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('33BB7772-7FDE-40E7-A017-8EA831A77697'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('567AF339-5573-44BB-B601-93309A2C7132'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('6E96677F-181D-4346-AABA-943331CFBD0A'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('78A0CD66-32E8-46D4-849A-96900F2038BC'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E06CF820-7BF4-44FE-B1C5-9C2EECF387C2'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('BA5C0241-8D19-465B-B581-9D9ED3AB9B7C'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E13C52E1-7D84-46C5-A125-AA98208F92B9'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('5191DC5F-043E-403C-9934-B42D5F8E4A1A'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('4DC6F997-5DD3-44D2-BD01-BA64C0C07210'
            ,'369FC788-1071-440C-8459-99820796770D'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('1030B8D6-9898-4034-83BF-867CC912CC1B'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('33BB7772-7FDE-40E7-A017-8EA831A77697'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('567AF339-5573-44BB-B601-93309A2C7132'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('6E96677F-181D-4346-AABA-943331CFBD0A'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('78A0CD66-32E8-46D4-849A-96900F2038BC'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E06CF820-7BF4-44FE-B1C5-9C2EECF387C2'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('BA5C0241-8D19-465B-B581-9D9ED3AB9B7C'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E13C52E1-7D84-46C5-A125-AA98208F92B9'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('5191DC5F-043E-403C-9934-B42D5F8E4A1A'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('4DC6F997-5DD3-44D2-BD01-BA64C0C07210'
            ,'44ED121F-178D-4D92-8D6C-4051A994FCF0'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FAB6AB1F-7AED-4802-9FD6-C92456110D4E'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('5949C179-D156-495D-88BC-CA182C61496F'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('CFC7EF8A-C371-41C3-9B5C-CFD214D58CC5'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('8F119E21-3E0F-4F39-BBB8-D82A5F5F8C13'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E86A4F99-07CA-439F-8166-E2C589D8EAD1'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('2DE71CF1-9C00-4EB0-BE0C-E3D1B6A82AAC'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('2B02CBA1-8A65-4DE7-BAC6-EAA6F027D830'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('03AE60FD-4657-4559-B022-EC63F50720D2'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E818BBF5-23DB-4C8C-97DE-F03B36DB4434'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FDB35151-C160-42D0-8DDF-F783393ADD2E'
            ,'DED86A13-247D-4A44-81EE-2AA48998043A'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FAB6AB1F-7AED-4802-9FD6-C92456110D4E'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('5949C179-D156-495D-88BC-CA182C61496F'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('CFC7EF8A-C371-41C3-9B5C-CFD214D58CC5'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('8F119E21-3E0F-4F39-BBB8-D82A5F5F8C13'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E86A4F99-07CA-439F-8166-E2C589D8EAD1'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,0)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('2DE71CF1-9C00-4EB0-BE0C-E3D1B6A82AAC'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('2B02CBA1-8A65-4DE7-BAC6-EAA6F027D830'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('03AE60FD-4657-4559-B022-EC63F50720D2'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('E818BBF5-23DB-4C8C-97DE-F03B36DB4434'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,1)
Go
     INSERT INTO [dbo].[NetworkSection2ObjectHeatConsum]
           ([network_section_id]
           ,[object_heat_consum_id]
           ,[is_inside])
     VALUES
           ('FDB35151-C160-42D0-8DDF-F783393ADD2E'
            ,'CAAE3651-752C-4701-A28B-EC4276D1F21B'
            ,1)
Go
