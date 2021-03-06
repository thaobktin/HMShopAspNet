USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Shop_Cart_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Shop_Cart_Insert](
	@ID VARCHAR(24) 
	,@Guid NVARCHAR(50)
	,@Product_ID INT
	,@Amount INT 
)
AS
BEGIN 
	IF EXISTS (SELECT [Product_ID] FROM [dbo].[Shop_Cart] WHERE [Product_ID] = @Product_ID AND [Guid] = @Guid) /*cap nhat so luong*/
	BEGIN
		UPDATE [dbo].[Shop_Cart] SET 
			[Amount] = ([Amount] + @Amount)
		WHERE [Product_ID] = @Product_ID 
		  AND [Guid] = @Guid
	END
	ELSE /*chen khi chua co san pham */
	BEGIN
		INSERT INTO [dbo].[Shop_Cart]([ID], [Guid], [Product_ID], [Amount], [Created_Date])
		VALUES (@ID, @Guid, @Product_ID, @Amount, GETDATE())
	END /* END IF*/
END
GO
