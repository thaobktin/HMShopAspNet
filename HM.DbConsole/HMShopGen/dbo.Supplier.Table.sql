USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [varchar](24) NOT NULL,
	[Name] [nvarchar](125) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[Website] [nvarchar](250) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'1', N'Samsung', N'25FL - Bitexco Financial Towel - 2 Hai Trieu - Dist1 -HCMC', N'1800588889', N'', N'http://www.samsung.com/vn/support/')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'10', N'Lenovo', N'Morrisville 1009 Think Place Morrisville, NC 27560 United States', N'+1 (855) 253-6686', N'', N'http://www.lenovo.com/')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'11', N'Nha CC 1', N'Hanoi', N'', N'', N'')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'2', N'Apple', N'1 Infinite Loop, Cupertino, CA 95014', N'(408) 996–1010', N'(408) 996–1010', N'http://www.apple.com/contact/')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'3', N'Sony', N'1-7-1 Konan Minato-ku, Tokyo, 108-0075 Japan', N'81-3-6748-2111', N'81-3-6748-2111', N'http://www.sony.net/')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'4', N'Canon', N'30-2, Shimomaruko 3-chome, Ohta-ku, Tokyo 146-8501, Japan', N'(81) 3-3758-2111', N'(81) 3-3758-2111', N'http://global.canon/en/corporate/')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'5', N'Dell', N'Dell Computer Corporation One Dell Way Round Rock, Texas 78682', N'(888) 560-8324', N'(888) 560-8324', N'http://www.dell.com')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'6', N'HP', N'5200 Blue Lagoon Dr #10, Miami, FL 33126, USA', N'1 305-267-4220', N'', N'http://www8.hp.com/')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'7', N'HTC', N'Taoyuan, Taiwan', N'1 855 580 2302‎', N'', N'http://www.htc.com/')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'8', N'OPPO', N'Suntec City Mall - Tower 3 #01-627 to 630 Temasek Boulevard, S(038983), Singapore', N'', N'', N'http://www.oppo.com/')
INSERT [dbo].[Supplier] ([ID], [Name], [Address], [Phone], [Fax], [Website]) VALUES (N'9', N'ASUS', N'ASUS Computer International 800 Corporate Way Fremont, CA 94539', N'(510)-739-3777', N'', N'http://www.asus.com')
