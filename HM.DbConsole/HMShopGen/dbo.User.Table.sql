USE [HMShopDB]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [varchar](24) NOT NULL,
	[Full_Name] [nvarchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[User_Name] [varchar](80) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Type_Social] [tinyint] NULL,
	[AppID] [nvarchar](128) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[User] ([ID], [Full_Name], [Email], [User_Name], [Password], [Type_Social], [AppID], [Address], [Phone]) VALUES (N'1', N'Nguyễn Mỹ Huyền', N'huyennm@gmail.com', N'huyennm', N'5259042001e99b7e2059c38b857c8630', 0, N'', N'Ba Đình - Hà Nội', N'0918564325')
INSERT [dbo].[User] ([ID], [Full_Name], [Email], [User_Name], [Password], [Type_Social], [AppID], [Address], [Phone]) VALUES (N'2', N'Thao Nguyen', N'thaond@gmail.com', N'thaond', N'5259042001e99b7e2059c38b857c8630', 0, N'', N'Bac Giang', N'0938261746')
INSERT [dbo].[User] ([ID], [Full_Name], [Email], [User_Name], [Password], [Type_Social], [AppID], [Address], [Phone]) VALUES (N'3', N'Trần Thu Hương', N'huongbka@gmail.com', N'huongth', N'5259042001e99b7e2059c38b857c8630', 0, N'', N'Hoàng Văn Thụ, Hoàng Mai, Hà Nội', N'0126836666')
