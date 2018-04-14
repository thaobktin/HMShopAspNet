/*=====================================================================================================*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_Insert]
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
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_Update]
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
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_Delete]
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Delete] 
	@ID VARCHAR(24) 
AS 
BEGIN 
	DELETE FROM [dbo].[Product]
	WHERE [ID] = @ID
END 
GO 
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_GetByID]
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_GetByID]
	@ID VARCHAR(24) 
AS
BEGIN
	SELECT 
		P.[ID] 
		,S.[Name] AS [Supplier_Name]
		,C.[Name] AS [Category_Name] 
		,[Product_Image_ID] 
		,P.[Name] 
		,P.[Description] 
		,P.[Cost] 
		,P.[Price] 
		,P.[Continued] 
	FROM [dbo].[Product] P
	INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID] 
	INNER JOIN [dbo].[Supplier] S ON S.[ID] = P.[Supplier_ID] 
	WHERE P.[ID] = @ID
END
GO 
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_GetAll]
GO
-----------------
/* Paging by OFFSET/FETCH */
CREATE PROCEDURE [dbo].[sp_Product_GetAll] 
AS 
BEGIN 
	SET NOCOUNT ON;
	
	SELECT 
		P.[ID] 
		,P.[Name] 
		,S.[Name] AS [Supplier_Name]
		,C.[Name] AS [Category_Name] 
		,P.[Product_Image_ID] 
		,I.[Data] AS [Product_Image_Data]
		,SUBSTRING(P.[Description], 1, 150) + '...' AS [Description] 
		,[Cost] 
		,[Price] 
		,[Continued]  
	FROM [dbo].[Product] P 
	INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID] 
	INNER JOIN [dbo].[Product_Image] I ON P.[Product_Image_ID] = I.[ID] 
	INNER JOIN [dbo].[Supplier] S ON P.[Supplier_ID] = S.[ID] 
	ORDER BY [ID] DESC 
END 
GO 
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_GetTop]
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_GetTop](
	@topNumber INT 
)
AS
BEGIN
	SELECT Top(@topNumber)
		P.[ID]
		,P.[Name] 
		,C.[Name] AS [Category_Name]
		,Product_Image_ID
		,SUBSTRING(P.[Description], 1, 150) + '...' AS [Description]
		,[Cost] 
		,[Price] 
		,[Continued] 
	FROM [dbo].[Product] P
	INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID]
	ORDER BY P.[ID] DESC
END
GO 
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_GetByCategoryID]
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_GetByCategoryID] 
	@Category_ID INT
AS
BEGIN 
	SELECT 
		[ID]
		,[Product_Image_ID]
		,SUBSTRING([Description], 1, 25) + '...' AS [Description] 
		,[Name]	
		,[Cost] 
		,[Price] 
		,[Continued] 
	FROM [dbo].[Product]
	WHERE Category_ID = @Category_ID
END
GO 
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_GetByCriteria]
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_GetByCriteria]
	@Criteria NVARCHAR(255)
AS
BEGIN
	SELECT
		P.[ID]
		,P.[Name] AS [Product_Name]
		,C.[Name] AS [Category_Name]
		,P.[Product_Image_ID]
		,SUBSTRING(P.[Description], 1, 150) + '...' AS [Description]
		,[Cost] 
		,[Price] 
		,[Continued] 
	FROM [dbo].[Product] P
	INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID]
	WHERE C.[Name] LIKE '%' + @criteria + '%' 
	   OR P.[Name] LIKE '%' + @criteria + '%' 
	   OR P.[Description] LIKE '%' + @criteria + '%'
END
GO 