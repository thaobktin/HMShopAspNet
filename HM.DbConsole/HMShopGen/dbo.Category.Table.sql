USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26-Nov-17 11:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [varchar](24) NOT NULL,
	[Name] [nvarchar](125) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Picture] [image] NULL,
	[Enable] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable]) VALUES (N'1', N'Laptop', NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable]) VALUES (N'2', N'Mobile Phone', NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable]) VALUES (N'3', N'Máy tính bảng', NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable]) VALUES (N'4', N'MÁY ẢNH', NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable]) VALUES (N'5', N'Máy Quay', NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable]) VALUES (N'6', N'MÁY GHI ÂM', NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable]) VALUES (N'7', N'MÁY NGHE NHẠC', NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable]) VALUES (N'8', N'Sản phẩm khác', NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Picture], [Enable]) VALUES (N'9', N'Sắp về', NULL, NULL, 0)
