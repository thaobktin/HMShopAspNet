USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_User_GetByEmailPassword]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_GetByEmailPassword](
	@Email	VARCHAR(50),
	@Password	VARCHAR(500)
)
AS 
BEGIN 
	SELECT [ID] 
	FROM [dbo].[Main_User] 
	WHERE Email = @Email 
	  AND Password = @Password 
END 
GO
