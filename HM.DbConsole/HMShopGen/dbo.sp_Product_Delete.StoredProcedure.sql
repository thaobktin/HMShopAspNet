USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_Delete]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Delete] 
	@ID VARCHAR(24) 
AS 
BEGIN 
	DELETE FROM [dbo].[Product]
	WHERE [ID] = @ID
END 
GO
