USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Role_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Role_Insert](
	@ID VARCHAR(24), 
	@Name VARCHAR(50) 
)
AS
BEGIN
	INSERT INTO [dbo].[Role] ([ID], [Name])
	VALUES (@ID, @Name)

	RETURN SCOPE_IDENTITY()
END
GO
