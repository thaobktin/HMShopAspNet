USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Main_Cmd]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Cmd](
	[ID] [varchar](24) NOT NULL,
	[Name] [nvarchar](125) NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[Parent_ID] [varchar](24) NULL,
	[Index] [int] NULL,
	[Url] [varchar](150) NULL,
	[Path] [varchar](200) NULL,
	[Enable] [bit] NULL,
	[Visible] [bit] NULL,
 CONSTRAINT [PK_MainCmd] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'1', N'Trang chủ', N'', N'0', 1, N'/', N'', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'10', N'Cấu hình hệ thống', N'system_setting', N'2', 3, N'', N'Systems/SettingManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'11', N'Người dùng', N'system_user', N'2', 4, N'', N'Systems/UserManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'12', N'Nhóm người dùng', N'system_group', N'2', 5, N'', N'Systems/GroupManager.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'13', N'Phân quyền nhóm', N'system_grouprole', N'2', 6, N'', N'Systems/GroupRoleManager.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'14', N'Phân quyền người dùng', N'system_userrole', N'2', 7, N'', N'Systems/UserRoleManager.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'15', N'Thành viên nhóm', N'system_groupuser', N'2', 8, N'', N'Systems/GroupUserManager.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'16', N'Đổi mật khẩu', N'system_userchangepwd', N'2', 9, N'', N'Systems/UserChangePassManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'17', N'Thông tin cá nhân', N'system_userprofile', N'2', 10, N'', N'Systems/UserProfileManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'18', N'Danh sách đơn hàng', N'order_listorder', N'3', 1, N'', N'Orders/ListOrderManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'19', N'Chi tiết đơn hàng', N'order_detailorder', N'3', 2, N'', N'Orders/DetailOrderManager.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'2', N'Hệ thống', N'', N'0', 2, N'', N'', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'20', N'Doanh thu', N'order_salereport', N'3', 3, N'', N'Orders/SaleReportManager.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'21', N'Trả hàng', N'order_shipment', N'3', 4, N'', N'Orders/ShipmentManager.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'22', N'Loại sản phẩm', N'product_category', N'4', 1, N'', N'Products/CategoryManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'23', N'Danh mục Sản phẩm', N'product_listproduct', N'4', 2, N'', N'Products/ListProductManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'24', N'Hình ảnh sản phẩm', N'product_thumbproduct', N'4', 3, N'', N'Products/ThumbProductManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'25', N'Chi tiết sản phẩm', N'product_detailproduct', N'4', 4, N'', N'Products/DetailProductManager.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'26', N'Nhà cung cấp', N'partner_supplier', N'5', 1, N'', N'Partners/SupplierManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'27', N'Khách hàng', N'partner_customer', N'5', 2, N'', N'Partners/CustomerManager.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'28', N'Test Page', N'product_test', N'5', 3, N'', N'Products/DataListTest.ascx', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'3', N'Đơn hàng', N'', N'0', 3, N'', N'', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'4', N'Sản phẩm', N'', N'0', 4, N'', N'', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'5', N'Đối tác', N'', N'0', 5, N'', N'', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'6', N'Makerting', N'', N'0', 6, N'', N'', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'7', N'Websites', N'', N'0', 7, N'', N'', 1, 0)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'8', N'Quản lý chức năng', N'system_cmd', N'2', 1, N'', N'Systems/CmdManager.ascx', 1, 1)
INSERT [dbo].[Main_Cmd] ([ID], [Name], [Value], [Parent_ID], [Index], [Url], [Path], [Enable], [Visible]) VALUES (N'9', N'Quản lý bộ đệm', N'system_cache', N'2', 2, N'', N'Systems/CacheManager.ascx', 1, 0)
