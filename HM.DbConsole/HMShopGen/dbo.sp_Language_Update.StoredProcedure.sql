USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Language_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Language_Update](
	@ID VARCHAR(24),
	@Key VARCHAR (50),
	@Name NVARCHAR (100)
)
AS 
BEGIN 
	UPDATE [dbo].[Language] SET
		[Key] = @Key 
		,[Name] = @Name
	WHERE ID = @ID
END 
GO
