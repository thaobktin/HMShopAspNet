USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Language_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------
CREATE PROCEDURE [dbo].[sp_Language_Insert](
	@ID VARCHAR(24),
	@Key VARCHAR(50),
	@Name NVARCHAR(100)
)
AS
BEGIN
	INSERT INTO [dbo].[Language] ([ID], [Key], [Name])
	VALUES (@ID, @Key, @Name)

	RETURN SCOPE_IDENTITY() 
END
GO
