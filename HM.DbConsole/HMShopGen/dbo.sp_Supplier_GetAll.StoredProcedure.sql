USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Supplier_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Supplier_GetAll]
AS
BEGIN
	SELECT [ID], [Name], [Address], [Phone], [Fax], [Website] 
	FROM [dbo].[Supplier] 
END
GO
