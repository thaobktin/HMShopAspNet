USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Setting_DeleteByName]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------
CREATE PROCEDURE [dbo].[sp_Main_Setting_DeleteByName]
	@Name VARCHAR(100)
AS 
BEGIN 
	DELETE [dbo].[Main_Setting]  
	WHERE [Name] = @Name 
END 
GO
