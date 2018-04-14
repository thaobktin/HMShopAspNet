USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_Detail_GetByOrderIDUserIDDealID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_Detail_GetByOrderIDUserIDDealID](
	@Order_ID VARCHAR(24), 
	@Deal_ID NVARCHAR(50), 
	@User_ID VARCHAR(24) 
)
AS 
BEGIN 
	SELECT P.[ID], P.[Name], OD.[Amount], P.[Price] 
	FROM [dbo].[Order] O 
	INNER JOIN [dbo].[User] U ON O.[User_ID] = U.[ID]
	INNER JOIN [dbo].[Order_Detail] OD ON O.[ID] = OD.[Order_ID]
	INNER JOIN [dbo].[Product] P ON P.[ID] = OD.[Product_ID] 
	WHERE OD.[ID] = @Order_ID 
	  AND O.[Deal_ID] = @Deal_ID 
	  AND U.[ID] = @User_ID
	ORDER BY P.[ID] DESC, P.[Name] DESC 
END 
GO
