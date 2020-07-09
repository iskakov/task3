USE [Task3]
GO

INSERT INTO [dbo].[TypePipeline]
           ([primarykey]
           ,[name])
     VALUES
           (NEWID()
           ,'Надземная')
GO
INSERT INTO [dbo].[TypePipeline]
           ([primarykey]
           ,[name])
     VALUES
           (NEWID()
           ,'Подземная')
GO
INSERT INTO [dbo].[TypePipeline]
           ([primarykey]
           ,[name])
     VALUES
           (NEWID()
           ,'По подвалу')
GO
