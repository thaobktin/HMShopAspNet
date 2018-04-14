/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_GetAll0]
GO
-----------------
/* Paging by OFFSET/FETCH */
CREATE PROCEDURE [dbo].[sp_Product_GetAll0] 
	@PageNumber INT,
	@PageSize  INT
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
	OFFSET ((@PageNumber - 1) * @PageSize) ROWS FETCH NEXT @PageSize ROWS ONLY
END 
GO 
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_GetAll1]
GO
-----------------
/* Paging by CTE */
CREATE PROCEDURE [dbo].[sp_Product_GetAll1] 
	@PageNumber INT,
	@PageSize  INT 
AS 
BEGIN 
	SET NOCOUNT ON;
	
	WITH PagingCTE AS 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY P.[ID]) AS RowNumber 
			,P.[ID] 
			,P.[Name] 
			,S.[Name] AS [Supplier_Name]
			,C.[Name] AS [Category_Name] 
			,P.[Product_Image_ID] 
			,I.[Data] AS [Product_Image_Data]
			,SUBSTRING(P.[Description], 1, 150) + '...' AS [Description] 
			,[Cost] 
			,[Price] 
			,[Continued]  
		FROM [dbo].[Product] P WITH (NOLOCK)
		INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID] 
		INNER JOIN [dbo].[Product_Image] I ON P.[Product_Image_ID] = I.[ID] 
		INNER JOIN [dbo].[Supplier] S ON P.[Supplier_ID] = S.[ID] 
	)
	
	SELECT * FROM PagingCTE 
	WHERE RowNumber BETWEEN (@PageNumber - 1) * @PageSize + 1 
	  AND @PageNumber * @PageSize 
END 
GO 
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_GetAll2]
GO
-----------------
/* Paging by CTE */
CREATE PROCEDURE [dbo].[sp_Product_GetAll2] 
	@PageNumber INT,
	@PageSize  INT, 
	@SortColumnName VARCHAR(50)
AS 
BEGIN 
	SET NOCOUNT ON;
	
	WITH PagingCTE AS 
	(
		SELECT 
			ROW_NUMBER() OVER 
			(
				ORDER BY CASE
					WHEN @SortColumnName = 'Product_Name' THEN  Product_Name 
					WHEN @SortColumnName = 'Category_Name' THEN  Category_Name 
                END
			) AS RowNumber 
			,P.[ID] 
			,P.[Name] AS [Product_Name]
			,S.[Name] AS [Supplier_Name]
			,C.[Name] AS [Category_Name] 
			,P.[Product_Image_ID] 
			,I.[Data] AS [Product_Image_Data]
			,SUBSTRING(P.[Description], 1, 150) + '...' AS [Description] 
			,[Cost] 
			,[Price] 
			,[Continued]  
		FROM [dbo].[Product] P WITH (NOLOCK)
		INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID] 
		INNER JOIN [dbo].[Product_Image] I ON P.[Product_Image_ID] = I.[ID] 
		INNER JOIN [dbo].[Supplier] S ON P.[Supplier_ID] = S.[ID] 
	)
	
	SELECT * FROM PagingCTE 
	WHERE RowNumber BETWEEN (@PageNumber - 1) * @PageSize + 1 
	  AND @PageNumber * @PageSize 
END 
GO 
/*----------------------------------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS [dbo].[sp_Product_GetAll3]
GO
-----------------
/* With SQL Old version (2008 OR Older) */
CREATE PROCEDURE [dbo].[sp_Product_GetAll3] 
	@PageNumber INT,
	@RowsPerPage INT,
	@TotalRows INT OUTPUT
AS 
BEGIN 
	SET NOCOUNT ON;
	
	/* Get total rows */
	SELECT @TotalRows = COUNT(*) FROM [dbo].[Product]
	INNER JOIN [dbo].[Category] C ON C.[ID] = P.[Category_ID] 
	INNER JOIN [dbo].[Product_Image] I ON P.[Product_Image_ID] = I.[ID] 
	INNER JOIN [dbo].[Supplier] S ON P.[Supplier_ID] = S.[ID] 

	SELECT * FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY P.[ID]) RowNumber 
			,P.[ID] 
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
	) AS tbl
    WHERE RowNumber BETWEEN ((@PageNumber - 1) * @RowsPerPage + 1) AND (@PageNumber * @RowsPerPage)
END 
GO 