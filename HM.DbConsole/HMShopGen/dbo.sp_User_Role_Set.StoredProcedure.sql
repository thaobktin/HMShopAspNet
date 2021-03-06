USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Role_Set]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Role_Set]
	@ID			VARCHAR(24),
	@User_ID	VARCHAR(24),
	@Role_ID	VARCHAR(24)
AS 
BEGIN 
	IF EXISTS (SELECT [ID] FROM [dbo].[User_Role] WHERE [User_ID] = @User_ID) 
		UPDATE [dbo].[User_Role] SET 
			[Role_ID] = @Role_ID
		WHERE [User_ID] = @User_ID 
	ELSE 
		INSERT INTO [dbo].[User_Role] ([ID], [User_ID], [Role_ID])
		VALUES(@ID, @User_ID, @Role_ID) 
END 
GO
