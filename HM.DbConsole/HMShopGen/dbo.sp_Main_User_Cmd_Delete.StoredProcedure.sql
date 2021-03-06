USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_User_Cmd_Delete]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Cmd_Delete]
	@Cmd_ID VARCHAR(24), 
	@User_ID VARCHAR(24) 
AS 
BEGIN 
	DELETE FROM [dbo].[Main_User_Cmd]  
	WHERE [Cmd_ID] = @Cmd_ID 
	  AND [User_ID] = @User_ID 
END 
GO
