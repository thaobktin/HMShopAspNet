USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vote_GetAll]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_GetAll]
AS 
BEGIN 
	SELECT [User_ID], [Content_ID], [Vote_Type_ID] 
	FROM [dbo].[Vote] 
END 
GO
