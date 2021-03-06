USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Update](
	@ID	VARCHAR(24), 
	@Full_Name NVARCHAR(250), 
	@Login_Name VARCHAR(80), 
	@Email NVARCHAR(250), 
	@Password VARCHAR(250), 
	@Type_Social TINYINT, 
	@AppID NVARCHAR(128), 
	@Address NVARCHAR(250), 
	@Phone NVARCHAR(50) 
)
AS 
BEGIN 
	UPDATE [dbo].[User] SET
		[Full_Name] = @Full_Name,
		[Login_Name] = @Login_Name,
		[Email] = @Email,
		[Password] = @Password,
		[Type_Social] = @Type_Social,
		[AppID] = @AppID,
		[Address] = @Address,
		[Phone] = @Phone
	WHERE [ID] = @Id
END 
GO
