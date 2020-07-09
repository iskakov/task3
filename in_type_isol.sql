USE [Task3]
GO

INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           (NEWID()
           ,'ППУ')
GO
INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           (NEWID()
           ,'ППМ')
GO
INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           (NEWID()
           ,'АПБ')
GO
INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           (NEWID()
           ,'Изоляция из пенополиэтилена')
GO
INSERT INTO [dbo].[TypeIsolation]
           ([primarykey]
           ,[name])
     VALUES
           (NEWID()
           ,'ВУС')
GO


