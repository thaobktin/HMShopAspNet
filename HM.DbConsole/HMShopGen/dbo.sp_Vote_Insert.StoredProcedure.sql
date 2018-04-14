USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Vote_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_Insert](
	@ID VARCHAR(24),
	@User_ID VARCHAR(24),
	@Content_ID VARCHAR(24),
	@Vote_Type_ID VARCHAR(24)
)
AS 
BEGIN 
	INSERT INTO [dbo].[Vote] ([ID], [User_ID], [Content_ID], [Vote_Type_ID])
	VALUES  (@ID, @User_ID, @Content_ID, @Vote_Type_ID) 

	RETURN SCOPE_IDENTITY() 
END 
GO
