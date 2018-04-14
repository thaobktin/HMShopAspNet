USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Setting_GetValue]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------
CREATE PROCEDURE [dbo].[sp_Main_Setting_GetValue]
	@Name  NVARCHAR(100)
AS 
BEGIN 
	SELECT [Value] 
	FROM [dbo].[Main_Setting] 
	WHERE [Name] = @Name 
END 
GO
