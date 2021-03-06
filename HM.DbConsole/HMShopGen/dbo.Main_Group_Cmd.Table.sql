USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Main_Group_Cmd]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Group_Cmd](
	[ID] [varchar](24) NOT NULL,
	[Group_ID] [varchar](24) NOT NULL,
	[Cmd_ID] [varchar](24) NOT NULL,
 CONSTRAINT [PK_MainGroupCmd] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Main_Group_Cmd]  WITH CHECK ADD  CONSTRAINT [FK_MainGroupCmd_MainCmd] FOREIGN KEY([Cmd_ID])
REFERENCES [dbo].[Main_Cmd] ([ID])
GO
ALTER TABLE [dbo].[Main_Group_Cmd] CHECK CONSTRAINT [FK_MainGroupCmd_MainCmd]
GO
ALTER TABLE [dbo].[Main_Group_Cmd]  WITH CHECK ADD  CONSTRAINT [FK_MainGroupCmd_MainGroup] FOREIGN KEY([Group_ID])
REFERENCES [dbo].[Main_Group] ([ID])
GO
ALTER TABLE [dbo].[Main_Group_Cmd] CHECK CONSTRAINT [FK_MainGroupCmd_MainGroup]
GO
