USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [varchar](24) NOT NULL,
	[User_ID] [varchar](24) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Deal_ID] [varchar](50) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[Process_Date] [datetime] NULL,
	[Tracking_Number] [nvarchar](50) NULL,
	[OrderStatus_ID] [varchar](24) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Order] ([ID], [User_ID], [Status], [Deal_ID], [Created_Date], [Process_Date], [Tracking_Number], [OrderStatus_ID]) VALUES (N'1', N'3', N'3', N'5ff0684e-cece-49ac-9981-5ff9caf2359d', CAST(N'2016-12-28T18:35:00.000' AS DateTime), CAST(N'2016-12-28T00:00:00.000' AS DateTime), N'231', NULL)
INSERT [dbo].[Order] ([ID], [User_ID], [Status], [Deal_ID], [Created_Date], [Process_Date], [Tracking_Number], [OrderStatus_ID]) VALUES (N'1001', N'1', N'1', N'c07b7b01-cd1e-4db6-93d0-0e3807d01880', CAST(N'2017-01-03T20:41:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [User_ID], [Status], [Deal_ID], [Created_Date], [Process_Date], [Tracking_Number], [OrderStatus_ID]) VALUES (N'2', N'3', N'1', N'37160c3f-ff05-40e2-8b6d-a785b0113473', CAST(N'2016-12-28T18:48:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [User_ID], [Status], [Deal_ID], [Created_Date], [Process_Date], [Tracking_Number], [OrderStatus_ID]) VALUES (N'3', N'1', N'3', N'9ee7e932-2699-42ae-88cf-7587adcc5533', CAST(N'2016-12-28T18:53:00.000' AS DateTime), CAST(N'2016-10-12T00:00:00.000' AS DateTime), N'145', NULL)
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
