USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Cmd_Insert]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Cmd_Insert](
	@ID VARCHAR(24),
	@Name NVARCHAR (100),
	@Value VARCHAR (50),
	@Parent_ID INT,
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
