USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Supplier_Delete]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------
CREATE PROCEDURE [dbo].[sp_Supplier_Delete] 
	@ID VARCHAR(24) 
AS 
BEGIN 
	DELETE FROM [dbo].[Supplier]
	WHERE [ID] = @ID 
END 
GO
