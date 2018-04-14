USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetByAppId]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_GetByAppId] 
(
	@AppID NVARCHAR(128), 
	@Type_Social TINYINT
)
AS 
BEGIN 
	SELECT [ID], [Full_Name], [Login_Name], [Email], [Password], [Type_Social], [AppId], [Address], [Phone] 
	FROM [dbo].[User]  
	WHERE ([AppID] = @AppID AND [Type_Social] = @Type_Social) 
	   OR ([AppID] = @AppID AND [Type_Social] = 0)
END 
GO
