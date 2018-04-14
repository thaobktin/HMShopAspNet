USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Cmd_Update]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
