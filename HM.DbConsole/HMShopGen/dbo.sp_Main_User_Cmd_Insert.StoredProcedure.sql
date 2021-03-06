USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_User_Cmd_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Cmd_Insert]
	@ID VARCHAR(24),
	@User_ID VARCHAR(24),
	@Cmd_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [ID], [User_ID], [Cmd_ID] 
	FROM [dbo].[Main_User_Cmd] 
	WHERE [User_ID] = @User_ID 
	  AND [Cmd_ID] = @Cmd_ID	
	-------
	IF (@@RowCount = 0)
		INSERT INTO [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID])
		VALUES(@ID, @User_ID, @Cmd_ID)
END 
GO
