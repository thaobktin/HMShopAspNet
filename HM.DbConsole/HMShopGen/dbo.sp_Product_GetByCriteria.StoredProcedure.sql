USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_GetByCriteria]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_GetByCriteria]
	@Criteria NVARCHAR(255)
AS
BEGIN
	SELECT
		P.[ID]
		,P.[Name] AS [Product_Name]
		,C.[Name] AS [Category_Name]
		,P.[Product_Image_ID]
		,SUBSTRING(P.[Description], 1, 150) + '...' AS [Description]
		,[Cost] 
		,[Price] 
		,[Continued] 
	FROM [dbo].[Product] P
	INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID]
	WHERE C.[Name] LIKE '%' + @criteria + '%' 
	   OR P.[Name] LIKE '%' + @criteria + '%' 
	   OR P.[Description] LIKE '%' + @criteria + '%'
END
GO
