USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Insert](
	@ID VARCHAR(24) 
	,@Category_ID VARCHAR(24)  
	,@Supplier_ID VARCHAR(24) 
	,@Product_Image_ID VARCHAR(24) 
	,@Name NVARCHAR(250) 
	,@Description NVARCHAR(MAX) 
	,@Cost INT 
	,@Price INT 
	,@Continued BIT 
)
AS
BEGIN
	INSERT INTO [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Price], [Cost], [Continued]) 
	VALUES (@ID, @Category_ID, @Supplier_ID, @Product_Image_ID, @Name, @Description, @Price, @Cost, @Continued) 

	RETURN SCOPE_IDENTITY()
END 
GO
