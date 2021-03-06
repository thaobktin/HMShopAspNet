USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_Detail_GetByID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_Detail_GetByID]
	@Order_ID VARCHAR(24) 
AS 
BEGIN 
	SELECT P.[ID], P.[Name], OD.[Amount], P.[Price] 
	FROM [dbo].[Order_Detail] OD
	INNER JOIN [dbo].[Product] P ON P.[ID] = OD.[Product_ID] 
	WHERE OD.Order_ID = @Order_ID 
	ORDER BY P.[ID] DESC, P.[Name] DESC 
END 
GO
