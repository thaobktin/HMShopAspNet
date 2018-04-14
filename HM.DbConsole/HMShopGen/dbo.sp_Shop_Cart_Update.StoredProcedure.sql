USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Shop_Cart_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Shop_Cart_Update]
	@ID VARCHAR(24) 
	,@Amount INT
AS
BEGIN
	UPDATE [dbo].[Shop_Cart] SET 
		[Amount] = @Amount
	WHERE [ID] = @ID
END
GO
