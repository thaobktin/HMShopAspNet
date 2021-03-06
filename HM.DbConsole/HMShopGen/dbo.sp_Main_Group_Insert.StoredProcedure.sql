USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Group_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Insert](
	@ID VARCHAR(24),
	@Name NVARCHAR(50),
	@Description NVARCHAR(255)
)
AS 
BEGIN 
	INSERT INTO [dbo].[Main_Group] ([ID], [Name], [Description])
	VALUES (@ID, @Name, @Description) 

	RETURN SCOPE_IDENTITY() 
END 
GO
