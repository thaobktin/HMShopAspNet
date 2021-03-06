USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Group_User_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_User_Insert](
	@ID VARCHAR(24),
	@Group_ID VARCHAR(24),
	@User_ID VARCHAR(24)
)
AS 
BEGIN 
	
	
	IF NOT EXISTS (SELECT [ID] FROM [dbo].[Main_Group_User] WHERE [Group_ID] = @Group_ID AND [User_ID] = @User_ID)
		INSERT INTO [dbo].[Main_Group_User] ([ID], [Group_ID], [User_ID]) 
		VALUES(@ID, @Group_ID, @User_ID) 
END 
GO
