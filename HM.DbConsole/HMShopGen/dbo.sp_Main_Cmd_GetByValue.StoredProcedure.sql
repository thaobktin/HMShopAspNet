USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Cmd_GetByValue]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_GetByValue]
	@Value VARCHAR(50)
AS 
BEGIN 
	SELECT [ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible] 
	FROM [dbo].[Main_Cmd] 
	WHERE Value =  @Value 
END 
GO
