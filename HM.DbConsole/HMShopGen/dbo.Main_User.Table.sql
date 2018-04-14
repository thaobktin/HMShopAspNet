USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Main_User]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_User](
	[ID] [varchar](24) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Email_Confirmed] [bit] NULL,
	[Full_Name] [nvarchar](50) NOT NULL,
	[Login_Name] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Gender] [bit] NULL,
	[Birthday] [varchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[Super_Admin] [bit] NULL,
	[Avatar] [varchar](200) NULL,
 CONSTRAINT [PK_MainUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Main_User] ([ID], [Email], [Email_Confirmed], [Full_Name], [Login_Name], [Password], [Gender], [Birthday], [Address], [Phone], [Super_Admin], [Avatar]) VALUES (N'1', N'thaond@com.vn', 1, N'Nguyễn Đức Thao', N'shopadmin', N'efe453fbbf0999b060f2a3ef136ce358', 1, N'08/11/1987', N'Kim Hoa - Đống Đa - Hà Nội', N'0936195842', 1, N'')
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MainUser]    Script Date: 26-Nov-17 11:35:39 PM ******/
ALTER TABLE [dbo].[Main_User] ADD  CONSTRAINT [IX_MainUser] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
