USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_GetById]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------
CREATE PROCEDURE [dbo].[sp_Category_GetById] (
	@ID VARCHAR(24)
)
AS 
BEGIN 
	SELECT
		[ID] 
		,[Name] 
		,[Description] 
		,[Picture] 
		,[Enable] 
	FROM [dbo].[Category] 
	WHERE ID = @ID
END 
GO
