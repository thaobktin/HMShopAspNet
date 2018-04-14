USE [HMShopDB]
GO
/*=====================================================================================================*/
/* 01. main_cmd */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Main_Cmd' AND xtype='U')
CREATE TABLE [dbo].[Main_Cmd]
(
	[ID] VARCHAR(24) NOT NULL
	,[Name] NVARCHAR(125) NOT NULL
	,[Value] VARCHAR(100) NOT NULL
	,[Parent_ID] VARCHAR(24) 
	,[Index] INT 
	,[Url] VARCHAR(150) 
	,[Path] VARCHAR(200) 
	,[Enable] BIT 
	,[Visible] BIT 
	,CONSTRAINT [PK_MainCmd] PRIMARY KEY CLUSTERED ([ID])
) 
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 02. main_group */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Main_Group' AND xtype='U')
CREATE TABLE [dbo].[Main_Group]
(
	[ID] VARCHAR(24) NOT NULL
	,[Name] NVARCHAR(50) NOT NULL 
	,[Description] NVARCHAR(255) 
	,CONSTRAINT [PK_MainGroup] PRIMARY KEY CLUSTERED ([ID]) 
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 03. main_group_cmd */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Main_Group_Cmd' AND xtype='U')
CREATE TABLE [dbo].[Main_Group_Cmd]
(
	[ID] VARCHAR(24) NOT NULL
	,[Group_ID] VARCHAR(24) NOT NULL
	,[Cmd_ID] VARCHAR(24) NOT NULL
	,CONSTRAINT [PK_MainGroupCmd] PRIMARY KEY CLUSTERED ([ID]) 
	,CONSTRAINT [FK_MainGroupCmd_MainGroup] FOREIGN KEY([Group_ID]) REFERENCES [dbo].[Main_Group] ([ID]) 
	,CONSTRAINT [FK_MainGroupCmd_MainCmd] FOREIGN KEY([Cmd_ID]) REFERENCES [dbo].[Main_Cmd] ([ID]) 
) 
/*----------------------------------------------------------------------------------------------------*/
/* 04. main_user */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Main_User' AND xtype='U')
CREATE TABLE [dbo].[Main_User]
(
	[ID] VARCHAR(24) NOT NULL
	,[Email] VARCHAR(50) NOT NULL 
	,[Email_Confirmed] BIT 
	,[Full_Name] NVARCHAR(50) NOT NULL 
	,[Login_Name] VARCHAR(50) NOT NULL 
	,[Password] VARCHAR(100) NOT NULL 
	,[Gender] BIT 
	,[Birthday] VARCHAR(50) 
	,[Address] NVARCHAR(100) 
	,[Phone] VARCHAR(50) 
	,[Super_Admin] BIT 
	,[Avatar] VARCHAR(200) 
	,CONSTRAINT [PK_MainUser] PRIMARY KEY CLUSTERED ([ID]) 
	,CONSTRAINT [IX_MainUser] UNIQUE NONCLUSTERED ([Email])
) 
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 05. main_group_user */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Main_Group_User' AND xtype='U')
CREATE TABLE [dbo].[Main_Group_User]
(
	[ID] VARCHAR(24) NOT NULL
	,[Group_ID] VARCHAR(24) NOT NULL
	,[User_ID] VARCHAR(24) NOT NULL 
	,CONSTRAINT [PK_MainGroupUser] PRIMARY KEY CLUSTERED ([ID]) 
	,CONSTRAINT [FK_MainGroupUser_MainGroup] FOREIGN KEY([Group_ID]) REFERENCES [dbo].[Main_Group] ([ID])
	,CONSTRAINT [FK_MainGroupUser_MainUser] FOREIGN KEY([User_ID]) REFERENCES [dbo].[Main_User] ([ID])
) 
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 06. main_user_cmd */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Main_User_Cmd' AND xtype='U')
CREATE TABLE [dbo].[Main_User_Cmd]
(
	[ID] VARCHAR(24) NOT NULL 
	,[User_ID] VARCHAR(24) NOT NULL 
	,[Cmd_ID] VARCHAR(24) NOT NULL 
	,CONSTRAINT [PK_MainUserCmd] PRIMARY KEY CLUSTERED ([ID]) 
	,CONSTRAINT [FK_MainUserCmd_MainUser] FOREIGN KEY([User_ID]) REFERENCES [dbo].[Main_User] ([ID]) 
	,CONSTRAINT [FK_MainUserCmd_MainCmd] FOREIGN KEY([Cmd_ID]) REFERENCES [dbo].[Main_Cmd] ([ID]) 
) 
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 07. main_setting */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Main_Setting' AND xtype='U')
CREATE TABLE [dbo].[Main_Setting](
	[ID] VARCHAR(24) NOT NULL
	,[Name] VARCHAR(100) NOT NULL
	,[Value] NVARCHAR(4000) NOT NULL
	,CONSTRAINT [PK_MainSetting] PRIMARY KEY CLUSTERED ([ID]) 
)  
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 08. main_active_user */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Main_Active_User' AND xtype='U')
CREATE TABLE [dbo].[Main_Active_User](
	[ID] VARCHAR(24) NOT NULL
	,[IP] VARCHAR(50) NOT NULL
	,[Log_Time] [DATETIME] NOT NULL
	,CONSTRAINT [PK_MainActiveUser] PRIMARY KEY CLUSTERED ([ID])
) 
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 09. role */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Role' AND xtype='U')
CREATE TABLE [dbo].[Role]
(
	[ID] VARCHAR(24) NOT NULL
	,[Name] NVARCHAR(50) NOT NULL
	,CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([ID])
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 10. user */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='User' AND xtype='U')
CREATE TABLE [dbo].[User]
(
	[ID] VARCHAR(24) NOT NULL
	,[Full_Name] NVARCHAR(250) NOT NULL
	,[Email] VARCHAR(250) NOT NULL
	,[User_Name] VARCHAR(80) NOT NULL
	,[Password] VARCHAR(250) NOT NULL
	,[Type_Social] TINYINT NULL
	,[AppID] NVARCHAR(128) NULL
	,[Address] NVARCHAR(250) NULL
	,[Phone] NVARCHAR(50) NULL
	,CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([ID])
) 
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 11. user_role */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='User_Role' AND xtype='U')
CREATE TABLE [dbo].[User_Role]
(
	[ID] VARCHAR(24) NOT NULL
	,[User_ID] VARCHAR(24) NOT NULL
	,[Role_ID] VARCHAR(24) NOT NULL
	,CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED ([ID])
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 12. language */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Language' AND xtype='U')
CREATE TABLE [dbo].[Language]
(
	[ID] VARCHAR(24) NOT NULL
	,[Key] VARCHAR(50) NOT NULL
	,[Name] NVARCHAR(100) NOT NULL
	,CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([ID])
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 13. category */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Category' AND xtype='U')
CREATE TABLE [dbo].[Category]
(
	[ID] VARCHAR(24) NOT NULL
	,[Name] NVARCHAR(125) NOT NULL
	,[Description] NVARCHAR(500)
	,[Picture] IMAGE 
	,[Enable] BIT 
	,CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([ID])
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 14. order */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Order' AND xtype='U')
CREATE TABLE [dbo].[Order]
(
	[ID] VARCHAR(24) NOT NULL
	,[User_ID] VARCHAR(24) NOT NULL
	,[Status] NVARCHAR(50) NOT NULL
	,[Deal_ID] VARCHAR(50) NOT NULL
	,[Created_Date] DATETIME NOT NULL
	,[Process_Date] DATETIME 
	,[Tracking_Number] NVARCHAR(50) 
	,CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED ([ID]) 
	,CONSTRAINT [FK_Order_User] FOREIGN KEY([User_ID]) REFERENCES [dbo].[User] ([ID])
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 15. product_image */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Product_Image' AND xtype='U')
CREATE TABLE [dbo].[Product_Image]
(
	[ID] VARCHAR(24) NOT NULL
	,[Data] IMAGE 
	,CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED ([ID])
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 16. supplier */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Supplier' AND xtype='U')
CREATE TABLE [dbo].[Supplier]
(
	[ID] VARCHAR(24) NOT NULL
	,[Name] NVARCHAR(125) NOT NULL 
	,[Address] NVARCHAR(255) NULL 
	,[Phone] NVARCHAR(24) NULL 
	,[Fax] NVARCHAR(24) NULL 
	,[Website] NVARCHAR(250) NULL 
	,CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED ([ID])
) 
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 17. product */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Product' AND xtype='U')
CREATE TABLE [dbo].[Product]
(
	[ID] VARCHAR(24) NOT NULL
	,[Category_ID] VARCHAR(24) NOT NULL 
	,[Supplier_ID] VARCHAR(24) NOT NULL
	,[Product_Image_ID] VARCHAR(24) NOT NULL
	,[Name] NVARCHAR(250) NOT NULL
	,[Description] NVARCHAR(MAX) NOT NULL
	,[Cost] INT 
	,[Price] INT NOT NULL
	,[Continued] BIT 
	,CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ID])
	,CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_ID]) REFERENCES [dbo].[Category] ([ID])
	,CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([Supplier_ID]) REFERENCES [dbo].[Supplier] ([ID])
	,CONSTRAINT [FK_Product_ProductImage] FOREIGN KEY([Product_Image_ID]) REFERENCES [dbo].[Product_Image] ([ID])
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 18. order_detail */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Order_Detail' AND xtype='U')
CREATE TABLE [dbo].[Order_Detail]
(
	[ID] VARCHAR(24) NOT NULL
	,[Order_ID] VARCHAR(24) NOT NULL
	,[Product_ID] VARCHAR(24) NOT NULL
	,[Amount] [INT] NOT NULL
	,CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED([ID])
	,CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([Order_ID]) REFERENCES [dbo].[Order] ([ID])
	,CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([Product_ID]) REFERENCES [dbo].[Product] ([ID])
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 19. shop_cart */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Shop_Cart' AND xtype='U')
CREATE TABLE [dbo].[Shop_Cart]
(
	[ID] VARCHAR(24) NOT NULL
	,[Guid] NVARCHAR(50) NOT NULL
	,[Product_ID] VARCHAR(24) NOT NULL
	,[Amount] [INT] 
	,[Created_Date] [SMALLDATETIME] 
	,CONSTRAINT [PK_ShopCart] PRIMARY KEY CLUSTERED ([ID])
	,CONSTRAINT [FK_ShopCart_Product] FOREIGN KEY([Product_ID]) REFERENCES [dbo].[Product] ([ID])
)
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 20. vote_type */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Vote_Type' AND xtype='U') 
CREATE TABLE [dbo].[Vote_Type](
	[ID] VARCHAR(24) NOT NULL
	,[Name] NVARCHAR(128) NOT NULL 
	,CONSTRAINT [PK_VoteType] PRIMARY KEY CLUSTERED ([ID]) 
) 
GO 
/*----------------------------------------------------------------------------------------------------*/
/* 21. vote */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Vote' AND xtype='U')
CREATE TABLE [dbo].[Vote]
(
	[ID] VARCHAR(24) NOT NULL
	,[User_ID] VARCHAR(24) NOT NULL
	,[Content_ID] VARCHAR(24) NOT NULL
	,[Vote_Type_ID] VARCHAR(24) NOT NULL
) 
GO 