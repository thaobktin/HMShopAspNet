USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Insert]( 
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
	IF EXISTS (SELECT [ID] FROM [dbo].[User] WHERE [Email] = @Email)
		RETURN -1
	ELSE IF EXISTS (SELECT [ID] FROM [dbo].[User] WHERE [Login_Name] = @Login_Name)
		RETURN -2
	ELSE
	BEGIN
		INSERT INTO [dbo].[User] ([ID], [Full_Name], [Login_Name], [Email], [Password], [Type_Social], [AppID], [Address], [Phone])
		VALUES (@ID, @Full_Name, @Login_Name, @Email, @Password, @Type_Social, @AppID, @Address, @Phone)
		
		RETURN SCOPE_IDENTITY() 
	END 
END 
GO
