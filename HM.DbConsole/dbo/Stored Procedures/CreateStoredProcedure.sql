--USE [HMShopDB]
--GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Category_Insert] 
--GO
----------
CREATE PROCEDURE [dbo].[sp_Category_Insert](
	@ID VARCHAR(24),
	@Name NVARCHAR(125),
	@Description NVARCHAR(500),
	@Picture IMAGE,
	@Enable BIT
)
AS
BEGIN
	INSERT INTO [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable])
	VALUES (@ID, @Name, @Description, @Picture, @Enable)

	RETURN SCOPE_IDENTITY() 
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Category_Update]
--GO
---------
CREATE PROCEDURE [dbo].[sp_Category_Update](
	@ID VARCHAR(24),
	@Name NVARCHAR(125),
	@Description NVARCHAR(500),
	@Picture IMAGE,
	@Enable BIT
)
AS
BEGIN
	UPDATE [dbo].[Category] SET 
		[Name] = @Name, 
		[Description] = @Description, 
		[Picture] = @Picture, 
		[Enable] = @Enable 
	WHERE [ID] = @ID 
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Category_Delete]
--GO
-----------
CREATE PROCEDURE [dbo].[sp_Category_Delete](
	@ID VARCHAR(24)
)
AS 
BEGIN 
	DELETE FROM [dbo].[Category] 
	WHERE ID = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Category_GetById]
--GO
--------
CREATE PROCEDURE [dbo].[sp_Category_GetById] (
	@ID VARCHAR(24)
)
AS 
BEGIN 
	SELECT
		[ID] 
		,[Name] 
		,[Description] 
		,[Picture] 
		,[Enable] 
	FROM [dbo].[Category] 
	WHERE ID = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Category_GetAll]
GO
------------
CREATE PROCEDURE [dbo].[sp_Category_GetAll]
AS
BEGIN
	SELECT 
		[ID]
		,UPPER([Name]) AS [Name]
		,[Description] 
		,[Picture] 
		,[Enable] 
	FROM  [dbo].[Category] 
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Category_CountProductByCategoryID]
GO
----------
CREATE PROCEDURE [dbo].[sp_Category_CountProductByCategoryID]
AS
BEGIN
	SELECT 
		C.[ID] 
		,C.[Name] 
		,COUNT(P.[Category_ID]) AS [Amount] 
	FROM [dbo].[Product] P
	INNER JOIN [dbo].[Category] C ON P.[Category_ID] = C.[ID] 
	GROUP BY C.[ID], C.[Name] 
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Category_GetByEnable]
--GO
--------
CREATE PROCEDURE [dbo].[sp_Category_GetByEnable](
	@Enable BIT
)
AS 
BEGIN 
	SELECT 
		[ID] 
		,UPPER([Name]) AS [Name] 
		,[Description] 
		,[Picture] 
		,[Enable] 
	FROM  [dbo].[Category] 
	WHERE [Enable] = @Enable
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Language_Insert]
--GO
-----------
CREATE PROCEDURE [dbo].[sp_Language_Insert](
	@ID VARCHAR(24),
	@Key VARCHAR(50),
	@Name NVARCHAR(100)
)
AS
BEGIN
	INSERT INTO [dbo].[Language] ([ID], [Key], [Name])
	VALUES (@ID, @Key, @Name)

	RETURN SCOPE_IDENTITY() 
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Language_Update]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Language_Update](
	@ID VARCHAR(24),
	@Key VARCHAR (50),
	@Name NVARCHAR (100)
)
AS 
BEGIN 
	UPDATE [dbo].[Language] SET
		[Key] = @Key 
		,[Name] = @Name
	WHERE ID = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Language_Delete]
--GO
-----------
CREATE PROCEDURE [dbo].[sp_Language_Delete]
	@ID VARCHAR(24)
AS 
BEGIN 
	DELETE [dbo].[Language] 
	WHERE ID = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Language_GetById]
--GO
---------
CREATE PROCEDURE [dbo].[sp_Language_GetById](
	@ID VARCHAR(24)
)
AS 
BEGIN 
	SELECT [ID], [Key], [Name]
	FROM [dbo].[Language]
	WHERE ID = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Language_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Language_GetAll]
AS 
BEGIN 
	SELECT  [ID], [Key], [Name] 
	FROM [dbo].[Language]
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Active_User_Insert]
--GO
---------
CREATE PROCEDURE [dbo].[sp_Main_Active_User_Insert](
	@ID VARCHAR(24)
	,@IP VARCHAR(50)
	,@Log_Time DATETIME
)
AS 
BEGIN 
	DECLARE @Check_Exist INT
	SELECT @Check_Exist = COUNT(ID) 
	FROM [dbo].[Main_Active_User] WHERE [IP] = @IP

	IF (@Check_Exist > 0)
		UPDATE [dbo].[Main_Active_User] SET [Log_Time] = @Log_Time
		WHERE [IP] = @IP 
	ELSE 
		INSERT INTO [dbo].[Main_Active_User] ([ID], [IP], [Log_Time])
		VALUES (@ID, @IP, @Log_Time)
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Active_User_Get]
--GO
---------
CREATE PROCEDURE [dbo].[sp_Main_Active_User_Get](
	@ID VARCHAR(24)
	,@IP VARCHAR(50)
	,@Active_User INT OUTPUT
)
AS 
BEGIN 
	DELETE FROM [dbo].[Main_Active_User] 
	WHERE DATEDIFF(HOUR, Log_Time, GETDATE()) > 10
	-------
	SELECT 1 FROM [dbo].[Main_Active_User] WHERE IP = @IP
	--------
	IF (@@ROWCOUNT = 0)
	INSERT INTO [dbo].[Main_Active_User] ([ID], [IP], [Log_Time])
	VALUES(@ID, @IP, GETDATE())	
	--------
	SELECT @Active_User = COUNT(1) FROM [dbo].[Main_Active_User]
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Cmd_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_Insert](
	@ID VARCHAR(24),
	@Name NVARCHAR (100),
	@Value VARCHAR (50),
	@Parent_ID VARCHAR(24),
	@Url VARCHAR (50),
	@Path VARCHAR (200),
	@Enable BIT,
	@Visible BIT
)
AS 
BEGIN 
	DECLARE @Index INT
	SELECT @Index = MAX([Index]) + 1 
	FROM [dbo].[Main_Cmd] 
	WHERE Parent_ID = @Parent_ID
	------
	IF @Index IS NULL SET @Index = 0
	------
	INSERT INTO [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible])
	VALUES (@ID, @Name, @Value, @Parent_ID, @Index, @Url, @Path, @Enable, @Visible)

	RETURN SCOPE_IDENTITY() 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Cmd_Update]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_Update](
	@ID VARCHAR(24),
	@Name NVARCHAR (100),
	@Value VARCHAR (50),
	@Parent_ID INT,
	/*@Index INT,*/
	@Url VARCHAR (50),
	@Path VARCHAR (200),
	@Enable BIT,
	@Visible BIT
)
AS 
BEGIN 
	UPDATE [dbo].[Main_Cmd] SET
		[Name] = @Name,
		[Value] = @Value,
		[Parent_ID] = @Parent_ID,
		/*[Index] = @Index,*/
		[Url] = @Url,
		[Path] = @Path,
		[Enable] = @Enable,
		[Visible] = @Visible
	WHERE ID = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Cmd_SetIndex]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_SetIndex]
	@ID VARCHAR(24),
	@Index INT
AS 
BEGIN 
	UPDATE [dbo].[Main_Cmd] SET 
		[Index] = @Index 
	WHERE ID = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Cmd_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_Delete]
	@ID VARCHAR(24)
AS 
BEGIN 
	DELETE [dbo].[Main_Cmd] 
	WHERE ID = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Cmd_GetByID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_GetByID]
	@ID VARCHAR(24)
AS 
BEGIN 
	SELECT [ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible] 
	FROM [dbo].[Main_Cmd] 
	WHERE ID = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Cmd_GetByValue]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_GetByValue]
	@Value VARCHAR(50)
AS 
BEGIN 
	SELECT [ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible] 
	FROM [dbo].[Main_Cmd] 
	WHERE Value =  @Value 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Cmd_GetByParentID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_GetByParentID]
	@Parent_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible] 
	FROM [dbo].[Main_Cmd] 
	WHERE [Parent_ID] = @Parent_ID
	ORDER BY [Index] ASC 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Cmd_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_GetAll]
AS 
BEGIN 
	SELECT [ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible] 
	FROM [dbo].[Main_Cmd] 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Cmd_CountChild]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_CountChild]
	@Parent_ID VARCHAR(24)
AS 
BEGIN 
	SELECT COUNT(1) 
	FROM [dbo].[Main_Cmd] 
	WHERE [Parent_ID] = @Parent_ID
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_Insert]
--GO
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
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_Update]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Update](
	@ID VARCHAR(24),
	@Name NVARCHAR(50),
	@Description NVARCHAR(255)
)
AS 
BEGIN 
	UPDATE [dbo].[Main_Group] SET
		[Name] = @Name,
		[Description] = @Description
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Delete]
	@ID INT
AS 
BEGIN 
	DELETE [dbo].[Main_Group] 
	WHERE ID = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_GetByID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_GetByID]
	@ID VARCHAR(24)
AS 
BEGIN 
	SELECT [ID], [Name], [Description] 
	FROM [dbo].[Main_Group] 
	WHERE ID = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_GetAll]
AS 
BEGIN 
	SELECT [ID], [Name], [Description] 
	FROM [dbo].[Main_Group] 
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_Cmd_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Cmd_Insert]
	@ID VARCHAR(24),
	@Group_ID VARCHAR(24),
	@Cmd_ID VARCHAR(24)
AS 
BEGIN 
	SELECT 1 FROM [dbo].[Main_Group_Cmd] 
	WHERE Group_ID = @Group_ID 
	  AND Cmd_ID = @Cmd_ID	
	
	IF @@RowCount = 0
		INSERT INTO [dbo].[Main_Group_Cmd] ([ID], [Group_ID], [Cmd_ID]) 
		VALUES (@ID, @Group_ID, @Cmd_ID) 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_Cmd_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Cmd_Delete]
	@Group_ID VARCHAR(24),
	@Cmd_ID VARCHAR(24)
AS 
BEGIN 
	DELETE FROM [dbo].[Main_Group_Cmd] 
	WHERE [Group_ID] = @Group_ID 
	  AND Cmd_ID = @Cmd_ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_Cmd_GetByGroupID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Cmd_GetByGroupID]
	@Group_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [ID], [Group_ID], [Cmd_ID] 
	FROM [dbo].[Main_Group_Cmd] 
	WHERE Group_ID = @Group_ID 
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_User_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_User_Insert](
	@ID VARCHAR(24),
	@Group_ID VARCHAR(24),
	@User_ID VARCHAR(24)
)
AS 
BEGIN 
	IF NOT EXISTS (SELECT [ID] FROM [dbo].[Main_Group_User] WHERE [Group_ID] = @Group_ID AND [User_ID] = @User_ID)
		INSERT INTO [dbo].[Main_Group_User] ([ID], [Group_ID], [User_ID]) 
		VALUES(@ID, @Group_ID, @User_ID) 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_User_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_User_Delete](
	@Group_ID VARCHAR(24), 
	@User_ID VARCHAR(24) 
)
AS 
BEGIN 
	DELETE Main_GroupUsers 
	WHERE [Group_ID] = @Group_ID 
	  AND [User_ID] = @User_ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_User_GetByGroupID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_User_GetByGroupID]
	@Group_ID VARCHAR(24) 
AS 
BEGIN 
	SELECT [ID], [Group_ID], [User_ID] 
	FROM [dbo].[Main_Group_User] 
	WHERE Group_ID = @Group_ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Group_User_GetByUserID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_User_GetByUserID]
	@User_ID VARCHAR(24) 
AS 
BEGIN 
	SELECT [ID], [Group_ID], [User_ID]  
	FROM [dbo].[Main_Group_User]  
	WHERE [User_ID] = @User_ID 
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Setting_SetValue]
--GO
-----------
CREATE PROCEDURE [dbo].[sp_Main_Setting_SetValue](
	@Name	NVARCHAR(200),
	@Value	NVARCHAR(4000)
)
AS 
BEGIN 
	DECLARE @isExist INT 
	SELECT @isExist = COUNT(1) 
	FROM [dbo].[Main_Setting] WHERE [Name] = @Name 

	IF (@isExist = 0) 
		INSERT INTO [dbo].[Main_Setting]([Name], [Value]) 
		VALUES(@Name, @Value) 
	ELSE 
		UPDATE [dbo].[Main_Setting] SET 
			[Value] = @Value 
		WHERE [Name] = @Name 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Setting_GetValue]
--GO
-----------
CREATE PROCEDURE [dbo].[sp_Main_Setting_GetValue]
	@Name  NVARCHAR(100)
AS 
BEGIN 
	SELECT [Value] 
	FROM [dbo].[Main_Setting] 
	WHERE [Name] = @Name 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Setting_Delete]
--GO
-----------
CREATE PROCEDURE [dbo].[sp_Main_Setting_Delete]
	@ID VARCHAR(24) 
AS 
BEGIN 
	DELETE [dbo].[Main_Setting]  
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_Setting_DeleteByName]
--GO
-----------
CREATE PROCEDURE [dbo].[sp_Main_Setting_DeleteByName]
	@Name VARCHAR(100)
AS 
BEGIN 
	DELETE [dbo].[Main_Setting]  
	WHERE [Name] = @Name 
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Insert](
	@ID VARCHAR(24), 
	@Email VARCHAR(50), 
	@Email_Confirmed BIT, 
	@Full_Name NVARCHAR(50),
	@Login_Name VARCHAR(50),
	@Password VARCHAR(100),
	@Gender BIT,
	@Birthday VARCHAR(50),
	@Address NVARCHAR(100),
	@Phone VARCHAR(50),
	@Super_Admin BIT,
	@Avatar VARCHAR(200)
)
AS 
BEGIN 
	INSERT INTO [dbo].[Main_User] 
	(
		[ID], [Email], [Email_Confirmed], [Full_Name], [Login_Name], [Password],
		[Gender], [Birthday], [Address], [Phone], [Super_Admin], [Avatar]
	)
	VALUES 
	(
		@ID, @Email, @Email_Confirmed, @Full_Name, @Login_Name, @Password,
		@Gender, @Birthday, @Address, @Phone, @Super_Admin, @Avatar
	) 

	RETURN SCOPE_IDENTITY() 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_Update]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Update](
	@ID VARCHAR(24),
	@Email VARCHAR(50),
	@Email_Confirmed BIT,
	@Full_Name NVARCHAR(50),
	@Login_Name VARCHAR(50),
	@Password VARCHAR(100),
	@Gender BIT,
	@Birthday VARCHAR(50),
	@Address NVARCHAR(100),
	@Phone VARCHAR(50),
	@Super_Admin BIT,
	@Avatar VARCHAR(200)
)
AS 
BEGIN 
	UPDATE [dbo].[Main_User] SET
		[Email] = @Email,
		[Email_Confirmed] = @Email_Confirmed,
		[Full_Name] = @Full_Name,
		[Login_Name] = @Login_Name,
		[Password] = @Password,
		[Gender] = @Gender,
		[Birthday] = @Birthday,
		[Address] = @Address,
		[Phone] = @Phone,
		[Super_Admin] = @Super_Admin,
		[Avatar] = @Avatar 
	WHERE [ID] = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Delete]
	@ID VARCHAR(24) 
AS 
BEGIN 
	DELETE [dbo].[Main_User]  
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_GetByID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_GetByID]
	@ID VARCHAR(24) 
AS 
BEGIN 
	SELECT 
		[ID], [Email], [Email_Confirmed], [Full_Name], [Login_Name], [Password],
		[Gender], [Birthday], [Address], [Phone], [Super_Admin], [Avatar]
	FROM [dbo].[Main_User] 
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_GetAll]
AS 
BEGIN 
	SELECT 
		[ID], [Email], [Email_Confirmed], [Full_Name], [Login_Name], [Password],
		[Gender], [Birthday], [Address], [Phone], [Super_Admin], [Avatar] 
	FROM [dbo].[Main_User] 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_GetByEmail]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_GetByEmail]	
	@Email	VARCHAR(50)
AS 
BEGIN 
	SELECT 
		[ID], [Email], [Email_Confirmed], [Full_Name], [Login_Name], [Password],
		[Gender], [Birthday], [Address], [Phone], [Super_Admin], [Avatar] 
	FROM [dbo].[Main_User] 
	WHERE Email = @Email 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_GetByEmailPassword]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_GetByEmailPassword](
	@Email	VARCHAR(50),
	@Password	VARCHAR(500)
)
AS 
BEGIN 
	SELECT [ID] 
	FROM [dbo].[Main_User] 
	WHERE Email = @Email 
	  AND Password = @Password 
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_Cmd_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Cmd_Insert]
	@ID VARCHAR(24),
	@User_ID VARCHAR(24),
	@Cmd_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [ID], [User_ID], [Cmd_ID] FROM [dbo].[Main_User_Cmd] 
	WHERE [User_ID] = @User_ID AND [Cmd_ID] = @Cmd_ID	
	
	IF (@@RowCount = 0)
		INSERT INTO [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID])
		VALUES(@ID, @User_ID, @Cmd_ID)
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_Cmd_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Cmd_Delete]
	@Cmd_ID VARCHAR(24), 
	@User_ID VARCHAR(24) 
AS 
BEGIN 
	DELETE FROM [dbo].[Main_User_Cmd]  
	WHERE [Cmd_ID] = @Cmd_ID 
	  AND [User_ID] = @User_ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_Cmd_CheckRole]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Cmd_CheckRole]
	@User_ID VARCHAR(24),
	@Cmd_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [Cmd_ID] 
	FROM [dbo].[Main_User_Cmd] 
	WHERE [User_ID] = @User_ID 
	  AND [Cmd_ID] = @Cmd_ID 
	UNION 
	SELECT GC.[Cmd_ID] 
	FROM [dbo].[Main_Group_Cmd] GC
	INNER JOIN [dbo].[Main_Group] G ON G.[ID] = GC.[Group_ID]
	INNER JOIN [dbo].[Main_Group_User] GU ON GU.[Group_ID] = G.[ID]
	WHERE GU.[User_ID] = @User_ID 
	  AND GC.[Cmd_ID] = @Cmd_ID

	RETURN @@ROWCOUNT 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_Cmd_GetGroupByUserID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Cmd_GetGroupByUserID]
	@User_ID VARCHAR(24)
AS 
BEGIN 
	SELECT ID FROM [dbo].[Main_User_Cmd] WHERE [User_ID] = @User_ID	
	UNION
	SELECT GC.ID 
	FROM [dbo].[Main_Group_Cmd] GC
	INNER JOIN [dbo].[Main_Group] G ON G.ID = GC.Group_ID
	INNER JOIN [dbo].[Main_Group_User] GU ON GU.Group_ID = GC.Group_ID
	WHERE GU.[User_ID] = @User_ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Main_User_Cmd_GetCmdID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_User_Cmd_GetCmdID]
	@User_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [Cmd_ID]  
	FROM [dbo].[Main_User_Cmd] 
	WHERE [User_ID] = @User_ID 
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Order_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_Insert]
	@ID VARCHAR(24) 
	,@User_ID VARCHAR(24) 
	,@Status NVARCHAR(50) 
	,@Deal_ID NVARCHAR(50)
	,@Tracking_Number NVARCHAR(50) 
AS
BEGIN
	INSERT INTO [dbo].[Order]([ID], [User_ID], [Status], [Deal_ID], [Created_Date], [Process_Date], [Tracking_Number])
	VALUES (@ID, @Status, @User_ID, @Deal_ID, GETDATE(), null, @Tracking_Number)

	RETURN SCOPE_IDENTITY()
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Order_UpdateStatus]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_UpdateStatus]
	@ID VARCHAR(24) 
	,@Status NVARCHAR(50) 
	,@Tracking_Number NVARCHAR(50) 
AS
BEGIN
	UPDATE [dbo].[Order] SET 
		[Process_Date] = GETDATE()
		,[Status] = @Status
		,[Tracking_Number] = @Tracking_Number
	WHERE [ID] = @ID 
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Order_GetByID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_GetByID]
	@ID VARCHAR(24)
	,@Deal_ID NVARCHAR(50)
AS
BEGIN
	SELECT 
		[Status] 
		,CONVERT(VARCHAR, [Created_Date], 103) AS [Created_Date] 
		,CONVERT(VARCHAR, [Process_Date], 103) AS [Process_Date] 
		,[Tracking_Number] 
	FROM [dbo].[Order] 
	WHERE [ID] = @ID
	  AND [Deal_ID] = @Deal_ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Order_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_GetAll]
AS
BEGIN
	SELECT
		O.[ID]
		,U.[Full_Name]
		,U.[Address]
		,U.[Email]
		,U.[Phone]
		,CONVERT(VARCHAR, O.[Created_Date], 103) AS [Created_Date]
		,O.[Status]
		,O.[Deal_ID]
		,U.[User_Name] 
	FROM [dbo].[Order] O 
		INNER JOIN [dbo].[User] U ON U.[ID] = O.[User_ID]
	ORDER BY O.[Created_Date] DESC, O.[ID] DESC
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Order_GetByUserID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_GetByUserID]
	@User_ID VARCHAR(24) 
AS
BEGIN
	SELECT
		[ID]
		,[User_ID]
		,[Deal_ID]
		,[Status] 
		,CONVERT(VARCHAR, [Created_Date], 103) AS [Created_Date]
		,CONVERT(VARCHAR, [Process_Date], 103) AS [Process_Date]
		,[Tracking_Number]
	FROM [dbo].[Order]  
	WHERE [User_ID] = @User_ID
	ORDER BY [Created_Date] DESC
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Order_GetTop]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_GetTop]
	@topNumber INT 
AS
BEGIN
	SELECT TOP(@topNumber) [ID] 
	FROM [dbo].[Order] 
	ORDER BY [ID] DESC
END
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Order_Detail_Insert]
--GO
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
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Order_Detail_GetByOrderID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_Detail_GetByOrderID]
	@Order_ID VARCHAR(24) 
AS 
BEGIN 
	SELECT P.[ID], P.[Name], OD.[Amount], P.[Price] 
	FROM [dbo].[Order_Detail] OD
	INNER JOIN [dbo].[Product] P ON P.[ID] = OD.[Product_ID] 
	WHERE OD.Order_ID = @Order_ID 
	ORDER BY P.[ID] DESC, P.[Name] DESC 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Order_Detail_GetByOrderIDUserIDDealID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Order_Detail_GetByOrderIDUserIDDealID](
	@Order_ID VARCHAR(24), 
	@Deal_ID NVARCHAR(50), 
	@User_ID VARCHAR(24) 
)
AS 
BEGIN 
	SELECT P.[ID], P.[Name], OD.[Amount], P.[Price] 
	FROM [dbo].[Order] O 
	INNER JOIN [dbo].[User] U ON O.[User_ID] = U.[ID]
	INNER JOIN [dbo].[Order_Detail] OD ON O.[ID] = OD.[Order_ID]
	INNER JOIN [dbo].[Product] P ON P.[ID] = OD.[Product_ID] 
	WHERE OD.[ID] = @Order_ID 
	  AND O.[Deal_ID] = @Deal_ID 
	  AND U.[ID] = @User_ID
	ORDER BY P.[ID] DESC, P.[Name] DESC 
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Product_Image_Insert] 
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Image_Insert](
	@ID VARCHAR(24), 
	@Data IMAGE 
) 
AS 
BEGIN 
	INSERT INTO [dbo].[Product_Image] ([ID], [Data]) 
	VALUES (@ID, @Data) 

	RETURN SCOPE_IDENTITY() 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Product_Image_Update] 
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Image_Update](
	@ID VARCHAR(24), 
	@Data IMAGE 
)
AS
BEGIN 
	UPDATE [dbo].[Product_Image] SET 
		[Data] = @Data 
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Product_Image_Delete] 
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Image_Delete](
	@ID VARCHAR(24) 
)
AS
BEGIN 
	DELETE FROM [dbo].[Product_Image] 
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Product_Image_GetByID] 
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Image_GetByID] 
	@ID VARCHAR(24) 
AS
BEGIN 
	SELECT [ID], [Data] 
	FROM [dbo].[Product_Image] 
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Product_Image_GetAll] 
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Product_Image_GetAll] 
AS
BEGIN 
	SELECT [ID], [Data] 
	FROM [dbo].[Product_Image] 
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Role_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Role_Insert](
	@ID VARCHAR(24), 
	@Name VARCHAR(50) 
)
AS
BEGIN
	INSERT INTO [dbo].[Role] ([ID], [Name])
	VALUES (@ID, @Name)

	RETURN SCOPE_IDENTITY()
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Role_Update]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Role_Update]
(
	@ID VARCHAR(24), 
	@Name NVARCHAR(50)
)
AS
BEGIN
	UPDATE [dbo].[Role] SET 
		[Name] = @Name 
	WHERE [ID] = @ID
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Role_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Role_Delete]
	@ID VARCHAR(24) 
AS
BEGIN
	DELETE FROM [dbo].[Role] 
	WHERE [ID] = @ID
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Role_GetById]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Role_GetById]
	@ID VARCHAR(24) 
AS
BEGIN
	SELECT [ID], [Name]
	FROM [dbo].[Role] 
	WHERE [ID] = @ID
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Role_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Role_GetAll]
AS
BEGIN
	SELECT [ID], [Name]
	FROM [dbo].[Role] 
END
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Shop_Cart_Insert]
--GO
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
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Shop_Cart_UpdateAmount]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Shop_Cart_UpdateAmount]
	@ID VARCHAR(24) 
	,@Amount INT
AS
BEGIN
	UPDATE [dbo].[Shop_Cart] SET 
		[Amount] = @Amount
	WHERE [ID] = @ID
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Shop_Cart_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Shop_Cart_Delete]
	@ID VARCHAR(24) 
AS
BEGIN
	DELETE FROM [dbo].[Shop_Cart]
	WHERE [ID] = @ID
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Shop_Cart_GetByGuid]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Shop_Cart_GetByGuid]
	@Guid NVARCHAR(50)
AS
BEGIN
	SELECT
		SC.[ID]
		,P.[ID] AS [Product_ID]
		,P.[Name] AS [Product_Name]
		,SC.[Amount]
		,P.[Price] 
		,(P.[Price] * SC.[Amount]) AS [Sum_Price]
	FROM [dbo].[Shop_Cart] SC
	INNER JOIN [dbo].[Product] P ON P.[ID] = SC.[Product_ID]
	WHERE [Guid] = @Guid 
END
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Supplier_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Supplier_Insert](
	@ID			VARCHAR(24) 
	,@Name		NVARCHAR(125) 
	,@Address	NVARCHAR(255) 
	,@Phone		NVARCHAR(24) 
	,@Fax		NVARCHAR(24) 
	,@Website	NVARCHAR(250)
)
AS
BEGIN
	INSERT INTO [dbo].[Supplier] ([Name], [Address], [Phone], [Fax], [Website])
	VALUES (@Name, @Address, @Phone, @Fax, @Website)

	RETURN SCOPE_IDENTITY() 
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Supplier_Update]
--GO
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
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Supplier_Delete]
--GO
--------
CREATE PROCEDURE [dbo].[sp_Supplier_Delete] 
	@ID VARCHAR(24) 
AS 
BEGIN 
	DELETE FROM [dbo].[Supplier]
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Supplier_GetById]
--GO
--------
CREATE PROCEDURE [dbo].[sp_Supplier_GetById] 
	@ID VARCHAR(24) 
AS 
BEGIN 
	SELECT [Name], [Address], [Phone], [Fax], [Website] 
	FROM [dbo].[Supplier]
	WHERE [ID] = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Supplier_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Supplier_GetAll]
AS
BEGIN
	SELECT [Name], [Address], [Phone], [Fax], [Website] 
	FROM [dbo].[Supplier] 
END
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Insert]( 
	@ID	VARCHAR(24), 
	@Full_Name NVARCHAR(250), 
	@User_Name VARCHAR(80), 
	@Email NVARCHAR(250), 
	@Password VARCHAR(250), 
	@Type_Social TINYINT, 
	@AppID NVARCHAR(128), 
	@Address NVARCHAR(250), 
	@Phone NVARCHAR(50) 
)
AS 
BEGIN 
	IF EXISTS (SELECT [ID] FROM [dbo].[User] WHERE [Email] = @Email)
		RETURN -1
	ELSE IF EXISTS (SELECT [ID] FROM [dbo].[User] WHERE [User_Name] = @User_Name)
		RETURN -2
	ELSE
	BEGIN
		INSERT INTO [dbo].[User] ([ID], [Full_Name], [User_Name], [Email], [Password], [Type_Social], [AppID], [Address], [Phone])
		VALUES (@ID, @Full_Name, @User_Name, @Email, @Password, @Type_Social, @AppID, @Address, @Phone)
		
		RETURN SCOPE_IDENTITY() 
	END 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_Update]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Update](
	@ID	VARCHAR(24), 
	@Full_Name NVARCHAR(250), 
	@User_Name VARCHAR(80), 
	@Email NVARCHAR(250), 
	@Password VARCHAR(250), 
	@Type_Social TINYINT, 
	@AppID NVARCHAR(128), 
	@Address NVARCHAR(250), 
	@Phone NVARCHAR(50) 
)
AS 
BEGIN 
	UPDATE [dbo].[User] SET
		[Full_Name] = @Full_Name,
		[User_Name] = @User_Name,
		[Email] = @Email,
		[Password] = @Password,
		[Type_Social] = @Type_Social,
		[AppID] = @AppID,
		[Address] = @Address,
		[Phone] = @Phone
	WHERE [ID] = @Id
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Delete]
	@ID INT
AS 
BEGIN 
	DELETE [dbo].[User]  
	WHERE [ID] = @ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_GetById]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_GetById]
	@ID VARCHAR(24) 
AS 
BEGIN 
	SELECT [ID], [Full_Name], [User_Name], [Email], [Password], [Type_Social], [AppId], [Address], [Phone] 
	FROM [dbo].[User] 
	WHERE ID = @ID
END 
GO 
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_GetAll]
AS 
BEGIN 
	SELECT [ID], [Full_Name], [User_Name], [Email], [Password], [Type_Social], [AppId], [Address], [Phone] 
	FROM [dbo].[User] 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_GetByAppId] 
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_GetByAppId] 
(
	@AppID NVARCHAR(128), 
	@Type_Social TINYINT
)
AS 
BEGIN 
	SELECT [ID], [Full_Name], [User_Name], [Email], [Password], [Type_Social], [AppId], [Address], [Phone] 
	FROM [dbo].[User]  
	WHERE ([AppID] = @AppID AND [Type_Social] = @Type_Social) 
	   OR ([AppID] = @AppID AND [Type_Social] = 0)
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_GetByUserName] 
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_GetByUserName]
	@User_Name NVARCHAR(50)
AS
BEGIN
	SELECT [ID], [Full_Name], [User_Name], [Email], [Password], [Type_Social], [AppId], [Address], [Phone] 
	FROM [dbo].[User] 
	WHERE [User_Name] = @User_Name 
END
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_GetUserByUserNamePassword]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_GetUserByUserNamePassword]
	@User_Name NVARCHAR(80),
	@Password NVARCHAR(250)
AS
BEGIN
	SELECT 
		[ID]
		,[Full_Name] 
	FROM [dbo].[User] 
	WHERE [User_Name] = @User_Name 
	  AND [Password] = @Password 
	  /*AND [Type_User_ID] = 1*/
END
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_Role_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Role_Insert](
	@ID			VARCHAR(24),
	@User_ID	VARCHAR(24),
	@Role_ID	VARCHAR(24)
)
AS 
BEGIN 
	IF NOT EXISTS (SELECT [ID] FROM [dbo].[User_Role] WHERE [User_ID] = @User_ID AND [Role_ID] = @Role_ID)
		INSERT INTO [dbo].[User_Role] ([ID], [User_ID], [Role_ID])
		VALUES(@ID, @User_ID, @Role_ID)

	RETURN SCOPE_IDENTITY() 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_Role_CheckRole]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Role_CheckRole]
	@User_ID	VARCHAR(24),
	@Role_ID	VARCHAR(24)
AS 
BEGIN 
	IF EXISTS (SELECT [ID] FROM [dbo].[User_Role] WHERE [User_ID] = @User_ID AND [Role_ID] = @Role_ID)
		RETURN 1 
	ELSE 
		RETURN 0 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_Role_GetByUserID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Role_GetByUserID]
	@User_ID	VARCHAR(24) 
AS 
BEGIN 
	SELECT [User_ID], [Role_ID] 
	FROM [dbo].[User_Role] 
	WHERE [User_ID] = @User_ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_Role_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Role_Delete]
	@User_ID	VARCHAR(24),
	@Role_ID	VARCHAR(24) 
AS 
BEGIN 
	DELETE [dbo].[User_Role] 
	WHERE [User_ID] = @User_ID 
	  AND [Role_ID] = @Role_ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_User_Role_Set]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_User_Role_Set]
	@ID			VARCHAR(24),
	@User_ID	VARCHAR(24),
	@Role_ID	VARCHAR(24)
AS 
BEGIN 
	IF EXISTS (SELECT [ID] FROM [dbo].[User_Role] WHERE [User_ID] = @User_ID) 
		UPDATE [dbo].[User_Role] SET 
			[Role_ID] = @Role_ID
		WHERE [User_ID] = @User_ID 
	ELSE 
		INSERT INTO [dbo].[User_Role] ([ID], [User_ID], [Role_ID])
		VALUES(@ID, @User_ID, @Role_ID) 
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_Insert]
--GO
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
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_Update]
--GO
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
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_GetByUserID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_GetByUserID]
	@User_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [User_ID], [Content_ID], [Vote_Type_ID] 
	FROM [dbo].[Vote] 
	WHERE [User_ID] = @User_ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_GetAll]
AS 
BEGIN 
	SELECT [User_ID], [Content_ID], [Vote_Type_ID] 
	FROM [dbo].[Vote] 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_GetByContentID] 
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_GetByContentID] 
	@Content_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [Vote_Type_ID], COUNT([Vote_Type_ID]) AS [Number_Vote]
	FROM [dbo].[Vote] 
	WHERE [Content_ID] = @Content_ID 
	GROUP BY [Vote_Type_ID] 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_GetByUserIDContentID] 
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_GetByUserIDContentID] 
	@User_ID VARCHAR(24),
	@Content_ID VARCHAR(24)
AS 
BEGIN 
	SELECT [User_ID], [Content_ID], [Vote_Type_ID] 
	FROM [dbo].[Vote] 
	WHERE [User_ID] = @User_ID 
	  AND [Content_ID] = @Content_ID
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_DeleteByUserID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_DeleteByUserID]
	@User_ID VARCHAR(24)
AS 
BEGIN 
	DELETE FROM [dbo].[Vote]  
	WHERE [User_ID] = @User_ID
END 
GO
/*=====================================================================================================*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_Type_Insert]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_Type_Insert]( 
	@ID VARCHAR(24),
	@Name NVARCHAR(128) 
)
AS 
BEGIN 
	INSERT INTO [dbo].[Vote_Type] ([ID], [Name])
	VALUES (@ID, @Name) 

	RETURN SCOPE_IDENTITY() 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_Type_Update]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_Type_Update](
	@ID VARCHAR(24),
	@Name NVARCHAR(128) 
)
AS 
BEGIN 
	UPDATE [dbo].[Vote_Type] SET 
		[Name] = @Name 
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_Type_Delete]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_Type_Delete]
	@ID VARCHAR(24)
AS 
BEGIN 
	DELETE FROM [dbo].[Vote_Type] 
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_Type_GetByID]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_Type_GetByID]
	@ID VARCHAR(24)
AS 
BEGIN 
	SELECT [ID], [Name] 
	FROM [dbo].[Vote_Type] 
	WHERE [ID] = @ID 
END 
GO
/*----------------------------------------------------------------------------------------------------*/
--DROP PROCEDURE IF EXISTS [dbo].[sp_Vote_Type_GetAll]
--GO
-----------------
CREATE PROCEDURE [dbo].[sp_Vote_Type_GetAll]
AS 
BEGIN 
	SELECT [ID], [Name] 
	FROM [dbo].[Vote_Type] 
END 
GO