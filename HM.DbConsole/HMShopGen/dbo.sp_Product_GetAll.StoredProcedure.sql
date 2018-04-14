USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_GetAll] 
AS 
BEGIN 
	SELECT 
		P.[ID] 
		,P.[Name] 
		,S.[Name] AS [Supplier_Name]
		,C.[Name] AS [Category_Name] 
		,P.[Product_Image_ID] 
		,I.[Data] AS [Product_Image_Data]
		,SUBSTRING(P.[Description], 1, 150) + '...' AS [Description] 
		,[Cost] 
		,[Price] 
		,[Continued]  
	FROM [dbo].[Product] P 
	INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID] 
	INNER JOIN [dbo].[Product_Image] I ON P.[Product_Image_ID] = I.[ID] 
	INNER JOIN [dbo].[Supplier] S ON P.[Supplier_ID] = S.[ID] 
	ORDER BY [ID] DESC 
END 
GO
