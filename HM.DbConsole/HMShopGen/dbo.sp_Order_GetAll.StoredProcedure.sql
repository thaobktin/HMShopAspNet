USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_GetAll]
AS
BEGIN
	SELECT
		O.[ID]
		,U.[Full_Name]
		,U.[Address]
		,U.[Email]
		,U.[Phone]
		,CONVERT(VARCHAR, O.[Created_Date], 103) AS [Created_Date]
		,OS.[OrderStatus_Name] AS [Order_Status]
		,O.[Deal_ID]
		,U.[User_Name] 
	FROM [dbo].[Order] O 
	INNER JOIN [dbo].[OrderStatus] OS ON O.OrderStatus_ID = OS.OrderStatus_ID
	INNER JOIN [dbo].[User] U ON U.[ID] = O.[User_ID]
	ORDER BY O.[Created_Date] DESC, O.[ID] DESC
END
GO
