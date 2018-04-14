USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_UpdateStatus]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_UpdateStatus]
	@ID VARCHAR(24) 
	,@Order_Status NVARCHAR(50) 
	,@Tracking_Number NVARCHAR(50) 
AS
BEGIN
	UPDATE [dbo].[Order] SET 
		[Process_Date] = GETDATE()
		,[Order_Status] = @Order_Status
		,[Tracking_Number] = @Tracking_Number
	WHERE [ID] = @ID 
END
GO
