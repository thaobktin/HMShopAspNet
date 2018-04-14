USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Cmd_CountChild]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_CountChild]
	@Parent_ID VARCHAR(24)
AS 
BEGIN 
	SELECT COUNT(1) 
	FROM [dbo].[Main_Cmd] 
	WHERE [Parent_ID] = @Parent_ID
END 
GO
