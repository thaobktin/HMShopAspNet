USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_CountProductByCategoryID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------
CREATE PROCEDURE [dbo].[sp_Category_CountProductByCategoryID]
AS
BEGIN
	SELECT 
		C.[ID] 
		,C.[Name] 
		,COUNT(P.[Category_ID]) AS [Amount] 
	FROM [dbo].[Product] P
	INNER JOIN [dbo].[Category] C ON P.[Category_ID] = C.[ID] 
	GROUP BY C.[ID], C.[Name] 
END
GO
