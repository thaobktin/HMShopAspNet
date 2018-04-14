USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Cmd_GetByParentID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_GetByParentID]
	@Parent_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible] 
	FROM [dbo].[Main_Cmd] 
	WHERE [Parent_ID] = @Parent_ID
	ORDER BY [Index] ASC 
END 
GO
