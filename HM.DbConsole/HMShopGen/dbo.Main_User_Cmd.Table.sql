USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Main_User_Cmd]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_User_Cmd](
	[ID] [varchar](24) NOT NULL,
	[User_ID] [varchar](24) NOT NULL,
	[Cmd_ID] [varchar](24) NOT NULL,
 CONSTRAINT [PK_MainUserCmd] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'1', N'1', N'1')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'10', N'1', N'10')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'11', N'1', N'11')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'12', N'1', N'12')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'13', N'1', N'13')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'14', N'1', N'14')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'15', N'1', N'15')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'16', N'1', N'16')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'17', N'1', N'17')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'18', N'1', N'18')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'19', N'1', N'19')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'2', N'1', N'2')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'20', N'1', N'20')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'21', N'1', N'21')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'22', N'1', N'22')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'23', N'1', N'23')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'24', N'1', N'24')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'25', N'1', N'25')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'3', N'1', N'3')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'4', N'1', N'4')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'5', N'1', N'5')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'6', N'1', N'6')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'7', N'1', N'7')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'8', N'1', N'8')
INSERT [dbo].[Main_User_Cmd] ([ID], [User_ID], [Cmd_ID]) VALUES (N'9', N'1', N'9')
ALTER TABLE [dbo].[Main_User_Cmd]  WITH CHECK ADD  CONSTRAINT [FK_MainUserCmd_MainCmd] FOREIGN KEY([Cmd_ID])
REFERENCES [dbo].[Main_Cmd] ([ID])
GO
ALTER TABLE [dbo].[Main_User_Cmd] CHECK CONSTRAINT [FK_MainUserCmd_MainCmd]
GO
ALTER TABLE [dbo].[Main_User_Cmd]  WITH CHECK ADD  CONSTRAINT [FK_MainUserCmd_MainUser] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Main_User] ([ID])
GO
ALTER TABLE [dbo].[Main_User_Cmd] CHECK CONSTRAINT [FK_MainUserCmd_MainUser]
GO
