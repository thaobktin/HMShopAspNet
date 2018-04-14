USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------
CREATE PROCEDURE [dbo].[sp_Category_Update](
	@ID VARCHAR(24),
	@Name NVARCHAR(125),
	@Description NVARCHAR(500),
	@Picture IMAGE,
	@Enable BIT
)
AS
BEGIN
	UPDATE [dbo].[Category] SET 
		[Name] = @Name, 
		[Description] = @Description, 
		[Picture] = @Picture, 
		[Enable] = @Enable 
	WHERE [ID] = @ID 
END
GO
