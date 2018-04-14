USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetUser]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_GetUser]
	@Login_Name NVARCHAR(80),
	@Password NVARCHAR(250)
AS
BEGIN
	SELECT 
		[ID]
		,[Full_Name] 
	FROM [dbo].[User] 
	WHERE [Login_Name] = @Login_Name 
	  AND [Password] = @Password 
	  /*AND [Type_User_ID] = 1*/
END
GO
