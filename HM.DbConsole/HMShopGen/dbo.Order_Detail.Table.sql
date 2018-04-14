USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[ID] [varchar](24) NOT NULL,
	[Order_ID] [varchar](24) NOT NULL,
	[Product_ID] [varchar](24) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [Product_ID], [Amount]) VALUES (N'1', N'1', N'53', 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [Product_ID], [Amount]) VALUES (N'1002', N'1001', N'80', 4)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [Product_ID], [Amount]) VALUES (N'2', N'1', N'5', 6)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [Product_ID], [Amount]) VALUES (N'3', N'2', N'47', 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [Product_ID], [Amount]) VALUES (N'4', N'2', N'37', 2)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [Product_ID], [Amount]) VALUES (N'5', N'3', N'53', 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [Product_ID], [Amount]) VALUES (N'6', N'3', N'31', 2)
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
