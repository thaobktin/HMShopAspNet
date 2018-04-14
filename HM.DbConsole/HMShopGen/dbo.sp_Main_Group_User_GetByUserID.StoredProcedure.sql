USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Group_User_GetByUserID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_User_GetByUserID]
	@User_ID VARCHAR(24) 
AS 
BEGIN 
	SELECT [ID], [Group_ID], [User_ID]  
	FROM [dbo].[Main_Group_User]  
	WHERE [User_ID] = @User_ID 
END 
GO
