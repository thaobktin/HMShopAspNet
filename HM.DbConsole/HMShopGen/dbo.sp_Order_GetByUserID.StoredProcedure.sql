USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_GetByUserID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_GetByUserID]
	@User_ID VARCHAR(24) 
AS
BEGIN
	SELECT
		[ID]
		,[User_ID]
		,[Deal_ID]
		,CONVERT(VARCHAR, [Created_Date], 103) AS [Created_Date]
		,[Status]
		,CONVERT(VARCHAR, [Process_Date], 103) AS [Process_Date]
		,[Tracking_Number]
	FROM [dbo].[Order]  
	WHERE [User_ID] = @User_ID
	ORDER BY [Created_Date] DESC
END
GO
