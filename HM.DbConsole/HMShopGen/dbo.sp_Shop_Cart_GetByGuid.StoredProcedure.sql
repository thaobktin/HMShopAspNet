USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Shop_Cart_GetByGuid]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Shop_Cart_GetByGuid]
	@Guid NVARCHAR(50)
AS
BEGIN
	SELECT
		SC.[ID]
		,P.[ID] AS [Product_ID]
		,P.[Name] AS [Product_Name]
		,SC.[Amount]
		,P.[Price] 
		,(P.[Price] * SC.[Amount]) AS [Sum_Price]
	FROM [dbo].[Shop_Cart] SC
	INNER JOIN [dbo].[Product] P ON P.[ID] = SC.[Product_ID]
	WHERE [Guid] = @Guid 
END
GO
