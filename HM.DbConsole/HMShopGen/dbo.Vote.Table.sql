USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Vote]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[ID] [varchar](24) NOT NULL,
	[User_ID] [varchar](24) NOT NULL,
	[Content_ID] [varchar](24) NOT NULL,
	[Vote_Type_ID] [varchar](24) NOT NULL
) ON [PRIMARY]
GO
