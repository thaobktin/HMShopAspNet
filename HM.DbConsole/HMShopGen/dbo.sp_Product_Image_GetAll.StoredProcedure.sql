USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_Image_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Image_GetAll] 
AS
BEGIN 
	SELECT [ID], [Data] 
	FROM [dbo].[Product_Image] 
END 
GO
