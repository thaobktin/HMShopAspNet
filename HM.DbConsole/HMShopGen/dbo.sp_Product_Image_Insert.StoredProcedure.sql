USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_Image_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Image_Insert](
	@ID VARCHAR(24), 
	@Data IMAGE 
) 
AS 
BEGIN 
	INSERT INTO [dbo].[Product_Image] ([ID], [Data]) 
	VALUES (@ID, @Data) 

	RETURN SCOPE_IDENTITY() 
END 
GO
