USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Main_Group_User]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Group_User](
	[ID] [varchar](24) NOT NULL,
	[Group_ID] [varchar](24) NOT NULL,
	[User_ID] [varchar](24) NOT NULL,
 CONSTRAINT [PK_MainGroupUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Main_Group_User] ([ID], [Group_ID], [User_ID]) VALUES (N'1', N'1', N'1')
ALTER TABLE [dbo].[Main_Group_User]  WITH CHECK ADD  CONSTRAINT [FK_MainGroupUser_MainGroup] FOREIGN KEY([Group_ID])
REFERENCES [dbo].[Main_Group] ([ID])
GO
ALTER TABLE [dbo].[Main_Group_User] CHECK CONSTRAINT [FK_MainGroupUser_MainGroup]
GO
ALTER TABLE [dbo].[Main_Group_User]  WITH CHECK ADD  CONSTRAINT [FK_MainGroupUser_MainUser] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Main_User] ([ID])
GO
ALTER TABLE [dbo].[Main_Group_User] CHECK CONSTRAINT [FK_MainGroupUser_MainUser]
GO
