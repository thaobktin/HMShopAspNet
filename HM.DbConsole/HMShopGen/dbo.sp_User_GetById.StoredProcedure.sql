USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetById]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_GetById]
	@ID VARCHAR(24) 
AS 
BEGIN 
	SELECT [ID], [Full_Name], [Login_Name], [Email], [Password], [Type_Social], [AppId], [Address], [Phone] 
	FROM [dbo].[User] 
	WHERE ID = @ID
END 
GO
