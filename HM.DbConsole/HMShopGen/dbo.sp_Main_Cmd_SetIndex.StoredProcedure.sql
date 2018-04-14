USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Cmd_SetIndex]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
