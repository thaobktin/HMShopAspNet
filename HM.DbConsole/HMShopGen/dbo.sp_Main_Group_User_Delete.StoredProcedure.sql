USE [HMShopDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Main_Group_User_Delete]    Script Date: 26-Nov-17 11:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
