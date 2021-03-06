USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_Detail_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_Detail_Insert](
	@ID VARCHAR(24) 
	,@Order_ID VARCHAR(24) 
	,@Product_ID VARCHAR(24)  
	,@Amount INT 
)
AS
BEGIN
	INSERT INTO [dbo].[Order_Detail] ([ID], [Order_ID], [Product_ID], [Amount])
	VALUES (@ID, @Order_ID, @Product_ID, @Amount)

	RETURN SCOPE_IDENTITY() 
END 
GO
