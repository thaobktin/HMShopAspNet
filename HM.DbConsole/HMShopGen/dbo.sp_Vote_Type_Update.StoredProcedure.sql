USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vote_Type_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_Type_Update](
	@ID VARCHAR(24),
	@Name NVARCHAR(128) 
)
AS 
BEGIN 
	UPDATE [dbo].[Vote_Type] SET 
		[Name] = @Name 
	WHERE [ID] = @ID 
END 
GO
