USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_User_Cmd_CheckRole]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Cmd_CheckRole]
	@User_ID VARCHAR(24),
	@Cmd_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [Cmd_ID] 
	FROM [dbo].[Main_User_Cmd] 
	WHERE [User_ID] = @User_ID 
	  AND [Cmd_ID] = @Cmd_ID 
	UNION 
	SELECT GC.[Cmd_ID] 
	FROM [dbo].[Main_Group_Cmd] GC
	INNER JOIN [dbo].[Main_Group] G ON G.[ID] = GC.[Group_ID]
	INNER JOIN [dbo].[Main_Group_User] GU ON GU.[Group_ID] = G.[ID]
	WHERE GU.[User_ID] = @User_ID 
	  AND GC.[Cmd_ID] = @Cmd_ID

	RETURN @@ROWCOUNT 
END 
GO
