USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_Insert]
	@ID VARCHAR(24) 
	,@User_ID VARCHAR(24) 
	,@Order_Status NVARCHAR(50) 
	,@Deal_ID NVARCHAR(50)
	,@Tracking_Number NVARCHAR(50) 
AS
BEGIN
	INSERT INTO [dbo].[Order]([ID], [User_ID], [Order_Status], [Deal_ID], [Created_Date], [Process_Date], [Tracking_Number])
	VALUES (@ID, @Order_Status, @User_ID, @Deal_ID, GETDATE(), null, @Tracking_Number)

	RETURN SCOPE_IDENTITY()
END
GO
