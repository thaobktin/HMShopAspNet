USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Language_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Language_GetAll]
AS 
BEGIN 
	SELECT  [ID], [Key], [Name] 
	FROM [dbo].[Language]
END 
GO
