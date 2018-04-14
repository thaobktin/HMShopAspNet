USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_GetTop]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_GetTop](
	@topNumber INT 
)
AS
BEGIN
	SELECT Top(@topNumber)
		P.[ID]
		,P.[Name] 
		,C.[Name] AS [Category_Name]
		,Product_Image_ID
		,SUBSTRING(P.[Description], 1, 150) + '...' AS [Description]
		,[Cost] 
		,[Price] 
		,[Continued] 
	FROM [dbo].[Product] P
	INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID]
	ORDER BY P.[ID] DESC
END
GO
