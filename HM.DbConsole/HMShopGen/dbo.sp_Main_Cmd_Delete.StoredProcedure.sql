USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Cmd_Delete]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_Delete]
	@ID VARCHAR(24)
AS 
BEGIN 
	DELETE [dbo].[Main_Cmd] 
	WHERE ID = @ID
END 
GO
