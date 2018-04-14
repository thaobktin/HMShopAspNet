USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Active_User_Get]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------
CREATE PROCEDURE [dbo].[sp_Main_Active_User_Get](
	@ID VARCHAR(24)
	,@IP VARCHAR(50)
	,@Active_User INT OUTPUT
)
AS 
BEGIN 
	DELETE FROM [dbo].[Main_Active_User] 
	WHERE DATEDIFF(HOUR, Log_Time, GETDATE()) > 10
	-------
	SELECT 1 FROM [dbo].[Main_Active_User] WHERE IP = @IP
	--------
	IF (@@ROWCOUNT = 0)
	INSERT INTO [dbo].[Main_Active_User] ([ID], [IP], [Log_Time])
	VALUES(@ID, @IP, GETDATE())	
	--------
	SELECT @Active_User = COUNT(1) FROM [dbo].[Main_Active_User]
END 
GO
