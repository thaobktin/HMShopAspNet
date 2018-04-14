USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------
CREATE PROCEDURE [dbo].[sp_Category_GetAll]
AS
BEGIN
	SELECT 
		[ID]
		,UPPER([Name]) AS [Name]
		,[Description] 
		,[Picture] 
		,[Enable] 
	FROM  [dbo].[Category] 
END
GO
