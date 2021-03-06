USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_User_Cmd_GetGroupByUserID]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Cmd_GetGroupByUserID]
	@User_ID VARCHAR(24)
AS 
BEGIN 
	SELECT ID FROM [dbo].[Main_User_Cmd] WHERE [User_ID] = @User_ID	
	UNION
	SELECT GC.ID 
	FROM [dbo].[Main_Group_Cmd] GC
	INNER JOIN [dbo].[Main_Group] G ON G.ID = GC.Group_ID
	INNER JOIN [dbo].[Main_Group_User] GU ON GU.Group_ID = GC.Group_ID
	WHERE GU.[User_ID] = @User_ID
END 
GO
