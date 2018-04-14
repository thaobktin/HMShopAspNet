USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Role_CheckRole]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Role_CheckRole]
	@User_ID	VARCHAR(24),
	@Role_ID	VARCHAR(24)
AS 
BEGIN 
	IF EXISTS (SELECT [ID] FROM [dbo].[User_Role] WHERE [User_ID] = @User_ID AND [Role_ID] = @Role_ID)
		RETURN 1 
	ELSE 
		RETURN 0 
END 
GO
