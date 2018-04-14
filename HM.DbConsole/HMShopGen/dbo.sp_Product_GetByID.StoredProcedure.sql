USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_GetByID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_GetByID]
	@ID VARCHAR(24) 
AS
BEGIN
	SELECT 
		P.[ID] 
		,S.[Name] AS [Supplier_Name]
		,C.[Name] AS [Category_Name] 
		,[Product_Image_ID] 
		,P.[Name] 
		,P.[Description] 
		,P.[Cost] 
		,P.[Price] 
		,P.[Continued] 
	FROM [dbo].[Product] P
	INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID] 
	INNER JOIN [dbo].[Supplier] S ON S.[ID] = P.[Supplier_ID] 
	WHERE P.[ID] = @ID
END
GO
