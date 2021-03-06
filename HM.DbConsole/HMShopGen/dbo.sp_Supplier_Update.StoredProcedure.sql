USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Supplier_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Supplier_Update](
	@ID			VARCHAR(24) 
	,@Name		NVARCHAR(125) 
	,@Address	NVARCHAR(255) 
	,@Phone		NVARCHAR(24) 
	,@Fax		NVARCHAR(24) 
	,@Website	NVARCHAR(250)
)
AS
BEGIN
	UPDATE [dbo].[Supplier] SET 
		[Name] = @Name
		,[Address] = @Address
		,[Phone] = @Phone
		,[Fax] = @Fax
		,[Website] = @Website
	WHERE [ID] = @ID
END
GO
