USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_User_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_GetAll]
AS 
BEGIN 
	SELECT 
		[ID], [Email], [Email_Confirmed], [Full_Name], [Login_Name], [Password],
		[Gender], [Birthday], [Address], [Phone], [Super_Admin], [Avatar] 
	FROM [dbo].[Main_User] 
END 
GO
