USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Group_Delete]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------
CREATE PROCEDURE [dbo].[sp_Main_Group_Delete]
	@ID INT
AS 
BEGIN 
	DELETE [dbo].[Main_Group] 
	WHERE ID = @ID 
END 
GO
