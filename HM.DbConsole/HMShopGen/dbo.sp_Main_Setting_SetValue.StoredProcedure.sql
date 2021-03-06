USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Setting_SetValue]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------
CREATE PROCEDURE [dbo].[sp_Main_Setting_SetValue](
	@Name	NVARCHAR(200),
	@Value	NVARCHAR(4000)
)
AS 
BEGIN 
	DECLARE @isExist INT 
	SELECT @isExist = COUNT(1) 
	FROM [dbo].[Main_Setting] WHERE [Name] = @Name 

	IF (@isExist = 0) 
		INSERT INTO [dbo].[Main_Setting]([Name], [Value]) 
		VALUES(@Name, @Value) 
	ELSE 
		UPDATE [dbo].[Main_Setting] SET 
			[Value] = @Value 
		WHERE [Name] = @Name 
END 
GO
