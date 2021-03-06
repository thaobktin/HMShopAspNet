USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetByUserName]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_GetByUserName]
	@User_Name NVARCHAR(50)
AS
BEGIN
	SELECT [ID], [Full_Name], [User_Name], [Email], [Password], [Type_Social], [AppId], [Address], [Phone] 
	FROM [dbo].[User] 
	WHERE [User_Name] = @User_Name 
END
GO
