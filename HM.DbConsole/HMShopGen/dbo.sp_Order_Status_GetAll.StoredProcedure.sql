USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_Status_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_Status_GetAll] 
AS
BEGIN 
	SELECT 
		OrderStatus_ID
		,OrderStatus_Name
	FROM OrderStatus
END 
GO
