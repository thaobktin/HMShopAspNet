USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Product_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Update](
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
	UPDATE [dbo].[Product] SET 
		[Category_ID] = @Category_ID 
		,[Supplier_ID] = @Supplier_ID 
		,[Product_Image_ID] = @Product_Image_ID 
		,[Name] = @Name 
		,[Description] = @Description 
		,[Cost] = @Cost 
		,[Price] = @Price 
		,[Continued] = @Continued 
	WHERE [ID] = @ID 
END 
GO
