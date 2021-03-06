USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vote_GetByContentID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_GetByContentID] 
	@Content_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [Vote_Type_ID], COUNT([Vote_Type_ID]) AS [Number_Vote]
	FROM [dbo].[Vote] 
	WHERE [Content_ID] = @Content_ID 
	GROUP BY [Vote_Type_ID] 
END 
GO
