USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Group_Cmd_Delete]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Cmd_Delete]
	@Group_ID VARCHAR(24),
	@Cmd_ID VARCHAR(24)
AS 
BEGIN 
	DELETE FROM [dbo].[Main_Group_Cmd] 
	WHERE [Group_ID] = @Group_ID 
	  AND Cmd_ID = @Cmd_ID 
END 
GO
