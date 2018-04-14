USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Role_GetById]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Role_GetById]
	@ID VARCHAR(24) 
AS
BEGIN
	SELECT [ID], [Name]
	FROM [dbo].[Role] 
	WHERE [ID] = @ID
END
GO
