USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_User_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Insert](
	@ID VARCHAR(24), 
	@Email VARCHAR(50), 
	@Email_Confirmed BIT, 
	@Full_Name NVARCHAR(50),
	@Login_Name VARCHAR(50),
	@Password VARCHAR(100),
	@Gender BIT,
	@Birthday VARCHAR(50),
	@Address NVARCHAR(100),
	@Phone VARCHAR(50),
	@Super_Admin BIT,
	@Avatar VARCHAR(200)
)
AS 
BEGIN 
	INSERT INTO [dbo].[Main_User] 
	(
		[ID], [Email], [Email_Confirmed], [Full_Name], [Login_Name], [Password],
		[Gender], [Birthday], [Address], [Phone], [Super_Admin], [Avatar]
	)
	VALUES 
	(
		@ID, @Email, @Email_Confirmed, @Full_Name, @Login_Name, @Password,
		@Gender, @Birthday, @Address, @Phone, @Super_Admin, @Avatar
	) 

	RETURN SCOPE_IDENTITY() 
END 
GO
