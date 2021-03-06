USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_GetByID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_GetByID]
	@ID VARCHAR(24)
	,@Deal_ID NVARCHAR(50)
AS
BEGIN
	SELECT 
		[Order_Status] 
		,CONVERT(VARCHAR, [Created_Date], 103) AS [Created_Date] 
		,CONVERT(VARCHAR, [Process_Date], 103) AS [Process_Date] 
		,[Tracking_Number] 
	FROM [dbo].[Order] 
	WHERE [ID] = @ID
	  AND [Deal_ID] = @Deal_ID
END 
GO
