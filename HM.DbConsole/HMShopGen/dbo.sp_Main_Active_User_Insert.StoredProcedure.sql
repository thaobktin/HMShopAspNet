USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Active_User_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------
CREATE PROCEDURE [dbo].[sp_Main_Active_User_Insert](
	@ID VARCHAR(24)
	,@IP VARCHAR(50)
	,@Log_Time DATETIME
)
AS 
BEGIN 
	DECLARE @Check_Exist INT
	SELECT @Check_Exist = COUNT(ID) 
	FROM [dbo].[Main_Active_User] WHERE [IP] = @IP

	IF (@Check_Exist > 0)
		UPDATE [dbo].[Main_Active_User] SET [Log_Time] = @Log_Time
		WHERE [IP] = @IP 
	ELSE 
		INSERT INTO [dbo].[Main_Active_User] ([ID], [IP], [Log_Time])
		VALUES (@ID, @IP, @Log_Time)
END 
GO
