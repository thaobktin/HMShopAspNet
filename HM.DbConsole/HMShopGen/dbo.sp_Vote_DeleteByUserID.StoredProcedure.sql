USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vote_DeleteByUserID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_DeleteByUserID]
	@User_ID VARCHAR(24)
AS 
BEGIN 
	DELETE FROM [dbo].[Vote]  
	WHERE [User_ID] = @User_ID
END 
GO
