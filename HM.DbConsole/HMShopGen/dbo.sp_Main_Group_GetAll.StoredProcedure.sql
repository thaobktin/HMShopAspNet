USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Group_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_GetAll]
AS 
BEGIN 
	SELECT [ID], [Name], [Description] 
	FROM [dbo].[Main_Group] 
END 
GO
