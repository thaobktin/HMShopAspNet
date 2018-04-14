USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Shop_Cart]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop_Cart](
	[ID] [varchar](24) NOT NULL,
	[Guid] [nvarchar](50) NOT NULL,
	[Product_ID] [varchar](24) NOT NULL,
	[Amount] [int] NULL,
	[Created_Date] [smalldatetime] NULL,
 CONSTRAINT [PK_ShopCart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'1oFZBfpNBARnOqIghk2ddwIS', N'c1f358fb-7a80-4837-97c1-8ccd4773d471', N'84', 10, CAST(N'2017-05-11T00:16:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'A3AJlJpAEoiPLu8OilYbdBWO', N'ddb49a57-4c75-4289-ad46-b19cc18b3a23', N'81', 4, CAST(N'2017-05-11T00:20:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'gLJOBw0PX0XGELmfSAkuJyxn', N'15e0ee74-4f0f-4a69-aced-890d2eed72e9', N'90', 1, CAST(N'2017-05-10T22:21:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'iksZFLef5Cine0bCIUR8ghGr', N'4edf468a-af03-40b9-aef9-72776317341d', N'61', 6, CAST(N'2017-05-11T00:21:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'JLaOLUSUCm2s54vlN7Q0A7If', N'3e4b3cd4-ca60-4ecb-9edb-589f679ac985', N'87', 5, CAST(N'2017-05-10T00:28:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'JwlTWoRahuGAldFH6j5iwlJG', N'c1f358fb-7a80-4837-97c1-8ccd4773d471', N'81', 10, CAST(N'2017-05-11T00:16:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'mEEruwpVg0CZJgErvIxrCPoB', N'4edf468a-af03-40b9-aef9-72776317341d', N'9', 2, CAST(N'2017-05-11T00:21:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'NBOnP1x2BM1AZyfzL3fpASBW', N'3d134c6e-9b07-4e41-b629-69b70272f333', N'87', 3, CAST(N'2017-05-10T00:28:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'pdBObyvxIwHBlTQenxiz2z3s', N'c1f358fb-7a80-4837-97c1-8ccd4773d471', N'34', 10, CAST(N'2017-05-11T00:17:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'pzy6UFPz8helrOcevw7QAEPW', N'ddb49a57-4c75-4289-ad46-b19cc18b3a23', N'85', 2, CAST(N'2017-05-11T00:20:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'qcIpJGLOppZQU6VnvUbfgaLF', N'd93d626f-172c-4a29-85f1-0e624e2ed628', N'90', 2, CAST(N'2017-05-11T00:03:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'qPhMa4PaQad3oJLIeOJXGIzX', N'd93d626f-172c-4a29-85f1-0e624e2ed628', N'87', 3, CAST(N'2017-05-11T00:03:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'sjhB77PUJX00aGSmHHEbZAeX', N'423409cc-c714-44f6-a0ba-48f9d068ecf9', N'9', 2, CAST(N'2017-05-11T00:28:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'tqyRqjOlk8F2uUjyOBpfvVkj', N'28ecbc50-a1ac-414e-acf4-13a8c25cf020', N'87', 3, CAST(N'2017-05-10T00:31:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'yDTHKsQ701dRzhms1eC6bKPD', N'c0aebdb9-3060-4c81-a19b-7784b8db7ab8', N'87', 1, CAST(N'2017-05-10T00:37:00' AS SmallDateTime))
INSERT [dbo].[Shop_Cart] ([ID], [Guid], [Product_ID], [Amount], [Created_Date]) VALUES (N'zmEMW5M5VJMaSYaLIPdFf3Cg', N'3c9b1293-d0d0-4eb6-9367-090e0eb92768', N'90', 1, CAST(N'2017-05-10T00:34:00' AS SmallDateTime))
ALTER TABLE [dbo].[Shop_Cart]  WITH CHECK ADD  CONSTRAINT [FK_ShopCart_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Shop_Cart] CHECK CONSTRAINT [FK_ShopCart_Product]
GO
