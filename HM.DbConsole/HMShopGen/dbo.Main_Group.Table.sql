USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Main_Group]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Group](
	[ID] [varchar](24) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_MainGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Main_Group] ([ID], [Name], [Description]) VALUES (N'1', N'Administrator', N'Nhóm quản trị')
INSERT [dbo].[Main_Group] ([ID], [Name], [Description]) VALUES (N'2', N'Founder', N'Nhóm founder')
INSERT [dbo].[Main_Group] ([ID], [Name], [Description]) VALUES (N'3', N'Provider', N'Nhóm nhà cung cấp')
INSERT [dbo].[Main_Group] ([ID], [Name], [Description]) VALUES (N'4', N'Customer', N'Nhóm khách hàng')
