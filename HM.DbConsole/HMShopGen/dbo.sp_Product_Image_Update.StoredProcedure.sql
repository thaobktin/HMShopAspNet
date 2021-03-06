USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_Image_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Image_Update](
	@ID VARCHAR(24), 
	@Data IMAGE 
)
AS
BEGIN 
	UPDATE [dbo].[Product_Image] SET 
		[Data] = @Data 
	WHERE [ID] = @ID 
END 
GO
