USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Main_Active_User]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Active_User](
	[ID] [varchar](24) NOT NULL,
	[IP] [varchar](50) NOT NULL,
	[Log_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_MainActiveUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
