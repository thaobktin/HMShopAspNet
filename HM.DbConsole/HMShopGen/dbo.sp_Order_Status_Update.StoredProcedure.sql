USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_Status_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_Status_Update](
	@ID VARCHAR(24), 
	@Name NVARCHAR(50) 
)
AS
BEGIN 
	UPDATE [dbo].[Order_Status] SET 
		[ID] = @ID, 
		[Name] = @Name 
END 
GO
