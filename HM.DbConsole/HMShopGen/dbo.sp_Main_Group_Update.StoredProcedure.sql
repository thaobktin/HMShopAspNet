USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Group_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Update](
	@ID VARCHAR(24),
	@Name NVARCHAR(50),
	@Description NVARCHAR(255)
)
AS 
BEGIN 
	UPDATE [dbo].[Main_Group] SET
		[Name] = @Name,
		[Description] = @Description
	WHERE [ID] = @ID 
END 
GO
