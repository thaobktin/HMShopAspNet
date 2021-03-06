USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Main_Setting]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Setting](
	[ID] [varchar](24) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_MainSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Main_Setting] ([ID], [Name], [Value]) VALUES (N'1', N'Main.WebTitle', N'HM Shop')
INSERT [dbo].[Main_Setting] ([ID], [Name], [Value]) VALUES (N'2', N'Main.MailServer', N'smtp.com/ex')
INSERT [dbo].[Main_Setting] ([ID], [Name], [Value]) VALUES (N'3', N'Main.DefaultCacheExpire', N'1')
INSERT [dbo].[Main_Setting] ([ID], [Name], [Value]) VALUES (N'4', N'Main.MetaSearch', N'123')
