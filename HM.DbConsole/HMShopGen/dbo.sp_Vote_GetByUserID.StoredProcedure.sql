USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vote_GetByUserID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_GetByUserID]
	@User_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [User_ID], [Content_ID], [Vote_Type_ID] 
	FROM [dbo].[Vote] 
	WHERE [User_ID] = @User_ID 
END 
GO
