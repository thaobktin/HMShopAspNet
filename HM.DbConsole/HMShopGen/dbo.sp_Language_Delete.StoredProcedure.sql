USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Language_Delete]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------
CREATE PROCEDURE [dbo].[sp_Language_Delete]
	@ID VARCHAR(24)
AS 
BEGIN 
	DELETE [dbo].[Language] 
	WHERE ID = @ID
END 
GO
