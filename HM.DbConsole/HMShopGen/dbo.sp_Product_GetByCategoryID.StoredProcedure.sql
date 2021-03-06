USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_GetByCategoryID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_GetByCategoryID] 
	@Category_ID INT
AS
BEGIN 
	SELECT 
		[ID]
		,[Product_Image_ID]
		,SUBSTRING([Description], 1, 25) + '...' AS [Description] 
		,[Name]	
		,[Cost] 
		,[Price] 
		,[Continued] 
	FROM [dbo].[Product]
	WHERE Category_ID = @Category_ID
END
GO
