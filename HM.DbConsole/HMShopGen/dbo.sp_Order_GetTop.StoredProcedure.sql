USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_GetTop]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_GetTop]
	@topNumber INT 
AS
BEGIN
	SELECT TOP(@topNumber) [ID] 
	FROM [dbo].[Order] 
	ORDER BY [ID] DESC
END
GO
