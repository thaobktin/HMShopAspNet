USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vote_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_Update](
	@ID VARCHAR(24),
	@User_ID VARCHAR(24),
	@Content_ID VARCHAR(24),
	@Vote_Type_ID VARCHAR(24)
)
AS 
BEGIN 
	UPDATE [dbo].[Vote] SET 
		[User_ID] = @User_ID, 
		[Content_ID] = @Content_ID,
		[Vote_Type_ID] = @Vote_Type_ID 
	WHERE [ID] = @ID 
END 
GO
