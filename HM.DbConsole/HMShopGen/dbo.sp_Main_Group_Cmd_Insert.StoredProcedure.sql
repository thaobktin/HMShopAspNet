USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Group_Cmd_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Cmd_Insert]
	@ID VARCHAR(24),
	@Group_ID VARCHAR(24),
	@Cmd_ID VARCHAR(24)
AS 
BEGIN 
	SELECT 1 FROM [dbo].[Main_Group_Cmd] 
	WHERE Group_ID = @Group_ID 
	  AND Cmd_ID = @Cmd_ID	
	
	IF @@RowCount = 0
		INSERT INTO [dbo].[Main_Group_Cmd] ([ID], [Group_ID], [Cmd_ID]) 
		VALUES (@ID, @Group_ID, @Cmd_ID) 
END 
GO
