USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_Image_GetByID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Image_GetByID] 
	@ID VARCHAR(24) 
AS
BEGIN 
	SELECT [ID], [Data] 
	FROM [dbo].[Product_Image] 
	WHERE [ID] = @ID 
END 
GO
