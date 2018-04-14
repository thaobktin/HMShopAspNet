USE [HMShopDB]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26-Nov-17 11:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [varchar](24) NOT NULL,
	[Category_ID] [varchar](24) NOT NULL,
	[Supplier_ID] [varchar](24) NOT NULL,
	[Product_Image_ID] [varchar](24) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Cost] [int] NULL,
	[Price] [int] NOT NULL,
	[Continued] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'1', N'2', N'3', N'1', N'Sony Xperia arco S', N'<ul>
	<li>
		<strong>H&atilde;ng sản xuất</strong>: Sony</li>
	<li>
		<strong>M&agrave;n h&igrave;nh hiển thị</strong>
		<ul>
			<li>
				<strong>​</strong>Loại m&agrave;n h&igrave;nh:&nbsp;TFT, 16 triệu m&agrave;u</li>
			<li>
				Độ ph&acirc;n giải: &nbsp;480 x 854 Pixels</li>
			<li>
				K&iacute;ch thước m&agrave;n h&igrave;nh:&nbsp;4.2&quot;</li>
			<li>
				Hỗ trợ cảm ứng:&nbsp;Cảm ứng điện dung, đa điểm</li>
		</ul>
	</li>
	<li>
		<strong>Cấu h&igrave;nh chi tiết</strong>
		<ul>
			<li>
				<strong>​</strong>Hệ điều h&agrave;nh:&nbsp;Android v2.3.4 (Gingerbread)</li>
			<li>
				Chipset:&nbsp;Qualcomm MSM8255T</li>
			<li>
				CPU:&nbsp;Solo-core 1.3 GHz</li>
			<li>
				GPU:&nbsp;Adreno 205</li>
			<li>
				Bộ nhớ trong (ROM):&nbsp;1 GB</li>
			<li>
				RAM:&nbsp;&nbsp;512 MB</li>
			<li>
				Danh bạ:&nbsp;Kh&ocirc;ng giới hạn</li>
			<li>
				Ng&ocirc;n ngữ:&nbsp;Tiếng Việt, Tiếng Anh</li>
			<li>
				Thẻ nhớ ngo&agrave;i:&nbsp;MicroSD (T-Flash)</li>
		</ul>
	</li>
	<li>
		<strong>Camera</strong>
		<ul>
			<li>
				<strong>​</strong>Camera sau:&nbsp;8.1 MP</li>
			<li>
				Camera trước:&nbsp;Kh&ocirc;ng</li>
			<li>
				T&iacute;nh năng camera:&nbsp;Tự động lấy n&eacute;t,&nbsp;Đ&egrave;n flash LED,&nbsp;Chạm lấy n&eacute;t,&nbsp;Nhận diện khu&ocirc;n mặt v&agrave; nụ cười,&nbsp;3D sweep panorama</li>
			<li>
				Quay phim:&nbsp;HD 720p@30fps</li>
			<li>
				Videocall:&nbsp;Kh&ocirc;ng</li>
		</ul>
	</li>
	<li>
		<strong>Kết nối dữ liệu</strong>
		<ul>
			<li>
				<strong>​</strong>Băng tần 2G:&nbsp;GSM 850/900/1800/1900</li>
			<li>
				Băng tần 3G, 4G:&nbsp;HSDPA 850/900/1900/2100</li>
			<li>
				Tốc độ 3G, 4G:&nbsp;HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</li>
			<li>
				GPS:&nbsp;A-GPS</li>
			<li>
				Hỗ trợ đa SIM:&nbsp;Kh&ocirc;ng</li>
			<li>
				Bluetooth:&nbsp;C&oacute;, V2.1 với A2DP</li>
			<li>
				GPRS/EDGE:&nbsp;C&oacute;</li>
			<li>
				Wifi:&nbsp;Wi-Fi 802.11 b/g/n, DLNA</li>
			<li>
				Kết nối m&aacute;y t&iacute;nh:&nbsp;USB 2.0</li>
		</ul>
	</li>
	<li>
		<strong>Giải tr&iacute; &amp; Ứng dụng</strong>
		<ul>
			<li>
				<strong>​</strong>Xem phim:&nbsp;WMV, H.263, H.264(MPEG4-AVC), MP4</li>
			<li>
				Nghe nhạc:&nbsp;WAV, MP3, WMA, eAAC+</li>
			<li>
				Ghi &acirc;m:&nbsp;C&oacute;</li>
			<li>
				Chức năng kh&aacute;c:&nbsp;Hỗ trợ mạng x&atilde; hội,&nbsp;Google Search, Maps, Gmail, YouTube, Google Talk,&nbsp;Chức năng qu&eacute;t m&atilde; vạch NeoReader,&nbsp;Loại bỏ tiếng ồn với micro chuy&ecirc;n dụng,&nbsp;Adobe Flash 10.2</li>
		</ul>
	</li>
	<li>
		<strong>Th&ocirc;ng số vật l&yacute;</strong>
		<ul>
			<li>
				<strong>​</strong>Kiểu d&aacute;ng:&nbsp;Thanh + Cảm ứng</li>
			<li>
				K&iacute;ch thước:&nbsp;125 x 63 x 8.7 mm</li>
			<li>
				Trọng lượng (g):&nbsp;117</li>
			<li>
				Loại pin:&nbsp;Pin chuẩn Li-Ion</li>
			<li>
				Dung lượng pin:&nbsp;1500 mAh</li>
			<li>
				Bảo h&agrave;nh: 12 th&aacute;ng</li>
		</ul>
	</li>
</ul>
', NULL, 8300000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'10', N'7', N'3', N'10', N'SONY NWZ-W262/WM E', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: SONY NWZ-W262/WM E</li>
	<li>
		M&agrave;u sắc: Trắng</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN MP3 &amp; MP4</strong></p>
<ul>
	<li>
		Bộ nhớ trong MP3-MP4: 2 GB</li>
	<li>
		Số b&agrave;i h&aacute;t lưu trữ: 470 (128kbps)</li>
	<li>
		Định dạng file nhạc: MP3, WMA</li>
	<li>
		Định dạng file h&igrave;nh: JPEG</li>
	<li>
		Kết nối: USB</li>
</ul>
<p>
	<strong>KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		Khối lượng: 32 gram</li>
</ul>
<p>
	<strong>TH&Ocirc;NG TIN KH&Aacute;C</strong></p>
<ul>
	<li>
		H&atilde;y thể hiện phong c&aacute;ch của bạn với chiếc Walkman&reg;</li>
	<li>
		Mang đến cho bạn sự năng động v&agrave; c&aacute; t&iacute;nh</li>
	<li>
		Tai nghe kh&ocirc;ng d&acirc;y với bộ đ&ocirc;i m&agrave;u thật s&agrave;nh điệu</li>
	<li>
		K&iacute;ch thước nhỏ gọn &aacute;p s&aacute;t tai, kh&ocirc;ng tho&aacute;t &acirc;m-cho cảm gi&aacute;c thoải m&aacute;i khi đeo</li>
	<li>
		Chống thấm nước v&agrave; c&oacute; thể rửa được</li>
	<li>
		Ch&eacute;p nhạc dễ d&agrave;ng k&eacute;o v&agrave; thả, t&igrave;m b&agrave;i h&aacute;t y&ecirc;u th&iacute;ch bằng ZAPPIN&trade;</li>
	<li>
		Pin ph&aacute;t đến 8 giờ (sạc 3 ph&uacute;t nghe được 60 ph&uacute;t)</li>
	<li>
		C&oacute; 2 m&agrave;u: đen, trắng</li>
</ul>
', NULL, 1990000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'11', N'7', N'3', N'11', N'MP3 SONY NWZ-B163', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: SONY NWZ-B163F/NCE</li>
	<li>
		M&agrave;u sắc: V&agrave;ng</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN MP3 &amp; MP4</strong></p>
<ul>
	<li>
		Bộ nhớ trong MP3-MP4: 4 GB</li>
	<li>
		Loại m&agrave;n h&igrave;nh: LCD hiển thị 3 d&ograve;ng</li>
	<li>
		Số b&agrave;i h&aacute;t lưu trữ: Khoảng 980</li>
	<li>
		Định dạng file nhạc: MP3, WMA</li>
	<li>
		Đ&agrave;i FM: C&oacute;</li>
	<li>
		Kết nối: USB</li>
</ul>
<p>
	<strong>KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		Khối lượng: 28 gram</li>
	<li>
		K&iacute;ch thước: 0.9x23.3x15.2 mm</li>
</ul>
<p>
	<strong>TH&Ocirc;NG TIN KH&Aacute;C</strong></p>
<ul>
	<li>
		Cảm nhận &acirc;m Bass mạnh mẽ v&agrave; s&ocirc;i động đến từng nhịp với chiếc m&aacute;y nghe nhạc d&ograve;ng B thế hệ mới</li>
	<li>
		Giờ đ&acirc;y m&agrave;u sắc h&ograve;a hợp với nguồn ph&aacute;t s&aacute;ng v&agrave; kẹp m&aacute;y c&oacute; thể th&aacute;o rời thật tiện lợi khi mang theo, từng điệu nhạc s&ocirc;i động của bạn trở n&ecirc;n tuyệt vời hơn bao giờ hết</li>
	<li>
		N&uacute;t &quot;BASS&quot; gi&uacute;p thưởng thức &acirc;m trầm mạnh mẽ</li>
	<li>
		Pin d&ugrave;ng l&acirc;u 18 giờ (sạc nhanh: 3 ph&uacute;t sạc nghe được 90 ph&uacute;t nhạc)</li>
	<li>
		Kẹp m&aacute;y c&oacute; thể th&aacute;o rời thật phong c&aacute;ch</li>
	<li>
		M&agrave;u sắc h&ograve;a hợp với nguồn ph&aacute;t s&aacute;ng</li>
	<li>
		N&uacute;t &ldquo;ZAP&rdquo; ngay tr&ecirc;n th&acirc;n m&aacute;y tiện lợi để sử dụng chức năng ZAPPIN&trade;</li>
	<li>
		Phương ph&aacute;p sạc pin: Sạc qua cổng USB</li>
	<li>
		Thời gian sạc pin: Khoảng 70 ph&uacute;t (sạc đầy) (Sạc nhanh - sạc 3 ph&uacute;t nghe trong 90 ph&uacute;t)</li>
	<li>
		C&agrave;i đặt &acirc;m thanh: Bass Boost / 5 Band Equalizer (Heavy / Pop / Jazz / Unique / Custom)</li>
	<li>
		Chuẩn MP3: Tốc độ: 32 &ndash; 320kbps (Hỗ trợ chuẩn VBR). Tần số: 32, 44.1, 48kHz</li>
	<li>
		Chuẩn WMA: Tốc độ: 32 &ndash; 192kbps (Hỗ trợ chuẩn VBR). Tần số: 44.1kHz</li>
	<li>
		Ng&otilde; Input / Output: Tai nghe / USB tốc độ cao (2.0)</li>
</ul>
', NULL, 1490000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'12', N'7', N'3', N'12', N'SONY NWZ-B172F/PCE', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: SONY NWZ-B172F/PCE</li>
	<li>
		M&agrave;u sắc: hồng</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN MP3 &amp; MP4</strong></p>
<ul>
	<li>
		Bộ nhớ trong MP3-MP4: 2 GB&nbsp;</li>
	<li>
		Loại m&agrave;n h&igrave;nh: LCD hiển thị 3 d&ograve;ng</li>
	<li>
		Số b&agrave;i h&aacute;t lưu trữ: 440 (128kbps)</li>
	<li>
		Định dạng file nhạc: MP3, WMA</li>
	<li>
		Đ&agrave;i FM: C&oacute;</li>
	<li>
		Kết nối: USB</li>
</ul>
<p>
	<strong>KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		Khối lượng: 28 gram</li>
	<li>
		K&iacute;ch thước: 89.2x24x15 mm</li>
</ul>
<p>
	<strong>TH&Ocirc;NG TIN KH&Aacute;C</strong></p>
<ul>
	<li>
		T&iacute;nh năng chọn b&agrave;i th&ocirc;ng minh ZAPPIN&trade; gi&uacute;p bạn t&igrave;m kiếm b&agrave;i nhạc dễ d&agrave;ng</li>
	<li>
		T&iacute;ch hợp ng&otilde; USB gi&uacute;p chuyển tải nội dung dễ d&agrave;ng</li>
	<li>
		Thu s&oacute;ng FM, thu &acirc;m giọng n&oacute;i v&agrave; đ&agrave;i FM</li>
	<li>
		M&agrave;n h&igrave;nh hiển thị: LCD hiển thị 3 d&ograve;ng</li>
	<li>
		Chức năng Bass Boost _ Tăng cường &acirc;m Bass</li>
	<li>
		Sạc nhanh _ Sạc 3 ph&uacute;t nghe trong 90 ph&uacute;t</li>
	<li>
		Mang đi bất cứ nơi đ&acirc;u bạn muốn bằng kẹp &aacute;o linh hoạt.</li>
	<li>
		Đ&egrave;n nguồn h&ograve;a quyện c&ugrave;ng m&agrave;u m&aacute;y_Đ&egrave;n LED sẽ nhấp nh&aacute;y theo điệu nhạc của bạn</li>
	<li>
		C&agrave;i đặt &acirc;m thanh: Bass Boost / 5 Band Equalizer (Heavy / Pop / Jazz / Unique / Custom)</li>
	<li>
		Phương ph&aacute;p t&igrave;m kiếm: All Songs / Album / Artist / Genre / Release Year / Playlists / Folder / ZAPPIN&trade; (Short / Long)</li>
	<li>
		Chế độ ph&aacute;t: Normal / Repeat All / Repeat 1 Song / Repeat Shuffle All</li>
	<li>
		Thời gian ph&aacute;t li&ecirc;n tục: 18 giờ (128kbps)</li>
	<li>
		Thời gian thu &acirc;m tối đa: 29 giờ 20 ph&uacute;t</li>
	<li>
		Hỗ trợ định dảng file: MP3, WMA</li>
	<li>
		Thời gian sạc pin: Khoảng 70 ph&uacute;t (sạc đầy)</li>
	<li>
		Ng&otilde; Input / Output: Tai nghe / USB tốc độ cao (2.0)</li>
	<li>
		Điện năng nguồn ph&aacute;t tối đa (16 ohms/mW): 5+5mW</li>
	<li>
		K&iacute;ch thước tối đa (Rộng x Cao x D&agrave;y): 89.2 x 24.0 x 15.0mm</li>
	<li>
		Trọng lượng: 28g</li>
	<li>
		C&oacute; 5 m&agrave;u: đen, xanh, hồng, đỏ, đồng</li>
</ul>
', NULL, 1190000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'13', N'7', N'3', N'13', N'SONY NWZ-B173F/BCE', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: SONY NWZ-B173F/BCE</li>
	<li>
		M&agrave;u sắc: Đen</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN MP3 &amp; MP4</strong></p>
<ul>
	<li>
		Bộ nhớ trong MP3-MP4: 4 GB&nbsp;</li>
	<li>
		Loại m&agrave;n h&igrave;nh: LCD hiển thị 3 d&ograve;ng</li>
	<li>
		Số b&agrave;i h&aacute;t lưu trữ: 970 (128kbps)</li>
	<li>
		Định dạng file nhạc: MP3, WMA</li>
	<li>
		Đ&agrave;i FM: C&oacute;</li>
	<li>
		Kết nối: USB</li>
</ul>
<p>
	<strong>KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		Khối lượng: 28 gram</li>
	<li>
		K&iacute;ch thước: 89.2x24x15 mm</li>
</ul>
<p>
	<strong>TH&Ocirc;NG TIN KH&Aacute;C</strong></p>
<ul>
	<li style="&quot;&quot;margin-left:&quot;">
		T&iacute;nh năng chọn b&agrave;i th&ocirc;ng minh ZAPPIN&trade; gi&uacute;p bạn t&igrave;m kiếm b&agrave;i nhạc dễ d&agrave;ng</li>
	<li style="&quot;&quot;margin-left:&quot;">
		T&iacute;ch hợp ng&otilde; USB gi&uacute;p chuyển tải nội dung dễ d&agrave;ng</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Thu s&oacute;ng FM, thu &acirc;m giọng n&oacute;i v&agrave; đ&agrave;i FM</li>
	<li style="&quot;&quot;margin-left:&quot;">
		M&agrave;n h&igrave;nh hiển thị: LCD hiển thị 3 d&ograve;ng</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Chức năng Bass Boost _ Tăng cường &acirc;m Bass</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Sạc nhanh _ Sạc 3 ph&uacute;t nghe trong 90 ph&uacute;t</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Mang đi bất cứ nơi đ&acirc;u bạn muốn bằng kẹp &aacute;o linh hoạt.</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Đ&egrave;n nguồn h&ograve;a quyện c&ugrave;ng m&agrave;u m&aacute;y_Đ&egrave;n LED sẽ nhấp nh&aacute;y theo điệu nhạc của bạn.</li>
	<li style="&quot;&quot;margin-left:&quot;">
		C&agrave;i đặt &acirc;m thanh: Bass Boost / 5 Band Equalizer (Heavy / Pop / Jazz / Unique / Custom)</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Phương ph&aacute;p t&igrave;m kiếm: All Songs / Album / Artist / Genre / Release Year / Playlists / Folder / ZAPPIN&trade; (Short / Long)</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Chế độ ph&aacute;t: Normal / Repeat All / Repeat 1 Song / Repeat Shuffle All</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Thời gian ph&aacute;t li&ecirc;n tục: 18 giờ (128kbps)</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Số b&agrave;i h&aacute;t lưu trữ: 970 (128kbps)</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Thời gian thu &acirc;m tối đa: 64 giờ 40 ph&uacute;t</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Hỗ trợ định dảng file: MP3, WMA</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Thời gian sạc pin: Khoảng 70 ph&uacute;t (sạc đầy)</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Ng&otilde; Input / Output: Tai nghe / USB tốc độ cao (2.0)</li>
	<li style="&quot;&quot;margin-left:&quot;">
		Điện năng nguồn ph&aacute;t tối đa (16 ohms/mW): 5+5mW</li>
	<li style="&quot;&quot;margin-left:&quot;">
		K&iacute;ch thước tối đa (Rộng x Cao x D&agrave;y): 89.2 x 24.0 x 15.0mm</li>
	<li style="&quot;&quot;margin-left:&quot;">
		C&oacute; 5 m&agrave;u: đen, xanh, hồng, đỏ, đồng</li>
</ul>
', NULL, 1490000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'14', N'7', N'3', N'14', N'SONY NWZ-B173F/LCE', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: SONY NWZ-B173F/LCE</li>
	<li>
		M&agrave;u sắc: Xanh</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN MP3 &amp; MP4</strong></p>
<ul>
	<li>
		Bộ nhớ trong MP3-MP4: 4 GB&nbsp;</li>
	<li>
		Loại m&agrave;n h&igrave;nh: LCD hiển thị 3 d&ograve;ng</li>
	<li>
		Số b&agrave;i h&aacute;t lưu trữ: 970 (128kbps)</li>
	<li>
		Định dạng file nhạc: MP3, WMA</li>
	<li>
		Đ&agrave;i FM: C&oacute;</li>
	<li>
		Kết nối: USB</li>
</ul>
<p>
	<strong>KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		Khối lượng: 28 gram</li>
	<li>
		K&iacute;ch thước: 89.2x24x15 mm</li>
</ul>
<p>
	<strong>TH&Ocirc;NG TIN KH&Aacute;C</strong></p>
<ul>
	<li>
		T&iacute;nh năng chọn b&agrave;i th&ocirc;ng minh ZAPPIN&trade; gi&uacute;p bạn t&igrave;m kiếm b&agrave;i nhạc dễ d&agrave;ng</li>
	<li>
		T&iacute;ch hợp ng&otilde; USB gi&uacute;p chuyển tải nội dung dễ d&agrave;ng</li>
	<li>
		Thu s&oacute;ng FM, thu &acirc;m giọng n&oacute;i v&agrave; đ&agrave;i FM</li>
	<li>
		M&agrave;n h&igrave;nh hiển thị: LCD hiển thị 3 d&ograve;ng</li>
	<li>
		Chức năng Bass Boost _ Tăng cường &acirc;m Bass</li>
	<li>
		Sạc nhanh _ Sạc 3 ph&uacute;t nghe trong 90 ph&uacute;t</li>
	<li>
		Mang đi bất cứ nơi đ&acirc;u bạn muốn bằng kẹp &aacute;o linh hoạt.</li>
	<li>
		Đ&egrave;n nguồn h&ograve;a quyện c&ugrave;ng m&agrave;u m&aacute;y_Đ&egrave;n LED sẽ nhấp nh&aacute;y theo điệu nhạc của bạn.</li>
	<li>
		C&agrave;i đặt &acirc;m thanh: Bass Boost / 5 Band Equalizer (Heavy / Pop / Jazz / Unique / Custom)</li>
	<li>
		Phương ph&aacute;p t&igrave;m kiếm: All Songs / Album / Artist / Genre / Release Year / Playlists / Folder / ZAPPIN&trade; (Short / Long)</li>
	<li>
		Chế độ ph&aacute;t: Normal / Repeat All / Repeat 1 Song / Repeat Shuffle All</li>
	<li>
		Thời gian ph&aacute;t li&ecirc;n tục: 18 giờ (128kbps)</li>
	<li>
		Số b&agrave;i h&aacute;t lưu trữ: 970 (128kbps)</li>
	<li>
		Thời gian thu &acirc;m tối đa: 64 giờ 40 ph&uacute;t</li>
	<li>
		Hỗ trợ định dảng file: MP3, WMA</li>
	<li>
		Thời gian sạc pin: Khoảng 70 ph&uacute;t (sạc đầy)</li>
	<li>
		Ng&otilde; Input / Output: Tai nghe / USB tốc độ cao (2.0)</li>
	<li>
		Điện năng nguồn ph&aacute;t tối đa (16 ohms/mW): 5+5mW</li>
	<li>
		K&iacute;ch thước tối đa (Rộng x Cao x D&agrave;y): 89.2 x 24.0 x 15.0mm</li>
	<li>
		Trọng lượng: 28g</li>
	<li>
		C&oacute; 5 m&agrave;u: đen, xanh, hồng, đỏ, đồng</li>
</ul>
', NULL, 1490000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'15', N'6', N'3', N'15', N'Sony ICD-UX533F', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Thiết kế mỏng với 5 m&agrave;u lựa chọn</li>
	<li>
		USB trực tiếp (dạng trược, lưu trữ v&agrave; sạc)</li>
	<li>
		Bộ nhớ trong 4GB với khe cắm thẻ nhớ micro SDmở rộng</li>
	<li>
		Ph&aacute;t c&aacute;c định dạng MP3/AAC/WMA/WAV/Music</li>
	<li>
		Ph&aacute;t v&agrave; ghi &acirc;m FM</li>
	<li>
		Loa &acirc;m thanh lớn</li>
</ul>
<p>
	<strong>TH&Ocirc;NG SỐ KỸ THUẬT</strong></p>
<ul>
	<li>
		Bộ nhớ trong: 4GB</li>
	<li>
		Kết nối m&aacute;y t&iacute;nh: C&oacute;</li>
	<li>
		Định dạng ghi &acirc;m: Linear PCM/MP3</li>
	<li>
		Chuẩn ph&aacute;t: MP3/AAC/WMA/WAV</li>
	<li>
		Tập tin/Thư mục: 4074/400 (199 tập tin trong 01 thư mực)</li>
	<li>
		Ng&otilde; cắm tai nghe: C&oacute;</li>
	<li>
		Ng&otilde; cắm Micro: C&oacute;</li>
	<li>
		Phần mềm k&egrave;m theo: Pin sạc NH-AAA x 1, Ứng dụng phần mềm &#39;Sound Organizer&#39;</li>
	<li>
		Tự chọn chế độ ghi &acirc;m</li>
	<li>
		Tự động ghi &acirc;m theo giọng n&oacute;i (VOR)</li>
	<li>
		Bộ lọc &acirc;m tần số thấp</li>
	<li>
		Quản l&yacute; cường độ &acirc;m thanh kỹ thuật số</li>
	<li>
		Bắt đ&agrave;i FM</li>
	<li>
		Đ&aacute;nh dấu đoạn ghi &acirc;m</li>
	<li>
		Li&ecirc;n kết ghi &acirc;m</li>
	<li>
		Nguồn ph&aacute;t loa ngo&agrave;i: 90mW</li>
	<li>
		K&iacute;ch thước loa: 20mm</li>
	<li>
		Tần số đ&aacute;p ứng
		<ul>
			<li>
				LPCM (44.1kHz, 16-bit): 50 - 20,000 Hz</li>
			<li>
				MP3 8kbps (monorual): 60 - 3,400 Hz</li>
			<li>
				MP3 48kbps (monorual): 50 - 14,000 Hz</li>
			<li>
				MP3 128kbps: 50 - 16,000 Hz</li>
			<li>
				MP3 192kbps: 50 - 20,000 Hz</li>
		</ul>
	</li>
	<li>
		Thời gian ghi &acirc;m
		<ul>
			<li>
				LPCM (44.1kHz, 16-bit): 6 giờ</li>
			<li>
				MP3 8kbps (monorual): 1073 giờ</li>
			<li>
				MP3 48kbps (monorual): 178 giờ</li>
			<li>
				MP3 128kbps: 67 giờ</li>
			<li>
				MP3 192kbps: 44 giờ 40 ph&uacute;t</li>
		</ul>
	</li>
	<li>
		Loại pin: pin sạc AAA</li>
	<li>
		Kich thước (Rộng x Cao x D&agrave;y): 36.6 x 102.0 x 13.9 mm</li>
	<li>
		Khối lượng (bao gồm pin): 58g (Bao gồm Pin sạc NH-AAA x 1)</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 2500000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'16', N'6', N'3', N'16', N'SONY ICD-BX112/C E', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: SONY ICD-BX112/C E</li>
	<li>
		M&agrave;u sắc: Bạc</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<h2>
	&nbsp;</h2>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y GHI &Acirc;M</strong></p>
<ul>
	<li>
		Bộ nhớ trong: 2 GB</li>
	<li>
		Định dạng ghi &acirc;m: MP3</li>
	<li>
		Tự động ghi &acirc;m theo giọng n&oacute;i (VOR): C&oacute;</li>
	<li>
		Loại pin: Alkaline AAA</li>
</ul>
<p>
	<strong>THỜI GIAN GHI &Acirc;M</strong></p>
<ul>
	<li>
		LP: 534 giờ 25 ph&uacute;t (8kbps)</li>
	<li>
		SP: 89 giờ (48kbps)</li>
	<li>
		HQ: 33 giờ 20 ph&uacute;t (128kbps)</li>
	<li>
		Chế độ SHQ: &nbsp;22 giờ 15 ph&uacute;t (192kbps)</li>
</ul>
<p>
	<strong>INPUT/OUTPUT &amp; GHI &Acirc;M</strong></p>
<ul>
	<li>
		Ng&otilde; cắm Micro: C&oacute;</li>
	<li>
		Ng&otilde; cắm Tai nghe: &nbsp;C&oacute;</li>
	<li>
		Cổng USB: Kh&ocirc;ng</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước: 37.5x114x20.9 mm</li>
	<li>
		Khối lượng: 73 gram</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 1400000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'17', N'8', N'3', N'17', N'SONY KDL 55''''', N'<p>
	<strong>MODEL</strong></p>
<ul>
	<li>
		Độ lớn m&agrave;n h&igrave;nh LCD: 55&quot; (139cm), 16:9</li>
	<li>
		Hệ TV Digital: DVB-T Analog: B/G, D/K, I,L,M</li>
	<li>
		Hệ m&agrave;u: NTSC 3.58, NTSC 4.43, PAL, SECAM</li>
	<li>
		T&iacute;n hiệu Video: 480/60i, 480/60p, 576/50i, 576/50p, 720/50p, 720/60p, 1080/50i, 1080/60i, 1080/24p (HDMI&trade; only), 1080/50p (HDMI&trade; / Component), 1080/60p (HDMI&trade; / Component).</li>
</ul>
<p>
	<strong>PICTURE</strong></p>
<ul>
	<li>
		Độ ph&acirc;n giải: Full HD 1080 (1920 x 1080)</li>
	<li>
		Xử l&yacute; h&igrave;nh ảnh: Bộ xử l&yacute; h&igrave;nh ảnh vượt trội X-Reality PRO</li>
	<li>
		Motionflow&trade;: Chuyển động muợt m&agrave; tối ưu Motionflow&trade; XR 800</li>
	<li>
		C&ocirc;ng nghệ đ&egrave;n nền: C&ocirc;ng nghệ đ&egrave;n nền Dynamic Edge LED</li>
	<li>
		Tối ưu độ tương phản OptiContrast Panel</li>
	<li>
		Live Colour&trade; (m&agrave;u sắc sống động)</li>
	<li>
		M&agrave;u sắc s&acirc;u thẳm &nbsp; &nbsp;</li>
	<li>
		Giảm nhiễu MPEG th&ocirc;ng minh &nbsp; &nbsp;</li>
	<li>
		T&iacute;nh năng tăng cường độ tương phản cao cấp (ACE)</li>
	<li>
		Chế độ xem phim 24P True Cinema&trade;</li>
	<li>
		PhotoTV HD</li>
	<li>
		G&oacute;c nh&igrave;n: 178&deg; (Phải/Tr&aacute;i), 178&deg; (L&ecirc;n/Xuống)</li>
	<li>
		Chế độ m&agrave;n h&igrave;nh TV: Full/ Normal/ Wide Zoom/ Zoom/ Caption/ 14:9, PC: Full 1/ Full 2/ Normal</li>
	<li>
		Chế độ h&igrave;nh ảnh: Vivid/ Standard/ Custom/ Cinema/ Game-Standard/ Game-Original/ Graphics/ Sports/ Animation/ Photo-Vivid/ Photo-Standard/ Photo-Original/ Photo-Custom</li>
	<li>
		CineMotion/Film Mode/Cinema Drive</li>
	<li>
		Bộ lọc lược 3D</li>
	<li>
		<strong>3D</strong></li>
	<li>
		T&iacute;n hiệu 3D</li>
	<li>
		3D giả lập &nbsp; &nbsp;</li>
</ul>
<p>
	<b>&Acirc;M THANH</b></p>
<ul>
	<li>
		Chế độ &acirc;m thanh: Dynamic/ Standard/ Clear Voice</li>
	<li>
		Chế độ &acirc;m thanh v&ograve;m: Cinema/ Music/ Sports/ Game</li>
	<li>
		Tăng cường &acirc;m thanh</li>
	<li>
		S-Master</li>
	<li>
		&Acirc;m thanh S-Force: Giả lập &acirc;m thanh v&ograve;m 3D (S-Force Front Surround 3D)</li>
	<li>
		Dolby&reg;: Dolby&reg; Digital/ Dolby&reg; Digital Plus/ Dolby&reg; Pulse</li>
	<li>
		Simulated Stereo</li>
	<li>
		&Acirc;m thanh Stereo: NICAM/ A2</li>
	<li>
		C&ocirc;ng suất &acirc;m thanh: 30W (10W x 3)</li>
</ul>
<p>
	<strong>C&Aacute;C NG&Otilde; CẮM</strong></p>
<ul>
	<li>
		HDMI&trade; / ng&otilde; v&agrave;o &acirc;m thanh: 4 (2 b&ecirc;n h&ocirc;ng/ 2 ph&iacute;a dưới)</li>
	<li>
		USB 2.0: 2 (b&ecirc;n h&ocirc;ng TV)</li>
	<li>
		Kết nối Ethernet: 1 (ph&iacute;a dưới)</li>
	<li>
		Ng&otilde; video composite: 2 (1 ph&iacute;a sau/1 ph&iacute;a sau chung với Composite)</li>
	<li>
		Ng&otilde; video component (Y/Pb/Pr): 1 (Ph&iacute;a sau chung với Composite)</li>
	<li>
		Ng&otilde; ăngten RF: 1 (ph&iacute;a dưới)</li>
	<li>
		Cổng v&agrave;o &acirc;m thanh: 3 (2 ph&iacute;a sau/1 b&ecirc;n h&ocirc;ng)</li>
	<li>
		Ng&otilde; ra &acirc;m thanh KTS: 1 (ph&iacute;a dưới)</li>
	<li>
		Ng&otilde; ra &acirc;m thanh: 1 (b&ecirc;n h&ocirc;ng) Hybrid w/HP</li>
	<li>
		Ng&otilde; ra tai nghe: 1 (b&ecirc;n h&ocirc;ng/chung với ng&otilde; ra &acirc;m thanh Audio Out)</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		Kết nối đồng bộ BRAVIA Sync</li>
	<li>
		Ph&aacute;t qua USB: (Video, Music, Photo) (USB hỗ trợ xem FAT16, FAT32 v&agrave; exFAT)</li>
	<li>
		Chia sẻ phim, h&igrave;nh ảnh với DLNA</li>
	<li>
		Photo MAP</li>
	<li>
		B&agrave;n ph&iacute;m từ xa (VAIO)</li>
	<li>
		Chế độ khung ảnh</li>
	<li>
		Lựa chọn khung cảnh Photo/ Music/ Cinema/ Game/ Graphics/ Sports/ Animation</li>
	<li>
		Kh&oacute;a trẻ em</li>
	<li>
		M&atilde; kh&oacute;a</li>
	<li>
		Hẹn giờ tắt</li>
	<li>
		Hẹn giờ Tắt/Mở</li>
	<li>
		Teletext C&oacute; (2000 trang)</li>
	<li>
		PAP (h&igrave;nh v&agrave; h&igrave;nh) PAP (t&ugrave;y biến)</li>
	<li>
		Ng&ocirc;n ngữ hiển thị English, Simplified Chinese, French, Russian, Arabic, Persian, Thai, Vietnamese</li>
	<li>
		Xoay / nghi&ecirc;ng C&oacute; (Tr&aacute;i 15&deg;/ Phải 15&deg;) / C&oacute; (0&deg;-6&deg;)</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG NỐI MẠNG</strong></p>
<ul>
	<li>
		&nbsp;Kết nối Wi-Fi: T&iacute;ch hợp Wi-Fi</li>
	<li>
		Kết nối kh&ocirc;ng d&acirc;y trực tiếp</li>
	<li>
		Hỗ trợ Skype&trade;</li>
	<li>
		TrackID&trade;</li>
	<li>
		T&igrave;m video</li>
	<li>
		Điều khiển phương tiện &nbsp; &nbsp;</li>
</ul>
<p>
	<strong>Sony Entertainment Network</strong></p>
<ul>
	<li>
		&nbsp;Internet Video</li>
	<li>
		Facebook v&agrave; Twitter</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG BẢO VỆ M&Ocirc;I TRƯỜNG</strong></p>
<ul>
	<li>
		Điều chỉnh &aacute;nh s&aacute;ng nền sống động</li>
	<li>
		Chế độ tắt đ&egrave;n nền</li>
	<li>
		Cảm biến &aacute;nh s&aacute;ng</li>
	<li>
		Chất liệu bao b&igrave;: Giấy t&aacute;i sinh (hơn 70%)</li>
</ul>
<p>
	<strong>GENERAL</strong></p>
<ul>
	<li>
		Điện năng y&ecirc;u cầu AC: 110-240V, 50/60Hz</li>
	<li>
		Điện năng ti&ecirc;u thụ: 150W (khi hoạt động)</li>
	<li>
		K&iacute;ch thước (rộng x cao x s&acirc;u) c&oacute; kệ: 1274 x 808 x 341 mm</li>
	<li>
		K&iacute;ch thước (rộng x cao x s&acirc;u) kh&ocirc;ng c&oacute; kệ: 1274 x 750 x 35(32) mm</li>
	<li>
		Trọng lượng c&oacute; kệ: 26.2 Kg</li>
	<li>
		Trọng lượng kh&ocirc;ng c&oacute; kệ: 21.7 Kg</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 52900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'18', N'8', N'3', N'18', N'SONY KDL 40'''' HX750', N'<p>
	<strong>MODEL</strong></p>
<ul>
	<li>
		Độ lớn m&agrave;n h&igrave;nh LCD: M&agrave;n h&igrave;nh 40-inch (102cm), theo tỷ lệ 16:9</li>
	<li>
		Hệ TV:&nbsp;Analog: B/G, D/K, I, L, M</li>
	<li>
		Hệ m&agrave;u: NTSC 3.58, NTSC 4.43, PAL, SECAM</li>
	<li>
		T&iacute;n hiệu Video: 480/60i, 480/60p, 576/50i, 576/50p, 720/50p, 720/60p, 1080/50i, 1080/60i; 720/24p, 720/30p, 1080/24p, 1080/30p (HDMI&trade; only); 1080/50p, 1080/60p (HDMI&trade; / Component)</li>
</ul>
<p>
	<strong>PICTURE</strong></p>
<ul>
	<li>
		Độ ph&acirc;n giải: Full HD</li>
	<li>
		Xử l&yacute; h&igrave;nh ảnh: Bộ xử l&yacute; h&igrave;nh ảnh vượt trội X-Reality PRO</li>
	<li>
		Motionflow&trade;: Chuyển động muợt m&agrave; tối ưu Motionflow&trade; XR 400</li>
	<li>
		C&ocirc;ng nghệ đ&egrave;n nền: C&ocirc;ng nghệ đ&egrave;n nền Dynamic Edge LED</li>
	<li>
		Tối ưu độ tương phản OptiContrast Panel</li>
	<li>
		Live Colour&trade;:&nbsp;C&oacute;</li>
	<li>
		M&agrave;u sắc s&acirc;u thẳm:&nbsp;C&oacute;</li>
	<li>
		Giảm nhiễu MPEG th&ocirc;ng minh:&nbsp;C&oacute;</li>
	<li>
		T&iacute;nh năng tăng cường độ tương phản cao cấp (ACE):&nbsp;C&oacute;</li>
	<li>
		Chế độ xem phim 24P True Cinema&trade;:&nbsp;C&oacute;</li>
	<li>
		PhotoTV HD:&nbsp;C&oacute;</li>
	<li>
		G&oacute;c nh&igrave;n: 178&deg; (Phải/Tr&aacute;i), 178&deg; (L&ecirc;n/Xuống)</li>
	<li>
		Chế độ m&agrave;n h&igrave;nh TV:TV: Full/ Normal/ Wide Zoom/ Zoom/ Caption/ 14:9, PC: Full 1/ Full 2/ Normal</li>
	<li>
		Chế độ h&igrave;nh ảnh: Vivid/ Standard/ Custom/ Cinema 1/ Cinema 2/ Game-Standard/ Game-Original/ Graphics/ Sports/ Animation/ Photo-Vivid/ Photo-Standard/ Photo-Original/ Photo-Custom</li>
	<li>
		CineMotion/Film Mode/Cinema Drive:&nbsp;C&oacute;</li>
	<li>
		Bộ lọc lược 3D:&nbsp;C&oacute;</li>
	<li>
		3D:&nbsp;Active</li>
	<li>
		T&iacute;n hiệu 3D:&nbsp;C&oacute;</li>
	<li>
		3D giả lập:&nbsp;C&oacute;</li>
</ul>
<p>
	<b>&Acirc;M THANH</b></p>
<ul>
	<li>
		Chế độ &acirc;m thanh: Dynamic/ Standard/ Clear Voice</li>
	<li>
		Chế độ &acirc;m thanh v&ograve;m: Cinema/ Music/ Sports/ Game</li>
	<li>
		Tăng cường &acirc;m thanh:&nbsp;C&oacute;</li>
	<li>
		S-Master:&nbsp;C&oacute;</li>
	<li>
		&Acirc;m thanh S-Force: Giả lập &acirc;m thanh v&ograve;m 3D (S-Force Front Surround 3D)</li>
	<li>
		Dolby&reg;: Dolby&reg; Digital/ Dolby&reg; Digital Plus/ Dolby&reg; Pulse</li>
	<li>
		Simulated Stereo:&nbsp;C&oacute;</li>
	<li>
		&Acirc;m thanh Stereo: NICAM/ A2</li>
	<li>
		C&ocirc;ng suất &acirc;m thanh: 20W (10W x 3)</li>
</ul>
<p>
	<strong>C&Aacute;C NG&Otilde; CẮM</strong></p>
<ul>
	<li>
		HDMI&trade; / ng&otilde; v&agrave;o &acirc;m thanh: 4 (2 b&ecirc;n h&ocirc;ng/ 2 ph&iacute;a dưới)</li>
	<li>
		USB 2.0: 2 (b&ecirc;n h&ocirc;ng TV)</li>
	<li>
		Kết nối Ethernet: 1 (ph&iacute;a dưới)</li>
	<li>
		Ng&otilde; video composite: 2 (1 ph&iacute;a sau/1 ph&iacute;a sau chung với Composite)</li>
	<li>
		Ng&otilde; video component (Y/Pb/Pr): 1 (Ph&iacute;a sau chung với Composite)</li>
	<li>
		Ng&otilde; ăngten RF: 1 (ph&iacute;a dưới)</li>
	<li>
		Cổng v&agrave;o &acirc;m thanh: 3 (2 ph&iacute;a sau/1 b&ecirc;n h&ocirc;ng)</li>
	<li>
		Ng&otilde; ra &acirc;m thanh KTS: 1 (ph&iacute;a dưới)</li>
	<li>
		Ng&otilde; ra &acirc;m thanh: 1 (b&ecirc;n h&ocirc;ng) Hybrid w/HP</li>
	<li>
		Ng&otilde; ra tai nghe: 1 (b&ecirc;n h&ocirc;ng/chung với ng&otilde; ra &acirc;m thanh Audio Out)</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		Kết nối đồng bộ BRAVIA Sync:&nbsp;C&oacute;</li>
	<li>
		Ph&aacute;t qua USB: C&oacute; (Video, Music, Photo) (USB hỗ trợ xem FAT16, FAT32 v&agrave; exFAT)</li>
	<li>
		Chia sẻ phim, h&igrave;nh ảnh với DLNA:&nbsp;C&oacute;</li>
	<li>
		Photo MAP:&nbsp;C&oacute;</li>
	<li>
		Chế độ khung ảnh:&nbsp;C&oacute;</li>
	<li>
		Lựa chọn khung cảnh Photo/ Music/ Cinema/ Game/ Graphics/ Sports/ Animation</li>
	<li>
		Kh&oacute;a trẻ em:&nbsp;C&oacute;</li>
	<li>
		M&atilde; kh&oacute;a:&nbsp;C&oacute;</li>
	<li>
		Hẹn giờ tắt:&nbsp;C&oacute;</li>
	<li>
		Hẹn giờ Tắt/Mở:&nbsp;C&oacute;</li>
	<li>
		Teletext C&oacute; (2000 trang)</li>
	<li>
		PAP (h&igrave;nh v&agrave; h&igrave;nh) PAP (t&ugrave;y biến)</li>
	<li>
		Ng&ocirc;n ngữ hiển thị: English, Simplified Chinese, Traditional Chinese, French, Russian, Arabic, Persian, Thai, Vietnamese, Portuguese, Swahili</li>
	<li>
		Xoay / nghi&ecirc;ng:&nbsp;C&oacute; (tr&aacute;i 15&deg;/ phải 15&deg;)/-</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG NỐI MẠNG</strong></p>
<ul>
	<li>
		Kết nối Wi-Fi: T&iacute;ch hợp Wi-Fi</li>
	<li>
		Kết nối kh&ocirc;ng d&acirc;y trực tiếp:&nbsp;C&oacute;</li>
	<li>
		Hỗ trợ Skype&trade;:&nbsp;C&oacute;</li>
	<li>
		TrackID&trade;:&nbsp;C&oacute;</li>
	<li>
		T&igrave;m video:&nbsp;C&oacute;</li>
	<li>
		Điều khiển phương tiện:&nbsp;C&oacute;&nbsp; &nbsp;</li>
</ul>
<p>
	<strong>Sony Entertainment Network</strong></p>
<ul>
	<li>
		Internet Video:&nbsp;C&oacute;</li>
	<li>
		Facebook v&agrave; Twitter:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG BẢO VỆ M&Ocirc;I TRƯỜNG</strong></p>
<ul>
	<li>
		Điều chỉnh &aacute;nh s&aacute;ng nền sống động:&nbsp;C&oacute;</li>
	<li>
		Chế độ tắt đ&egrave;n nền:&nbsp;C&oacute;</li>
	<li>
		Cảm biến &aacute;nh s&aacute;ng:&nbsp;C&oacute;</li>
	<li>
		Chất liệu bao b&igrave;: Giấy t&aacute;i sinh (hơn 70%)</li>
</ul>
<p>
	<strong>GENERAL</strong></p>
<ul>
	<li>
		Điện năng y&ecirc;u cầu AC: AC 110-240V, 50/60Hz</li>
	<li>
		Điện năng ti&ecirc;u thụ: 116W (Ở chế độ hoạt động)</li>
	<li>
		K&iacute;ch thước (rộng x cao x s&acirc;u) c&oacute; kệ: 943 x 613 x 232 mm</li>
	<li>
		K&iacute;ch thước (rộng x cao x s&acirc;u) kh&ocirc;ng c&oacute; kệ: 943 x 576 x 59(46.1) mm</li>
	<li>
		Trọng lượng c&oacute; kệ: 14.3kg</li>
	<li>
		Trọng lượng kh&ocirc;ng c&oacute; kệ: 11.8kg</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 20000000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'19', N'8', N'3', N'19', N'SONY KLV-46BX450', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: SONY KLV-46BX450 ME6</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
	<li>
		Ti&ecirc;u chuẩn: Ch&iacute;nh H&atilde;ng</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG CHUNG LCD</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh LCD: LCD</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh LCD (inches): 46</li>
	<li>
		Độ ph&acirc;n giải LCD (pixels): Full HD</li>
	<li>
		Tỉ lệ m&agrave;n h&igrave;nh: 16:9</li>
	<li>
		G&oacute;c nh&igrave;n (độ): 178&deg;(Phải/Tr&aacute;i), 178&deg;(L&ecirc;n/Xuống)</li>
</ul>
<p>
	<strong>&Acirc;M THANH LCD</strong></p>
<ul>
	<li>
		C&ocirc;ng suất loa: 8Wx2</li>
	<li>
		Hệ thống loa: 2</li>
	<li>
		Hệ thống &acirc;m thanh: Dynamic / Standard / Clear Voice</li>
	<li>
		Chế độ &acirc;m thanh: Cinema/ Music/ Sports/ Game</li>
</ul>
<p>
	<strong>KẾT NỐI LCD</strong></p>
<ul>
	<li>
		Cổng HDMI: 2</li>
	<li>
		Cổng Composite: 1</li>
	<li>
		Cổng Component: 1</li>
	<li>
		Cổng PC: 1</li>
	<li>
		Cổng AV: Cổng v&agrave;o &acirc;m thanh: 3 - Ng&otilde; ra &acirc;m thanh:1 - Ng&otilde; ra tai nghe: 1</li>
	<li>
		Cổng USB: 1</li>
</ul>
<p>
	<strong>C&Aacute;C T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		Bắt đ&agrave;i FM: C&oacute;</li>
	<li>
		Điện năng ti&ecirc;u thụ (LCD): 140.12W (ở chế độ hoạt động)</li>
	<li>
		Hẹn giờ bật/tắt: C&oacute;</li>
	<li>
		Remote control: RM-GA021</li>
	<li>
		C&ocirc;ng&nbsp;nghệ h&igrave;nh ảnh vượt trội&nbsp;BRAVIA Engine&nbsp;3&trade;:&nbsp;C&oacute;</li>
	<li>
		C&ocirc;ng nghệ n&acirc;ng cao h&igrave;nh ảnh với Clear resolution enhancer:&nbsp;C&oacute;</li>
	<li>
		Chất lượng h&igrave;nh ảnh Full HD: C&oacute;</li>
	<li>
		Kết nối đồng bộ BRAVIA Sync:&nbsp;C&oacute;</li>
	<li>
		Ph&aacute;t qua USB (xem phim, nghe nhạc, xem h&igrave;nh):&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước: C&oacute; kệ: 1112x713x278 mm - Kh&ocirc;ng kệ: 1112x675x97(90) mm</li>
	<li>
		Khối lượng: C&oacute; kệ: Khoảng 18.4kg - Kh&ocirc;ng kệ: 17.3 kg</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 17000000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'2', N'2', N'3', N'2', N'Sony Xperia Z', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 01 năm 2013</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;139 x 71 x 7.9 mm</li>
	<li>
		Trọng lượng:&nbsp;146 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung TFT, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;1080 x 1920 pixels, 5.0 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 10 ng&oacute;n tay)</li>
			<li>
				Sony Mobile BRAVIA Engine 2</li>
			<li>
				Timescape UI</li>
			<li>
				Mặt k&iacute;nh chống trầy xước v&agrave; chống thấm</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;16 GB, 2GB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;microSD (TransFlash) hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 107 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 296 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, 42 Mbps; HSUPA, 5.8 Mbps</li>
	<li>
		NFC:&nbsp;C&oacute;</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v4.0 với A2DP</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0 (MHL)</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;13 MP, 4128x3096 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt, chống rung, HDR, chụp to&agrave;n cảnh</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 1080p@30fps, tự động lấy n&eacute;t li&ecirc;n tục, video light, chống rung, HDR</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, 2.2 MP, 1080p@30fps</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.1.2 (Jelly Bean), n&acirc;ng cấp l&ecirc;n v4.2 (Jelly Bean)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Quad-core 1.5 GHz Krait, Adreno 320 GPU</li>
	<li>
		Chipset:&nbsp;Qualcomm MDM9215M / APQ8064</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5</li>
	<li>
		Radio:&nbsp;Stereo FM radio với RDS</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Trắng, T&iacute;m</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS v&agrave; GLONASS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				Khả năng chống bụi v&agrave; nước đạt chứng chỉ IP57- Khả năng chống nước ở độ s&acirc;u 1m trong 30 ph&uacute;</li>
			<li>
				Sử dụng micro-Sim</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Xem / Chỉnh sửa h&igrave;nh ảnh</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 2330 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 550 giờ (2G) / 530 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:&nbsp;L&ecirc;n đến 11 giờ (2G) / 14 giờ (3G)<br />
		Nghe nhạc l&ecirc;n đến 40 giờ</li>
</ul>
', NULL, 14900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'20', N'6', N'3', N'20', N'SONY ICD-UX523F', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: SONY ICD-UX523F/SCE</li>
	<li>
		M&agrave;u sắc: Bạc.</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<h2>
	&nbsp;</h2>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y GHI &Acirc;M</strong></p>
<h2>
	&nbsp;</h2>
<ul>
	<li>
		Bộ nhớ trong : 4 GB</li>
	<li>
		Định dạng ghi &acirc;m : WAV / MP3 / WMA / AAC</li>
	<li>
		Tự động ghi &acirc;m theo giọng n&oacute;i (VOR) : C&oacute;</li>
	<li>
		M&agrave;n h&igrave;nh hiển thị : C&oacute;</li>
	<li>
		Loại pin : Pin sạc NH-AAA</li>
</ul>
<p>
	<strong>INPUT/OUTPUT &amp; GHI &Acirc;M</strong></p>
<h2>
	&nbsp;</h2>
<ul>
	<li>
		Ng&otilde; cắm Micro : C&oacute;</li>
	<li>
		Ng&otilde; cắm Tai nghe : C&oacute;</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<h2>
	&nbsp;</h2>
<ul>
	<li>
		K&iacute;ch thước : 36.6x102x13.7 mm</li>
	<li>
		Khối lượng : 58 gram</li>
</ul>
', NULL, 2300000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'21', N'5', N'3', N'21', N'SONY HDRXR160E', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY HDRXR160E/BC E35</li>
	<li>
		M&agrave;u sắc : Đen</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại lưu trữ : Hard Disk Drive</li>
	<li>
		Bộ nhớ trong : 160 GB</li>
	<li>
		Thẻ nhớ tương th&iacute;ch : Memory Stick / SD / SDH</li>
	<li>
		Zoom quang học : 30x</li>
	<li>
		Zoom kỹ thuật số : 350x</li>
	<li>
		Chế độ quay : Full HD</li>
	<li>
		Độ ph&acirc;n giải : 1920x1080 pixels</li>
	<li>
		Định dạng file h&igrave;nh : JPEG</li>
	<li>
		Định dạng Video : MPEG4-AVC/H.264 / MPEG2-PS</li>
	<li>
		&Acirc;m thanh : Dolby&reg; Digital 5.1ch</li>
	<li>
		Loại Pin : NP-FV50</li>
</ul>
<p>
	<strong>CẢM BIẾN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Bộ xử l&yacute;: Exmor R</li>
	<li>
		Loại cảm biến : CMOS</li>
	<li>
		K&iacute;ch thước cảm biến : 1/4&quot;</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh : Clear Photo LCD&trade;</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh : 3 inch</li>
	<li>
		Cảm Ứng : C&oacute;</li>
</ul>
<p>
	<strong>ỐNG K&Iacute;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại ống k&iacute;nh : Sony G</li>
	<li>
		Độ d&agrave;i ti&ecirc;u cự : 2.1 - 63 mm</li>
</ul>
<p>
	<strong>INPUT/OUTPUT M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Kết nối : AV / USB</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 59.5x66x117.5 mm</li>
	<li>
		Khối lượng: 350 gram (Chỉ t&iacute;nh ri&ecirc;ng th&acirc;n m&aacute;y)</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		Zoom quang học 30x</li>
	<li>
		Cảm biến &quot;Exmor R&quot; CMOS tiến tiến cho hiệu suất vượt trội ở những nơi thiếu s&aacute;ng</li>
	<li>
		Ống k&iacute;nh Sony G g&oacute;c rộng 29.8mm</li>
	<li>
		Ổ cứng l&ecirc;n đến 160GB cho ph&eacute;p ghi li&ecirc;n tục hơn 54 giờ với t&iacute;n hiệu HD (HD LP)</li>
	<li>
		Ổn định h&igrave;nh ảnh quang học SteadyShot chế độ Active</li>
	<li>
		M&agrave;n h&igrave;nh cảm ứng 3.0&rdquo; Clear Photo LCD Plus (230K điểm ảnh / Wide 16:9)</li>
	<li>
		Nhận diện khu&ocirc;n mặt</li>
	<li>
		Chức năng nhận diện nụ cười</li>
	<li>
		Định dạng &acirc;m thanh: Dolby Digital 5.1ch, Dolby Digital 5.1Creator / Dolby Digital 2ch Stereo, Dolby Digital Stereo Creator</li>
	<li>
		Chế độ chụp ban đ&ecirc;m Super NightShot Plus</li>
	<li>
		Chế độ khởi động nhanh (Quick On)</li>
	<li>
		Ch&eacute;p đĩa trực tiếp</li>
	<li>
		Hỗ trợ &aacute;nh s&aacute;ng nền(Auto)</li>
	<li>
		Phụ kiện đi k&egrave;m: AC adaptor, Bộ pin sạc NP-FV50, Cổng A/V, D&acirc;y AV, C&aacute;p USB, Đĩa phần mềm Picture Motion Browser</li>
	<li>
		Kết nối: AV/ USB 2.0/ Mini HDMI</li>
</ul>
', NULL, 13600000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'22', N'5', N'3', N'22', N'SONY DCR-PJ5E', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY DCR-PJ5E/BC E34</li>
	<li>
		M&agrave;u sắc : Đen</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại lưu trữ : Card memory</li>
	<li>
		Thẻ nhớ tương th&iacute;ch : SD / SDHC / SDXC / PRO Duo / PRO-HG Duo</li>
	<li>
		Zoom quang học : 57x</li>
	<li>
		Zoom kỹ thuật số : 1800x</li>
	<li>
		Định dạng Video : MPEG 2</li>
	<li>
		&Acirc;m thanh : Dolby&reg; Digital 2ch Stereo</li>
	<li>
		Loại Pin : NP-FV30</li>
</ul>
<p>
	<strong>CẢM BIẾN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Bộ xử l&yacute;: Sony Imaging Processor</li>
	<li>
		Loại cảm biến : CCD</li>
	<li>
		K&iacute;ch thước cảm biến : 1/8&quot;</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh : Clear Photo LCD&trade;</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh : 2.7 inch</li>
</ul>
<p>
	<strong>ỐNG K&Iacute;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại ống k&iacute;nh : Sony lens</li>
</ul>
<p>
	<strong>INPUT/OUTPUT M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Kết nối : AV / USB</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 58.5x55x124.5 mm</li>
	<li>
		Khối lượng: 230 gram (Chỉ t&iacute;nh ri&ecirc;ng th&acirc;n m&aacute;y)</li>
</ul>
', NULL, 7000000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'23', N'4', N'3', N'23', N'Sony Cyber-shot DSC-WX100', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li style="&quot;margin-left:">
		Zoom quang học 10x</li>
	<li style="&quot;margin-left:">
		Zoom h&igrave;nh ảnh r&otilde; n&eacute;t 20x</li>
	<li style="&quot;margin-left:">
		Zoom kỹ thuật số 40x</li>
	<li style="&quot;margin-left:">
		Bộ xử l&yacute; BIONZ</li>
	<li style="&quot;margin-left:">
		Ống k&iacute;nh G của Sony</li>
	<li style="&quot;margin-left:">
		Cảm biến Exmor R&trade; CMOS 1/2.3&quot; cho h&igrave;nh ảnh r&otilde; n&eacute;t ngay khi &aacute;nh s&aacute;ng yếu</li>
	<li style="&quot;margin-left:">
		M&agrave;n h&igrave;nh TFT LCD 2.7&quot; 460,800 điểm ảnh</li>
	<li style="&quot;margin-left:">
		Quay phim Full HD định dạng file AVCHD</li>
	<li style="&quot;margin-left:">
		Ổn định h&igrave;nh ảnh quang học SteadyShot</li>
	<li style="&quot;margin-left:">
		C&ocirc;ng nghệ bắt s&aacute;ng cao Extra High Sensitivity</li>
	<li style="&quot;margin-left:">
		Tự động lấy n&eacute;t nhanh với High-speed Auto Focus</li>
	<li style="&quot;margin-left:">
		9 chế độ hiệu ứng h&igrave;nh ảnh</li>
	<li style="&quot;margin-left:">
		ISO: Auto/ 100 - 12800</li>
	<li style="&quot;margin-left:">
		Chế độ Auto Macro</li>
	<li style="&quot;margin-left:">
		Nhận diện khu&ocirc;n mặt</li>
	<li style="&quot;margin-left:">
		Chụp ảnh Panorama, 3D</li>
	<li style="&quot;margin-left:">
		Thẻ nhớ tương th&iacute;ch: SD/ SDHC/ SDXC</li>
	<li style="&quot;margin-left:">
		Cổng kết nối: AV/ USB/ HDMI mini</li>
	<li style="&quot;margin-left:">
		Phụ kiện đi k&egrave;m: Bộ pin sạc NP-BN, C&aacute;p USB, D&acirc;y đeo tay</li>
	<li style="&quot;margin-left:">
		K&iacute;ch thước (rộng x cao x d&agrave;y): 92.3 x 52.4x 21.6mm</li>
	<li style="&quot;margin-left:">
		Trọng lượng: 124g</li>
	<li style="&quot;margin-left:">
		C&oacute; 3 m&agrave;u: bạc, đen, hồng</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 5700000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'24', N'4', N'3', N'24', N'Sony Cyber-shot DSC-W690', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; h&igrave;nh ảnh BIONZ</li>
	<li>
		Zoom quang học 10x ( trong khi quay phim)</li>
	<li>
		Cảm biến Super HAD CCD 1/2.3&quot;</li>
	<li>
		Ống k&iacute;nh G của Sony</li>
	<li>
		M&agrave;n h&igrave;nh TFT LCD 3.0&quot; 230,000 điểm ảnh</li>
	<li>
		Ổn định h&igrave;nh ảnh quang học SteadyShot</li>
	<li>
		ISO: Auto / 80 - 3200</li>
	<li>
		Chế độ Auto Macro</li>
	<li>
		Đ&egrave;n lấy n&eacute;t tự động: Auto / Off</li>
	<li>
		Nhận diện khu&ocirc;n mặt, nụ cười</li>
	<li>
		Chế độ tự động th&ocirc;ng minh</li>
	<li>
		4 chế độ hiệu ứng h&igrave;nh ảnh: Toy Camera, Pop Colour, Partial Colour, Soft High-key</li>
	<li>
		Thẻ nhớ tương th&iacute;ch: SD/ SDHC/ SDXC</li>
	<li>
		Chụp qu&eacute;t to&agrave;n cảnh Sweep Panorama 360 độ</li>
	<li>
		Chế độ chụp ảnh tự động th&ocirc;ng minh-Intelligent Auto</li>
	<li>
		Phụ kiện theo m&aacute;y: Bộ pin sạc NP-BN, C&aacute;p USB, D&acirc;y đeo tay</li>
	<li>
		Cổng kết nối: AV/ USB</li>
	<li>
		K&iacute;ch thước (rộng x cao x d&agrave;y): 94.3 X 56.1 X 21.7mm</li>
	<li>
		Trọng lượng: 142g</li>
	<li>
		C&oacute; 4 m&agrave;u: đen, bạc, xanh, đỏ</li>
</ul>
', NULL, 3690000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'25', N'1', N'3', N'25', N'SONY VAIO E Series SVE15117FGW', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY VAIO E Series - SVE15117FGW</li>
	<li>
		M&agrave;u sắc : Trắng</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:Moonly Center</li>
</ul>
<p>
	<strong>BỘ VI XỬ L&Yacute; LAPTOP - CPU</strong></p>
<ul>
	<li>
		Tốc độ CPU Laptop : Intel Core i5-2450M - 2.50 GHz (Up to 3.1 GHz with Turbo Boost)</li>
	<li>
		Bộ nhớ đệm CPU Laptop : 3 MB L3 Cache</li>
</ul>
<p>
	<strong>BỘ NHỚ LAPTOP - RAM</strong></p>
<ul>
	<li>
		Loại RAM Laptop : SDRAM DDR3</li>
	<li>
		Dung lượng RAM Laptop : 4 GB</li>
	<li>
		Tốc độ Bus RAM Laptop : 1333 MHz</li>
	<li>
		Số khe cắm RAM Laptop : 2</li>
	<li>
		Hổ trợ dung lượng tối đa RAM Laptop : 8 GB</li>
</ul>
<p>
	<strong>Ổ ĐĨA CỨNG LAPTOP - HDD</strong></p>
<ul>
	<li>
		Loại ổ đĩa HDD Laptop : SATA</li>
	<li>
		Dung lượng HDD Laptop : 640 GB</li>
	<li>
		Tốc độ quay HDD Laptop : 5400 rpm</li>
</ul>
<p>
	<strong>Ổ ĐĨA QUANG LAPTOP - ODD</strong></p>
<ul>
	<li>
		Loại ổ đĩa ODD Laptop : SuperMulti DVD+/-RW</li>
</ul>
<p>
	<strong>CARD ĐỒ HỌA LAPTOP - GRAPHICS</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; đồ họa Laptop : AMD Radeon HD 7650M</li>
	<li>
		Dung lượng graphics Laptop : 2 GB - DDR3</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH LAPTOP - DISPLAY</strong></p>
<ul>
	<li>
		Loại display Laptop : WXGA LED WIDE TFT</li>
	<li>
		K&iacute;ch thước display Laptop : 15.5 inch</li>
	<li>
		Độ ph&acirc;n giải display Laptop : 1366 x 768 Pixels</li>
</ul>
<p>
	<strong>&Acirc;M THANH LAPTOP - AUDIO</strong></p>
<ul>
	<li>
		Chip &acirc;m thanh Laptop : Intel High Definition Audio</li>
	<li>
		Chuẩn &acirc;m thanh Laptop : Clear Phase, xLOUD</li>
</ul>
<p>
	<strong>CAMERA LAPTOP</strong></p>
<ul>
	<li>
		WebCam Laptop: HD Exmor for PC - 1.31 MP - 1280 x 1024 Pixels</li>
</ul>
<p>
	<strong>KẾT NỐI MẠNG LAPTOP - NETWORK</strong></p>
<ul>
	<li>
		Chuẩn WiFi Laptop : IEEE 802.11 b/g/n</li>
	<li>
		LAN Laptop : 10 / 100 / 1000 Mbps</li>
</ul>
<p>
	<strong>CỔNG GIAO TIẾP LAPTOP - INTERFACES</strong></p>
<ul>
	<li>
		Cổng USB Laptop : USB 2.0 x 3 / USB 3.0 x 1</li>
	<li>
		Cổng VGA Laptop : x 1</li>
	<li>
		Cổng HDMI Laptop : x 1</li>
	<li>
		Headphones Laptop : x 1</li>
	<li>
		Microphone Laptop : x 1</li>
	<li>
		Bluetooth Laptop : 4.0 High Speed</li>
	<li>
		Card Reader Laptop : C&oacute;</li>
</ul>
<p>
	<strong>HỆ ĐIỀU H&Agrave;NH LAPTOP - OS</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh Laptop : Windows 7 Home Premium SP1 64 bit</li>
</ul>
<p>
	<strong>PIN LAPTOP - BATTERY</strong></p>
<ul>
	<li>
		Loại Pin Laptop : VGP-BPS26 Lithium-ion</li>
	<li>
		Thời gian sử dụng pin Laptop : Up to 2 - 3 hours</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 371.9x35.1x253.5 mm</li>
	<li>
		Khối lượng : 2.7 kg</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 17990000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'26', N'1', N'3', N'26', N'SONY VAIO S Series - SVS13123CVR', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY VAIO S Series - SVS13123CVR</li>
	<li>
		M&agrave;u sắc : Đỏ</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:Moonly Center</li>
</ul>
<p>
	<strong>BỘ VI XỬ L&Yacute; LAPTOP - CPU</strong></p>
<ul>
	<li>
		Tốc độ CPU Laptop : Intel Core i5-3210M - 2.50 GHz (Up to 3.1 GHz with Turbo Boost)</li>
	<li>
		Bộ nhớ đệm CPU Laptop : 3 MB L3 Cache</li>
</ul>
<p>
	<strong>BỘ NHỚ LAPTOP - RAM</strong></p>
<ul>
	<li>
		Loại RAM Laptop : SDRAM DDR3</li>
	<li>
		Dung lượng RAM Laptop : 4 GB</li>
	<li>
		Hổ trợ dung lượng tối đa RAM Laptop : 12 GB</li>
</ul>
<p>
	<strong>Ổ ĐĨA CỨNG LAPTOP - HDD</strong></p>
<ul>
	<li>
		Loại ổ đĩa HDD Laptop : SATA</li>
	<li>
		Dung lượng HDD Laptop : 500 GB</li>
	<li>
		Tốc độ quay HDD Laptop : 5400 rpm</li>
</ul>
<p>
	<strong>Ổ ĐĨA QUANG LAPTOP - ODD</strong></p>
<ul>
	<li>
		Loại ổ đĩa ODD Laptop : SuperMulti DVD</li>
</ul>
<p>
	<strong>CARD ĐỒ HỌA LAPTOP - GRAPHICS</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; đồ họa Laptop : Intel HD Graphics 4000</li>
	<li>
		Dung lượng graphics Laptop : Share</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH LAPTOP - DISPLAY</strong></p>
<ul>
	<li>
		Loại display Laptop : WXGA LED WIDE TFT</li>
	<li>
		K&iacute;ch thước display Laptop : 13.3 inch</li>
	<li>
		Độ ph&acirc;n giải display Laptop : 1366 x 768 Pixels</li>
</ul>
<p>
	<strong>&Acirc;M THANH LAPTOP - AUDIO</strong></p>
<ul>
	<li>
		Chuẩn &acirc;m thanh Laptop : Dolby Home Theater V4, Clear Phase, xLOUD</li>
</ul>
<p>
	<strong>CAMERA LAPTOP</strong></p>
<ul>
	<li>
		WebCam Laptop: HD Exmor for PC - 1.31 MP - 1280 x 1024 Pixels</li>
</ul>
<p>
	<strong>KẾT NỐI MẠNG LAPTOP - NETWORK</strong></p>
<ul>
	<li>
		Chuẩn WiFi Laptop : IEEE 802.11 a/b/g/n</li>
	<li>
		LAN Laptop : 10 / 100 / 1000 Mbps</li>
</ul>
<p>
	<strong>CỔNG GIAO TIẾP LAPTOP - INTERFACES</strong></p>
<ul>
	<li>
		Cổng USB Laptop : USB 2.0 x 1 / USB 3.0 x 2</li>
	<li>
		Cổng VGA Laptop : x 1</li>
	<li>
		Cổng HDMI Laptop : x 1</li>
	<li>
		Headphones Laptop : x 1</li>
	<li>
		Microphone Laptop : x 1</li>
	<li>
		Bluetooth Laptop : 4.0 High Speed</li>
	<li>
		Card Reader Laptop : C&oacute;</li>
</ul>
<p>
	<strong>HỆ ĐIỀU H&Agrave;NH LAPTOP - OS</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh Laptop : Windows 8 Single Language 64 bit</li>
</ul>
<p>
	<strong>PIN LAPTOP - BATTERY</strong></p>
<ul>
	<li>
		Loại Pin Laptop : VGP-BPS24 Lithium-ion</li>
	<li>
		Thời gian sử dụng pin Laptop : Up to 6 hours</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 331x23.9x224.6 mm</li>
	<li>
		Khối lượng : 1.72 kg</li>
</ul>
', NULL, 19000000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'27', N'1', N'3', N'27', N'SONY VAIO E Series - SVE15138CVS', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY VAIO E Series - SVE15138CVS</li>
	<li>
		M&agrave;u sắc : Bạc</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:Moonly Center</li>
</ul>
<p>
	<strong>BỘ VI XỬ L&Yacute; LAPTOP - CPU</strong></p>
<ul>
	<li>
		Tốc độ CPU Laptop : Intel Core i7-3632QM - 2.20 GHz (Up to 3.2 GHz with Turbo Boost)</li>
	<li>
		Bộ nhớ đệm CPU Laptop : 6 MB L3 Cache</li>
</ul>
<p>
	<strong>BỘ NHỚ LAPTOP - RAM</strong></p>
<ul>
	<li>
		Loại RAM Laptop : SDRAM DDR3</li>
	<li>
		Dung lượng RAM Laptop : 4 GB</li>
	<li>
		Hổ trợ dung lượng tối đa RAM Laptop : 8 GB</li>
</ul>
<p>
	<strong>Ổ ĐĨA CỨNG LAPTOP - HDD</strong></p>
<ul>
	<li>
		Loại ổ đĩa HDD Laptop : SATA</li>
	<li>
		Dung lượng HDD Laptop : 1 TB</li>
	<li>
		Tốc độ quay HDD Laptop : 5400 rpm</li>
</ul>
<p>
	<strong>Ổ ĐĨA QUANG LAPTOP - ODD</strong></p>
<ul>
	<li>
		Loại ổ đĩa ODD Laptop : SuperMulti DVD+/-RW</li>
</ul>
<p>
	<strong>CARD ĐỒ HỌA LAPTOP - GRAPHICS</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; đồ họa Laptop : AMD Radeon HD 7650M</li>
	<li>
		Dung lượng graphics Laptop : 2 GB - DDR3</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH LAPTOP - DISPLAY</strong></p>
<ul>
	<li>
		Loại display Laptop : WXGA LED WIDE TFT</li>
	<li>
		K&iacute;ch thước display Laptop : 15.5&nbsp;inch</li>
	<li>
		Độ ph&acirc;n giải display Laptop : 1366 x 768 Pixels</li>
</ul>
<p>
	<strong>&Acirc;M THANH LAPTOP - AUDIO</strong></p>
<ul>
	<li>
		Chip &acirc;m thanh Laptop : Intel High Definition Audio</li>
	<li>
		Chuẩn &acirc;m thanh Laptop : Clear Phase, xLOUD</li>
</ul>
<p>
	<strong>CAMERA LAPTOP</strong></p>
<ul>
	<li>
		WebCam Laptop: HD Exmor for PC - 1.31 MP - 1280 x 1024 Pixels</li>
</ul>
<p>
	<strong>KẾT NỐI MẠNG LAPTOP - NETWORK</strong></p>
<ul>
	<li>
		Chuẩn WiFi Laptop : IEEE 802.11 b/g/n</li>
	<li>
		LAN Laptop : 10 / 100 / 1000 Mbps</li>
</ul>
<p>
	<strong>CỔNG GIAO TIẾP LAPTOP - INTERFACES</strong></p>
<ul>
	<li>
		Cổng USB Laptop : USB 2.0 x 3 / USB 3.0 x 1</li>
	<li>
		Cổng VGA Laptop : x 1</li>
	<li>
		Cổng HDMI Laptop : x 1</li>
	<li>
		Headphones Laptop : x 1</li>
	<li>
		Microphone Laptop : x 1</li>
	<li>
		Bluetooth Laptop : 4.0 High Speed</li>
	<li>
		Card Reader Laptop : C&oacute;</li>
</ul>
<p>
	<strong>HỆ ĐIỀU H&Agrave;NH LAPTOP - OS</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh Laptop : Windows 8 Single Language 64 bit</li>
</ul>
<p>
	<strong>PIN LAPTOP - BATTERY</strong></p>
<ul>
	<li>
		Loại Pin Laptop : VGP-BPS24 Lithium-ion</li>
	<li>
		Thời gian sử dụng pin Laptop : Up to 3.5 hours</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 371.9x35.1x253.5 mm</li>
	<li>
		Khối lượng : 2.7 kg</li>
</ul>
', NULL, 21990000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'28', N'3', N'3', N'28', N'Sony Xperia Tablet S 3G 16GB', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 08 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;239.8 x 174.4 x 8.8 mm</li>
	<li>
		Trọng lượng:&nbsp;585 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung LED-backlit LCD, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;800 x 1280 pixels, 9.4 inches</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;Kh&ocirc;ng hỗ trợ</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Kh&ocirc;ng hỗ trợ</li>
	<li>
		Bộ nhớ trong:&nbsp;16 GB, 1GB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;SD, hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;C&oacute;</li>
	<li>
		EDGE:&nbsp;C&oacute;</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA 14.4 Mbps, HSUPA 5.76 Mbps</li>
	<li>
		NFC:&nbsp;Kh&ocirc;ng</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 a/b/g/n, dual-band, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v3.0 với A2DP</li>
	<li>
		Hồng ngoại:&nbsp;C&oacute;</li>
	<li>
		USB:&nbsp;C&oacute;, v2.0</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;8 MP, 3264x2448 pixels, autofocus</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 1080p@30fps</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, 1.0 MP, quay video 720p</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.0.3 (Ice Cream Sandwich)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Quad-core 1.3 GHz Cortex-A9, ULP GeForce GPU</li>
	<li>
		Chipset:&nbsp;Nvidia Tegra 3</li>
	<li>
		Tin nhắn:&nbsp;Email, Push Mail, IM, RSS</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML</li>
	<li>
		Radio:&nbsp;Kh&ocirc;ng</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen/Bạc</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				M&aacute;y t&iacute;nh bảng kh&ocirc;ng hỗ trợ cuộc gọi, gửi tin nhắn SMS, MMS</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Xem / Chỉnh sửa h&igrave;nh ảnh</li>
			<li>
				Ghi &acirc;m&nbsp;giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 6000 mAh</li>
	<li>
		Chờ: -</li>
	<li>
		Đ&agrave;m thoại: -</li>
</ul>
', NULL, 12990000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'29', N'2', N'3', N'29', N'Sony Xperia SL', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 08 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;128 x 64 x 10.6 mm</li>
	<li>
		Trọng lượng:&nbsp;144 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung LED-backlit LCD, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;720 x 1280 pixels, 4.3 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 10 ng&oacute;n tay)</li>
			<li>
				Ph&iacute;m điều khiển cảm ứng</li>
			<li>
				Sony Mobile BRAVIA Engine 2</li>
			<li>
				Timescape UI</li>
			<li>
				Mặt k&iacute;nh chống trầy xước v&agrave; chống thấm</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;32 GB, 1GB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;Kh&ocirc;ng</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 86 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 237 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, 42 Mbps; HSUPA, 5.8 Mbps</li>
	<li>
		NFC:&nbsp;C&oacute;</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v3.0 với A2DP, EDR</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0, hỗ trợ USB On-the-go</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;12 MP, 4000x3000 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, chụp to&agrave;n cảnh 3D, nhận diện khu&ocirc;n mặt, chống rung</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 1080p@30fps, lấy n&eacute;t li&ecirc;n tục, video light, chống rung</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, 1.3 MP, 720p@30fps</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.0.4 (Ice Cream Sandwich)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Dual-core 1.7 GHz, Adreno 220 GPU</li>
	<li>
		Chipset:&nbsp;Qualcomm MSM8260 Snapdragon</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5, Adobe Flash</li>
	<li>
		Radio:&nbsp;Stereo FM radio với RDS</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Trắng, Bạc, Hồng</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS v&agrave; GLONASS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				Chỉ hỗ trợ MicroSIM</li>
			<li>
				50 GB lưu trữ tr&ecirc;n đ&aacute;m m&acirc;y (giới hạn thời gian)</li>
			<li>
				TV launcher</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Cổng HDMI</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Google Search, Maps, Gmail, YouTube, Calendar, Google Talk</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1750 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 420 giờ</li>
	<li>
		Đ&agrave;m thoại:&nbsp;L&ecirc;n đến 8 giờ 30 ph&uacute;t<br />
		Nghe nhạc l&ecirc;n đến 25 giờ</li>
</ul>
', NULL, 11990000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'3', N'2', N'3', N'3', N'Sony Xperia V', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 1900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 08 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;129 x 65 x 10.7 mm</li>
	<li>
		Trọng lượng:&nbsp;120 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung TFT, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;720 x 1280 pixels, 4.3 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 10 ng&oacute;n tay)</li>
			<li>
				Ph&iacute;m điều khiển cảm ứng</li>
			<li>
				Timescape UI</li>
			<li>
				Mặt k&iacute;nh chống trầy xước v&agrave; chống thấm</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;8 GB, 1 GB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;microSD (TransFlash) hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;C&oacute;</li>
	<li>
		EDGE:&nbsp;C&oacute;</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, HSUPA</li>
	<li>
		NFC:&nbsp;C&oacute;</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v4.0 với A2DP</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0 (MHL)</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;13 MP, 4128x3096 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt v&agrave; nụ cười, chụp to&agrave;n cảnh 3D, chống rung</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 1080p@30fps, lấy n&eacute;t li&ecirc;n tục, video light, chống rung</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, VGA</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.0.4 (Ice Cream Sandwich), cập nhật l&ecirc;n v4.1</li>
	<li>
		Chipset:&nbsp;Qualcomm MSM8960</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5, Adobe Flash</li>
	<li>
		Radio:&nbsp;Kh&ocirc;ng</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Trắng, Hồng</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				Chứng nhận IP57 khả năng chống bụi v&agrave; nước</li>
			<li>
				Khả năng chống nước ở độ s&acirc;u 1 met trong 30 ph&uacute;t</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				TV-out (với MHL A/V)</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV</li>
			<li>
				Xem / Chỉnh sửa h&igrave;nh ảnh</li>
			<li>
				Xem văn bản</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1700 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 300 giờ (2G) / 400 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:L&ecirc;n đến 7 giờ (2G) / 7 giờ (3G)&nbsp;</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 13400000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'30', N'2', N'3', N'30', N'Sony Xperia P', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 02 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;122 x 59.5 x 10.5 mm</li>
	<li>
		Trọng lượng:&nbsp;120 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung TFT, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;540 x 960 pixels, 4.0 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 10 ng&oacute;n tay)</li>
			<li>
				Ph&iacute;m điều khiển cảm ứng</li>
			<li>
				Sony Mobile BRAVIA Engine</li>
			<li>
				Timescape UI</li>
			<li>
				Mặt k&iacute;nh chống trầy xước v&agrave; chống thấm</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3, WAV</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;16 GB, 1GB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;Kh&ocirc;ng</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;C&oacute;</li>
	<li>
		EDGE:&nbsp;C&oacute;</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA 14.4 Mbps, HSUPA 5.76 Mbps</li>
	<li>
		NFC:&nbsp;C&oacute;</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, Wi-Fi hotspot, DLNAx</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v2.1 với A2DP, EDR</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0, hỗ trợ USB On-the-go</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;8 MP, 3264x2448 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt, chống rung, HDR, chụp to&agrave;n cảnh</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 1080p@30fps, lấy n&eacute;t li&ecirc;n tục, video light</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, VGA</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v2.3 (Gingerbread), n&acirc;ng cấp l&ecirc;n v4.0</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Dual-core 1 GHz, STE U8500 chipset, DB8500 GPU</li>
	<li>
		Chipset:&nbsp;Mali-400</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5, Adobe Flash</li>
	<li>
		Radio:&nbsp;Stereo FM radio với RDS</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Bạc, Đỏ</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS v&agrave; GLONASS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Cổng HDMI</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1305 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 470 giờ (2G) / 475 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:&nbsp;L&ecirc;n đến 6 giờ (2G) / 5 giờ (3G)&nbsp;<br />
		Nghe nhạc l&ecirc;n đến 80 giờ</li>
</ul>
', NULL, 8900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'31', N'1', N'3', N'31', N'SONY VAIO DUO 11', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY VAIO DUO 11 - SVD11215CVB</li>
	<li>
		M&agrave;u sắc : Đen.</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>BỘ VI XỬ L&Yacute; LAPTOP - CPU</strong></p>
<ul>
	<li>
		Tốc độ CPU Laptop : Intel Core i5-3317U - 1.70 GHz (Up to 2.6 GHz with Turbo Boost)</li>
	<li>
		Bộ nhớ đệm CPU Laptop : 3 MB L3 Cache</li>
</ul>
<p>
	<strong>BỘ NHỚ LAPTOP - RAM</strong></p>
<ul>
	<li>
		Loại RAM Laptop : SDRAM DDR3</li>
	<li>
		Dung lượng RAM Laptop : 4 GB</li>
</ul>
<p>
	<strong>Ổ ĐĨA CỨNG - HDD</strong></p>
<ul>
	<li>
		Loại ổ đĩa HDD Laptop : SSD</li>
	<li>
		Dung lượng HDD Laptop : 128 GB</li>
</ul>
<p>
	<strong>CARD ĐỒ HỌA LAPTOP - GRAPHICS</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; đồ họa Laptop : Intel HD Graphics 4000</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH LAPTOP - DISPLAY</strong></p>
<ul>
	<li>
		Loại display Laptop : LED WIDE Cảm ứng (điện dung) OptiContrast Panel</li>
	<li>
		K&iacute;ch thước display Laptop : 11.6 inch</li>
	<li>
		Độ ph&acirc;n giải display Laptop : 1920 x 1080 Pixels</li>
	<li>
		Th&ocirc;ng tin kh&aacute;c display Laptop : Full HD</li>
</ul>
<p>
	<strong>&Acirc;M THANH LAPTOP - AUDIO</strong></p>
<ul>
	<li>
		Chuẩn &acirc;m thanh Laptop : Dolby Home Theater V4, Clear Phase, xLOUD</li>
</ul>
<p>
	<strong>CAMERA LAPTOP</strong></p>
<ul>
	<li>
		WebCam Laptop: Full HD Exmor R for PC - 1920 x 1080 - 2.07 Pixels</li>
</ul>
<p>
	<strong>KẾT NỐI MẠNG LAPTOP - NETWORK</strong></p>
<ul>
	<li>
		Chuẩn WiFi Laptop : IEEE 802.11 a/b/g/n</li>
	<li>
		LAN Laptop : 10 / 100 / 1000 Mbps</li>
</ul>
<p>
	<strong>CỔNG GIAO TIẾP LAPTOP - INTERFACES</strong></p>
<ul>
	<li>
		Cổng USB Laptop : C&oacute;</li>
	<li>
		Cổng VGA Laptop : x 1</li>
	<li>
		Cổng HDMI Laptop : x 1</li>
	<li>
		Headphones Laptop : x 1</li>
	<li>
		Microphone Laptop : x 1</li>
	<li>
		Bluetooth Laptop : 4.0 High Speed</li>
	<li>
		Card Reader Laptop : C&oacute;</li>
</ul>
<p>
	<strong>HỆ ĐIỀU H&Agrave;NH LAPTOP - OS</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh Laptop : Windows 8 Single Language 64 bit</li>
</ul>
<p>
	<strong>PIN LAPTOP - BATTERY</strong></p>
<ul>
	<li>
		Loại Pin Laptop : VGP-BPS31 Lithium-ion</li>
	<li>
		Thời gian sử dụng pin Laptop : Up to 4.5 hours</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 319.9x17.85x199 mm</li>
	<li>
		Khối lượng : 1.3 kg</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		Rapid Wake + Eco: hồi phục nhanh ch&oacute;ng, cho Pin sử dụng l&acirc;u v&agrave; bảo vệ dữ liệu</li>
	<li>
		Cảm biến chuyển động (Accelerometer), g&oacute;c quay (Gyro), Digital Compass</li>
	<li>
		C&ocirc;ng nghệ chống trộm Intel Anti-Theft - Chip TCG ver.1.2 compliant</li>
	<li>
		Camera mạnh mẽ Full HD được trang bị &quot;Exmor R cho PC&quot; (Độ ph&acirc;n giải: 1920 x 1080,&nbsp;Điểm ảnh&nbsp;thực: 2.07 Mega pixels)</li>
	<li>
		Network IEEE 802.11a/b/g/n - 1000BASE-T/100BASE-TX/10BASE-T x 1</li>
	<li>
		Chuẩn Bluetooth 4.0 + HS</li>
	<li>
		&Acirc;m thanh Dolby Home Theater v4, S-Master(Headphone Amplifier), Digital Noise Canceling, &quot;Clear Phase&quot;, &quot;xLOUD&quot;</li>
	<li>
		Microphone / Headphone / HDMI / Card Reader / USB 3.0 / Analogue RGB / Mini D-sub</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 29900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'32', N'1', N'3', N'32', N'SONY VAIO E Series - SVE15133CVW', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY VAIO E Series - SVE15133CVW</li>
	<li>
		M&agrave;u sắc : Trắng</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>BỘ VI XỬ L&Yacute; LAPTOP - CPU</strong></p>
<ul>
	<li>
		Tốc độ CPU Laptop : Intel Core i3-3120M - 2.50 GHz</li>
	<li>
		Bộ nhớ đệm CPU Laptop : 3 MB L3 Cache</li>
</ul>
<p>
	<strong>BỘ NHỚ LAPTOP - RAM</strong></p>
<ul>
	<li>
		Loại RAM Laptop : SDRAM DDR3</li>
	<li>
		Dung lượng RAM Laptop : 2 GB</li>
	<li>
		Hổ trợ dung lượng tối đa RAM Laptop : 8 GB</li>
</ul>
<p>
	<strong>Ổ ĐĨA CỨNG LAPTOP - HDD</strong></p>
<ul>
	<li>
		Loại ổ đĩa HDD Laptop : SATA</li>
	<li>
		Dung lượng HDD Laptop : 500 GB</li>
	<li>
		Tốc độ quay HDD Laptop : 5400 rpm</li>
</ul>
<p>
	<strong>Ổ ĐĨA QUANG LAPTOP - ODD</strong></p>
<ul>
	<li>
		Loại ổ đĩa ODD Laptop : SuperMulti DVD+/-RW</li>
</ul>
<p>
	<strong>CARD ĐỒ HỌA LAPTOP - GRAPHICS</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; đồ họa Laptop : Intel HD Graphics 4000</li>
	<li>
		Dung lượng graphics Laptop : Share</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH LAPTOP - DISPLAY</strong></p>
<ul>
	<li>
		Loại display Laptop : WXGA LED WIDE TFT</li>
	<li>
		K&iacute;ch thước display Laptop : 15.5 inch</li>
	<li>
		Độ ph&acirc;n giải display Laptop : 1366 x 768 Pixels</li>
</ul>
<p>
	<strong>&Acirc;M THANH LAPTOP - AUDIO</strong></p>
<ul>
	<li>
		Chip &acirc;m thanh Laptop : Intel High Definition Audio</li>
	<li>
		Chuẩn &acirc;m thanh Laptop : Clear Phase, xLOUD</li>
</ul>
<p>
	<strong>CAMERA LAPTOP</strong></p>
<ul>
	<li>
		WebCam Laptop: HD Exmor for PC - 1.31 MP - 1280 x 1024 Pixels</li>
</ul>
<p>
	<strong>KẾT NỐI MẠNG LAPTOP - NETWORK</strong></p>
<ul>
	<li>
		Chuẩn WiFi Laptop : IEEE 802.11 b/g/n</li>
	<li>
		LAN Laptop : 10 / 100 / 1000 Mbps</li>
</ul>
<p>
	<strong>CỔNG GIAO TIẾP LAPTOP - INTERFACES</strong></p>
<ul>
	<li>
		Cổng USB Laptop : USB 2.0 x 3 / USB 3.0 x 1</li>
	<li>
		Cổng VGA Laptop : x 1</li>
	<li>
		Cổng HDMI Laptop : x 1</li>
	<li>
		Headphones Laptop : x 1</li>
	<li>
		Microphone Laptop : x 1</li>
	<li>
		Bluetooth Laptop : 4.0 High Speed</li>
	<li>
		Card Reader Laptop : C&oacute;</li>
</ul>
<p>
	<strong>HỆ ĐIỀU H&Agrave;NH LAPTOP - OS</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh Laptop : Windows 8 Single Language 64 bit</li>
</ul>
<p>
	<strong>PIN LAPTOP - BATTERY</strong></p>
<ul>
	<li>
		Loại Pin Laptop : VGP-BPS26 Lithium-ion</li>
	<li>
		Thời gian sử dụng pin Laptop : Up to 5.5 hours</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 371.9x35.1x253.5 mm</li>
	<li>
		Khối lượng : 2.7 kg</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 13990000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'33', N'1', N'3', N'33', N'SONY VAIO E Series - SVE11125CVW', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY VAIO E Series - SVE11125CVW</li>
	<li>
		M&agrave;u sắc : Trắng</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>BỘ VI XỬ L&Yacute; LAPTOP - CPU</strong></p>
<ul>
	<li>
		Tốc độ CPU Laptop : AMD E2-1800 - 1.70 GHz</li>
	<li>
		Bộ nhớ đệm CPU Laptop : 1 MB L2 Cache</li>
</ul>
<p>
	<strong>BỘ NHỚ LAPTOP - RAM</strong></p>
<ul>
	<li>
		Loại RAM Laptop : SDRAM DDR3</li>
	<li>
		Dung lượng RAM Laptop : 2 GB</li>
	<li>
		Hổ trợ dung lượng tối đa RAM Laptop : 8 GB</li>
</ul>
<p>
	<strong>Ổ ĐĨA CỨNG LAPTOP - HDD</strong></p>
<ul>
	<li>
		Loại ổ đĩa HDD Laptop : SATA</li>
	<li>
		Dung lượng HDD Laptop : 320 GB</li>
	<li>
		Tốc độ quay HDD Laptop : 5400 rpm</li>
</ul>
<p>
	<strong>CARD ĐỒ HỌA LAPTOP - GRAPHICS</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; đồ họa Laptop : AMD Radeon HD 7340</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH LAPTOP - DISPLAY</strong></p>
<ul>
	<li>
		Loại display Laptop : WXGA LED WIDE TFT</li>
	<li>
		K&iacute;ch thước display Laptop : 11.6 inch</li>
	<li>
		Độ ph&acirc;n giải display Laptop : 1366 x 768 Pixels</li>
</ul>
<p>
	<strong>&Acirc;M THANH LAPTOP - AUDIO</strong></p>
<ul>
	<li>
		Chip &acirc;m thanh Laptop : Intel High Definition Audio</li>
	<li>
		Chuẩn &acirc;m thanh Laptop : Clear Phase, xLOUD</li>
</ul>
<p>
	<strong>KẾT NỐI MẠNG LAPTOP - NETWORK</strong></p>
<ul>
	<li>
		Chuẩn WiFi Laptop : IEEE 802.11 b/g/n</li>
	<li>
		LAN Laptop : 10 / 100 / 1000 Mbps</li>
</ul>
<p>
	<strong>CỔNG GIAO TIẾP LAPTOP - INTERFACES</strong></p>
<ul>
	<li>
		Cổng USB Laptop : USB 2.0 x 2 / USB 3.0 x 1</li>
	<li>
		Cổng VGA Laptop : x 1</li>
	<li>
		Cổng HDMI Laptop : x 1</li>
	<li>
		Headphones Laptop : x 1</li>
	<li>
		Microphone Laptop : x 1</li>
	<li>
		Bluetooth Laptop : 4.0 High Speed</li>
	<li>
		Card Reader Laptop : C&oacute;</li>
</ul>
<p>
	<strong>HỆ ĐIỀU H&Agrave;NH LAPTOP - OS</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh Laptop : Windows 8 Single Language 64 bit</li>
</ul>
<p>
	<strong>PIN LAPTOP - BATTERY</strong></p>
<ul>
	<li>
		Loại Pin Laptop : VGP-BPS26 Lithium-ion</li>
	<li>
		Thời gian sử dụng pin Laptop : Up to 4.5 hours</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 290x31.5x203.5 mm</li>
	<li>
		Khối lượng : 1.5 kg</li>
</ul>
', NULL, 10000000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'34', N'4', N'3', N'34', N'DSC-RX100', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY DSC-RX100 E32</li>
	<li>
		M&agrave;u sắc : Đen</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: &nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 101.6x58.1x35.9 mm</li>
	<li>
		Khối lượng: 213 gram (Chỉ t&iacute;nh ri&ecirc;ng th&acirc;n m&aacute;y)</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		Sử dụng cảm biến CMOS Exmor chuẩn 1.0 mới, độ ph&acirc;n giải 20.2 MP cho h&igrave;nh ảnh đạt độ r&otilde; n&eacute;t v&agrave; chất lượng cao.</li>
	<li>
		Sử dụng ống k&iacute;nh đường k&iacute;nh rộng F1.8 Carl Zeiss Vario-Sonnar T* cho khả năng lấy n&eacute;t chuẩn x&aacute;c.</li>
	<li>
		Tối ưu độ nhiễu bằng bộ xử l&yacute; h&igrave;nh ảnh BIONZ v&agrave; ống k&iacute;nh tương xứng</li>
	<li>
		V&ograve;ng&nbsp;điều chỉnh bằng tay&nbsp;tiện dụng</li>
	<li>
		M&agrave;n h&igrave;nh LCD Xtra Fine cực lớn 3&quot; (7.5 cm)</li>
	<li>
		Sử dụng c&ocirc;ng nghệ WhiteMagic&trade; mới cho h&igrave;nh ảnh s&aacute;ng r&otilde; mọi nơi</li>
	<li>
		Cảm biến 20.2MP Exmor&trade; CMOS chuẩn 1.0</li>
	<li>
		Ống k&iacute;nh F1.8 Carl Zeiss&reg;</li>
	<li>
		Vario-Sonnar T*</li>
	<li>
		M&agrave;n h&igrave;nh 3&quot; Xtra Fine LCD</li>
</ul>
', NULL, 15000000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'35', N'4', N'3', N'35', N'SONY DSC-WX80/BC E32', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY DSC-WX80/BC E32</li>
	<li>
		M&agrave;u sắc : Đỏ</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		<span style="&quot;font-size:">Độ ph&acirc;n giải m&aacute;y ảnh: 16.2 megapixels</span></li>
	<li>
		Zoom quang học : 8x</li>
	<li>
		Chế độ tự động lấy n&eacute;t : C&oacute;</li>
	<li>
		Nhận diện khu&ocirc;n mặt : C&oacute;</li>
	<li>
		Thẻ nhớ tương th&iacute;ch : Stick PRO HG Duo / Stick XC-HG Duo / SD / SDHC / SDXC / Stick Micro / Stick Micro (Mark2) / Micro SD / Micro SDHC / Micro SDXC</li>
	<li>
		Sử dụng pin : Lithiun Ion</li>
</ul>
<p>
	<strong>CẢM BIẾN M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; m&aacute;y ảnh : BIONZ</li>
	<li>
		Loại sensor : CMOS</li>
	<li>
		K&iacute;ch thước : 1/2.3&quot;</li>
	<li>
		Độ nhạy s&aacute;ng ISO : Auto / 100 / 200 / 400 / 800 / 1600 / 3200 / 6400*4 / 12800*4 *3</li>
</ul>
<p>
	<strong>ỐNG K&Iacute;NH M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Ống k&iacute;nh : Carl Zeiss Vario-Tessar</li>
	<li>
		Loại ống k&iacute;nh: Dịch chuyển</li>
	<li>
		Khả năng zoom quang học khi quay phim : 8x</li>
	<li>
		Độ d&agrave;i ti&ecirc;u cự : 3.3 - 6.3 mm</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh : Clear Photo TFT LCD</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh m&aacute;y ảnh: 2.7 inch</li>
</ul>
<p>
	<strong>CHỤP ẢNH M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Định dạng file ảnh : JPEG</li>
	<li>
		Panorama: C&oacute;</li>
	<li>
		C&acirc;n bằng trắng : Auto / Daylight / Cloudy / Fluorescent / Incandescent / Flash / One Push, One Push Set</li>
	<li>
		Chế độ đ&egrave;n Flash : Auto / On / Off</li>
	<li>
		Loại Đ&egrave;n Flash : T&iacute;ch hợp</li>
	<li>
		Hẹn giờ tự chụp : C&oacute;</li>
</ul>
<p>
	<strong>QUAY PHIM M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Chế độ quay phim : HD 720p</li>
	<li>
		Định dạng quay phim : AVCHD / MP4</li>
	<li>
		Độ ph&acirc;n giải quay : 1280x720 pixels</li>
</ul>
<p>
	<strong>INPUT/OUTPUT</strong></p>
<ul>
	<li>
		Cổng kết nối đa năng : AV / USB</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 92.3x52.5x22.5 mm</li>
	<li>
		Khối lượng : 124 gram</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<p>
	&nbsp;</p>
<ul>
	<li>
		Cảm biến Exmor R&trade; CMOS 16.2MP</li>
	<li>
		Ống k&iacute;nh Carl Zeiss&nbsp;Vario-Tessar với Zoom quang học 8x</li>
	<li>
		T&iacute;ch hợp Wi-Fi</li>
	<li>
		Chụp li&ecirc;n tục tốc độ cao (10fps)</li>
	<li>
		Quay phim độ n&eacute;t cao HD (720p)</li>
	<li>
		Hiệu ứng h&igrave;nh ảnh&nbsp;(Movie v&agrave; Panorama)</li>
</ul>
', NULL, 5500000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'36', N'4', N'3', N'36', N'SONY DSC-W710/PC E32', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY DSC-W710/PC E32</li>
	<li>
		M&agrave;u sắc : Hồng</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Độ ph&acirc;n giải m&aacute;y ảnh: 16.1 megapixels</li>
	<li>
		Zoom quang học : 5x</li>
	<li>
		Chế độ tự động lấy n&eacute;t : C&oacute;</li>
	<li>
		Chống rung : C&oacute;</li>
	<li>
		Giảm mắt đỏ : C&oacute;</li>
	<li>
		Nhận diện khu&ocirc;n mặt : C&oacute;</li>
	<li>
		Thẻ nhớ tương th&iacute;ch : Stick PRO Duo, Stick PRO HG Duo, SD, SDHC, Stick Micro, Stick Micro (Mark2), Micro SD, Micro SDHC</li>
	<li>
		Sử dụng pin : Lithiun Ion</li>
	<li>
		Pin : NP-BN</li>
</ul>
<p>
	<strong>CẢM BIẾN M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Loại sensor : CCD</li>
	<li>
		K&iacute;ch thước : 1/2.3&quot;</li>
	<li>
		Độ nhạy s&aacute;ng ISO : Auto / 100 / 200 / 400 / 800 / 1600 / 3200</li>
</ul>
<p>
	<strong>ỐNG K&Iacute;NH M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Ống k&iacute;nh : Sony Lens</li>
	<li>
		Loại ống k&iacute;nh: Dịch chuyển</li>
	<li>
		Khả năng zoom quang học khi quay phim : 5x</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh : Clear Photo TFT LCD</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh m&aacute;y ảnh: 2.7 inch</li>
</ul>
<p>
	<strong>CHỤP ẢNH M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Định dạng file ảnh : JPEG</li>
	<li>
		Panorama: C&oacute;</li>
	<li>
		C&acirc;n bằng trắng : Auto / Daylight / Cloudy / Fluorescent / Incandescent / Flash</li>
	<li>
		Chế độ đ&egrave;n Flash : Auto / On / Off</li>
	<li>
		Loại Đ&egrave;n Flash : T&iacute;ch hợp</li>
	<li>
		Hẹn giờ tự chụp : C&oacute;</li>
</ul>
<p>
	<strong>QUAY PHIM M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Chế độ quay phim : HD 720p</li>
	<li>
		Độ ph&acirc;n giải quay : 1280x720 pixels</li>
</ul>
<p>
	<strong>INPUT/OUTPUT</strong></p>
<ul>
	<li>
		Cổng kết nối đa năng : AV / USB</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 97x55.1x20 mm</li>
	<li>
		Khối lượng : 114 gram</li>
</ul>
', NULL, 2500000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'37', N'6', N'3', N'37', N'SONY ICD-PX312//C E', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY ICD-PX312//C E</li>
	<li>
		M&agrave;u sắc : Đen</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y GHI &Acirc;M</strong></p>
<ul>
	<li>
		Bộ nhớ trong : 2 GB</li>
	<li>
		Định dạng ghi &acirc;m : MP3</li>
	<li>
		Tự động ghi &acirc;m theo giọng n&oacute;i (VOR) : C&oacute;</li>
	<li>
		M&agrave;n h&igrave;nh hiển thị : C&oacute;</li>
	<li>
		Loại pin : Alkaline AAA</li>
</ul>
<p>
	<strong>THỜI GIAN GHI &Acirc;M</strong></p>
<ul>
	<li>
		LP : 536 giờ (8kbps)</li>
	<li>
		SP : &nbsp;89 giờ 25 ph&uacute;t (48kbps)</li>
	<li>
		HQ : 33 giờ 30 ph&uacute;t (128kbps)</li>
	<li>
		Chế độ SHQ : 22 giờ 20 ph&uacute;t (192kbps)</li>
</ul>
<p>
	<strong>INPUT/OUTPUT - GHI &Acirc;M</strong></p>
<ul>
	<li>
		<span style="&quot;font-size:">Ng&otilde; cắm Micro : C&oacute;</span></li>
	<li>
		Ng&otilde; cắm Tai nghe : C&oacute;</li>
	<li>
		Cổng USB : C&oacute;</li>
	<li>
		Khe cắm thẻ nhớ : C&oacute;</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 37.5x114x20.9 mm</li>
	<li>
		Khối lượng : 74 gram</li>
</ul>
', NULL, 1790000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'38', N'8', N'3', N'38', N'SONY KLV-32BX35A', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY KLV-32BX35A SP1</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG CHUNG LCD</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh LCD: LCD</li>
	<li>
		Độ ph&acirc;n giải LCD (pixels): WXGA</li>
	<li>
		Tỉ lệ m&agrave;n h&igrave;nh: 16:9</li>
	<li>
		G&oacute;c nh&igrave;n (độ): 176&deg;(Tr&aacute;i/Phải),176&deg;(L&ecirc;n/Xuống)</li>
</ul>
<p>
	<strong>&Acirc;M THANH LCD</strong></p>
<ul>
	<li>
		C&ocirc;ng suất loa: 8Wx2</li>
	<li>
		Hệ thống loa: 2</li>
	<li>
		Hệ thống &acirc;m thanh: Dynamic / Standard / Clear Voice</li>
	<li>
		Chế độ &acirc;m thanh: Cinema/ Music/ Sports/ Game</li>
</ul>
<p>
	<strong>KẾT NỐI LCD</strong></p>
<ul>
	<li>
		Cổng HDMI: 2</li>
	<li>
		Cổng Composite: 1</li>
	<li>
		Cổng Component: 1</li>
	<li>
		Cổng AV: Cổng v&agrave;o &acirc;m thanh: 3 - Ng&otilde; ra &acirc;m thanh:1 - Ng&otilde; ra tai nghe: 1</li>
	<li>
		Cổng USB: 1</li>
</ul>
<p>
	<strong>C&Aacute;C T&Iacute;NH NĂNG KH&Aacute;C LCD</strong></p>
<ul>
	<li>
		Chế độ tiết kiệm điện: C&oacute;</li>
	<li>
		Điện năng ti&ecirc;u thụ (LCD): 73.11W</li>
	<li>
		Hẹn giờ bật/tắt: C&oacute;</li>
	<li>
		Remote control: RM-GA021</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		Khối lượng : 9.4 kg</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		C&ocirc;ng nghệ h&igrave;nh ảnh vượt trội&nbsp;BRAVIA Engine&nbsp;3&trade;</li>
	<li>
		C&ocirc;ng nghệ n&acirc;ng cao h&igrave;nh ảnh với Clear resolution enhancer</li>
	<li>
		Kết nối đồng bộ BRAVIA Sync</li>
	<li>
		Ph&aacute;t qua USB (xem phim, nghe nhạc, xem h&igrave;nh)</li>
	<li>
		Lựa chọn khung cảnh</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 5900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'39', N'8', N'3', N'39', N'SONY KDL-40EX650 ME6', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY KDL-40EX650 ME6</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG CHUNG LCD</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh LCD: LCD</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh LCD (inches): 40</li>
	<li>
		Độ ph&acirc;n giải LCD (pixels): Full HD</li>
	<li>
		Tỉ lệ m&agrave;n h&igrave;nh: 16:9</li>
	<li>
		G&oacute;c nh&igrave;n (độ): 178&deg;(Tr&aacute;i/Phải),178&deg;(L&ecirc;n/Xuống)</li>
</ul>
<p>
	<strong>&Acirc;M THANH LCD</strong></p>
<ul>
	<li>
		C&ocirc;ng suất loa: 10Wx2</li>
	<li>
		Hệ thống loa: 2</li>
	<li>
		Hệ thống &acirc;m thanh: Dynamic / Standard / Clear Voice</li>
	<li>
		Chế độ &acirc;m thanh: Cinema/ Music/ Sports/ Game</li>
</ul>
<p>
	<strong>KẾT NỐI LCD</strong></p>
<ul>
	<li>
		Cổng HDMI: 4</li>
	<li>
		Cổng Composite: 2</li>
	<li>
		Cổng Component: 1</li>
	<li>
		Cổng AV: Ng&otilde; ra &acirc;m thanh KTS: 1 - Ng&otilde; ra &acirc;m thanh:1 (Hybrid w/HP)</li>
	<li>
		Cổng USB: 2</li>
	<li>
		Cổng Ethernet (LAN): 1</li>
</ul>
<p>
	<strong>C&Aacute;C T&Iacute;NH NĂNG KH&Aacute;C LCD</strong></p>
<ul>
	<li>
		Chế độ tiết kiệm điện: C&oacute;</li>
	<li>
		Điện năng ti&ecirc;u thụ (LCD): 99W</li>
	<li>
		Hẹn giờ bật/tắt: C&oacute;</li>
	<li>
		Remote control: RM-GA023</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		Khối lượng : 14.1 kg</li>
	<li>
		K&iacute;ch thước: 941x612x231 mm</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		C&ocirc;ng nghệ xử l&yacute; h&igrave;nh ảnh vượt trội X-Reality&trade;</li>
	<li>
		Full HD 1920x1080</li>
	<li>
		Đ&egrave;n nền Edge LED</li>
	<li>
		C&ocirc;ng nghệ qu&eacute;t h&igrave;nh Motionflow&trade; XR 100</li>
	<li>
		Sony Entertainment Network với nhiều nội dung giải tr&iacute; phong ph&uacute; tiếng Việt v&agrave; tiếng Anh</li>
	<li>
		Hội thoại trực tuyến với Skype&trade; sẵn s&agrave;ng (cần trang bị th&ecirc;m camera CMU-BR100)</li>
	<li>
		Chơi game tr&ecirc;n Opera TV Store</li>
	<li>
		&Acirc;m thanh S-Force Front Surround</li>
	<li>
		Chế độ tiết kiệm điện, sản phẩm th&acirc;n thiện m&ocirc;i trường</li>
	<li>
		Kết nối Internet, chat với Skype, Duyệt web</li>
	<li>
		Kết nối th&ocirc;ng minh Wifi-Direct với điện thoại, m&aacute;y t&iacute;nh bảng</li>
	<li>
		Xoay m&agrave;n h&igrave;nh ngang</li>
</ul>
', NULL, 14900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'4', N'2', N'3', N'4', N'Sony Xperia U', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 1900 / 2100 - ST25i<br />
		HSDPA 850 / 1900 / 2100 - ST25a</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 05 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;112 x 54 x 12 mm</li>
	<li>
		Trọng lượng:&nbsp;110 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung LED-backlit LCD, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;480 x 854 pixels, 3.5 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 10 ng&oacute;n tay)</li>
			<li>
				Ph&iacute;m điều khiển cảm ứng</li>
			<li>
				Mặt k&iacute;nh chống trầy xước</li>
			<li>
				Sony Mobile BRAVIA Engine</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3, WAV</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;8GB (4GB d&ugrave;ng để lưu trữ), 512 MB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;kh&ocirc;ng</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 107 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 296 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA 14.4 Mbps, HSUPA 5.76 Mbps</li>
	<li>
		NFC:&nbsp;Kh&ocirc;ng</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, Wi-Fi hotspot, DLNA</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v2.1 với A2DP, EDR</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0, hỗ trợ USB On-the-go</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;5 MP, 2592 x 1944 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt v&agrave; nụ cười, chụp panorama 3D, chống rung</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 720p@30fps, video light</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, VGA</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v2.3 (Gingerbread), n&acirc;ng cấp l&ecirc;n v4.0</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Dual-core 1 GHz, STE U8500 chipset, DB8500 GPU</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5, Adobe Flash</li>
	<li>
		Radio:&nbsp;Stereo FM radio với RDS</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Trắng, Hồng, V&agrave;ng</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Cổng HDMI</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Google Search, Maps, Gmail, YouTube, Calendar, Google Talk</li>
			<li>
				Xem văn bản</li>
			<li>
				Xem / Chỉnh sửa h&igrave;nh ảnh</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1320 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 260 giờ (2G) / 472 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:&nbsp;L&ecirc;n đến 6 giờ 36 ph&uacute;t (2G) / 5 giờ 36 ph&uacute;t (3G)&nbsp;<br />
		Nghe nhạc l&ecirc;n đến 45 giờ</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 5900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'40', N'5', N'3', N'40', N'SONY HDRCX210E/SCE35', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY HDRCX210E/SCE35</li>
	<li>
		M&agrave;u sắc : Bạc</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại lưu trữ : Flash Memory</li>
	<li>
		Bộ nhớ trong : 8 GB</li>
	<li>
		Thẻ nhớ tương th&iacute;ch : SD / SDHC / SDXC / PRO Duo / PRO-HG Duo</li>
	<li>
		Zoom quang học : 25x</li>
	<li>
		Zoom kỹ thuật số : 300x</li>
	<li>
		Chế độ quay : Full HD</li>
	<li>
		Độ ph&acirc;n giải : 1920x1080 pixels</li>
	<li>
		Định dạng file h&igrave;nh : JPEG</li>
	<li>
		Định dạng Video : MPEG4-AVC/H.264 / MPEG2-PS</li>
	<li>
		&Acirc;m thanh : Dolby&reg; Digital 2ch Stereo</li>
	<li>
		Loại Pin : NP-FV30</li>
</ul>
<p>
	<strong>CẢM BIẾN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Bộ xử l&yacute;: Exmor R</li>
	<li>
		Loại cảm biến : CMOS</li>
	<li>
		K&iacute;ch thước cảm biến : 1/5.8&quot;</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh : Clear Photo LCD&trade;</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh : 2.7 inch</li>
</ul>
<p>
	<strong>ỐNG K&Iacute;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại ống k&iacute;nh : Carl Zeiss&reg; Vario-Tessar&reg;</li>
	<li>
		Độ d&agrave;i ti&ecirc;u cự : 2.5 - 62.5 mm</li>
</ul>
<p>
	<strong>INPUT/OUTPUT M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Kết nối : AV / USB / HDMI</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 51x56x106.5 mm</li>
	<li>
		Khối lượng: 175&nbsp;gram (Chỉ t&iacute;nh ri&ecirc;ng th&acirc;n m&aacute;y)</li>
</ul>
', NULL, 8900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'41', N'5', N'3', N'41', N'SONY HDRPJ760VE', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY HDRPJ760VE/BE34</li>
	<li>
		M&agrave;u sắc : Đen</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại lưu trữ : Flash Memory</li>
	<li>
		Bộ nhớ trong : 96 GB</li>
	<li>
		Thẻ nhớ tương th&iacute;ch : SD / SDHC / SDXC / PRO Duo / PRO-HG Duo</li>
	<li>
		Zoom quang học : 10x</li>
	<li>
		Zoom kỹ thuật số : 120x</li>
	<li>
		Chế độ quay : Full HD</li>
	<li>
		Độ ph&acirc;n giải : 1920x1080 pixels</li>
	<li>
		Định dạng file h&igrave;nh : JPEG</li>
	<li>
		Định dạng Video : MPEG4-AVC/H.264 / MPEG2-PS</li>
	<li>
		&Acirc;m thanh : Dolby&reg; Digital 5.1ch</li>
	<li>
		Loại Pin : NP-FV50</li>
</ul>
<p>
	<strong>CẢM BIẾN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Bộ xử l&yacute;: Exmor R</li>
	<li>
		Loại cảm biến : CMOS</li>
	<li>
		K&iacute;ch thước cảm biến : 1/2.88&quot;</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh : Xtra Fine LCD</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh : 3 inch</li>
	<li>
		Cảm Ứng : C&oacute;</li>
</ul>
<p>
	<strong>ỐNG K&Iacute;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại ống k&iacute;nh : Carl Zeiss&reg; Vario-Sonnar</li>
</ul>
<p>
	<strong>INPUT/OUTPUT M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Kết nối : AV / USB / HDMI</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 71.5x73.5x137.5 mm</li>
	<li>
		Khối lượng: 580 gram (Chỉ t&iacute;nh ri&ecirc;ng th&acirc;n m&aacute;y)</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		T&iacute;ch hợp m&aacute;y chiếu</li>
	<li>
		Chụp ảnh tĩnh l&ecirc;n đến 24.1 Mega pixels</li>
	<li>
		M&agrave;n h&igrave;nh Xtra Fine LCD 3.0&quot; (921K dots / Wide 16:9), cảm ứng với c&ocirc;ng nghệ TruBlack</li>
	<li>
		Ống k&iacute;nh Carl Zeiss g&oacute;c rộng 26mm</li>
	<li>
		K&iacute;nh ngắm điện tử với nấp đậy ống k&iacute;nh k&egrave;m theo</li>
	<li>
		Cơ chế ổn định h&igrave;nh ảnh: Balanced Optical SteadyShot&trade; (Chế độ Active - Wide đến Tele)</li>
	<li>
		Optical SteadyShot cho h&igrave;nh ảnh ổn định hơn ở độ zoom 13x</li>
	<li>
		Nhận diện khu&ocirc;n mặt, nụ cười</li>
	<li>
		Chế độ tự động th&ocirc;ng minh</li>
	<li>
		Quay mượt m&agrave; với tốc độ chậm</li>
	<li>
		Đ&egrave;n LED Video</li>
	<li>
		T&iacute;ch hợp GPS</li>
	<li>
		T&ocirc;́i ưu h&oacute;a D-Range</li>
	<li>
		Hỗ trợ &aacute;nh s&aacute;ng nền</li>
	<li>
		Ch&eacute;p đĩa trực tiếp</li>
	<li>
		Cổng kết nối: AV/ USB/ HDMI(mini)</li>
	<li>
		Phụ kiện k&egrave;m theo: Bộ pin sạc NP-FV50, D&acirc;y AV, D&acirc;y HDMI, C&aacute;p USB, Nắp đậy ống k&iacute;nh, Bộ điều khiển từ xa</li>
</ul>
', NULL, 35900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'42', N'4', N'3', N'42', N'SONY DSC-HX10VSC E32', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY DSC-HX10VSC E32</li>
	<li>
		M&agrave;u sắc : Bạc</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Độ ph&acirc;n giải m&aacute;y ảnh: 18.2 megapixels</li>
	<li>
		Zoom quang học : 16x</li>
	<li>
		Chế độ tự động lấy n&eacute;t : C&oacute;</li>
	<li>
		Giảm mắt đỏ : C&oacute;</li>
	<li>
		Nhận diện khu&ocirc;n mặt : C&oacute;</li>
	<li>
		Thẻ nhớ tương th&iacute;ch : SD, SDHC, SDXC</li>
	<li>
		Sử dụng pin : NP-BG1</li>
</ul>
<p>
	<strong>CẢM BIẾN M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; m&aacute;y ảnh : BIONZ</li>
	<li>
		Loại sensor : CMOS</li>
	<li>
		K&iacute;ch thước : 1/2.3&quot;</li>
	<li>
		Độ nhạy s&aacute;ng ISO : Auto / 100 / 200 / 400 / 800 / 1600 / 3200 / 6400 / 12800</li>
</ul>
<p>
	<strong>ỐNG K&Iacute;NH M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Ống k&iacute;nh : Sony Lens G</li>
	<li>
		Loại ống k&iacute;nh: Dịch chuyển</li>
	<li>
		Khả năng zoom quang học khi quay phim : 16x</li>
	<li>
		Độ d&agrave;i ti&ecirc;u cự : 4.28 - 68.48 mm</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh : TFT LCD&nbsp;</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh m&aacute;y ảnh: 3 inch</li>
</ul>
<p>
	<strong>CHỤP ẢNH M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Định dạng file ảnh : JPEG</li>
	<li>
		Panorama: C&oacute;</li>
	<li>
		C&acirc;n bằng trắng : Auto / Daylight / Cloudy / Fluorescent / Incandescent / Flash / One Push, One Push Set</li>
	<li>
		Chế độ đ&egrave;n Flash : Auto / On / Off / Slow Synchro</li>
	<li>
		Loại Đ&egrave;n Flash : T&iacute;ch hợp</li>
	<li>
		Hẹn giờ tự chụp : C&oacute;</li>
</ul>
<p>
	<strong>QUAY PHIM M&Aacute;Y ẢNH</strong></p>
<ul>
	<li>
		Chế độ quay phim : Full HD</li>
	<li>
		Độ ph&acirc;n giải quay : 1920x1080 pixels</li>
</ul>
<p>
	<strong>INPUT/OUTPUT</strong></p>
<ul>
	<li>
		Cổng kết nối đa năng : AV / HDMI / USB</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 104.7x59.7x33.8 mm</li>
	<li>
		Khối lượng : 234 gram</li>
</ul>
', NULL, 8000000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'43', N'2', N'3', N'43', N'Sony Xperia Ion HSPA LT28H', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 04 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;133 x 68 x 10.8 mm</li>
	<li>
		Trọng lượng:&nbsp;144 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung TFT, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;720 x 1280 pixels, 4.55 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 4 ng&oacute;n tay)</li>
			<li>
				Sony Mobile BRAVIA Engine 2</li>
			<li>
				Timescape UI</li>
			<li>
				Mặt k&iacute;nh chống trầy xước</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;16 GB, 1GB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;microSD (TransFlash) hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 86 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 237 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, 21 Mbps; HSUPA, 5.8 Mbps</li>
	<li>
		NFC:&nbsp;C&oacute;</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v2.1 với A2DP, EDR</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0, hỗ trợ USB On-the-go</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;12 MP, 4000x3000 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt, chống rung, HDR, chụp to&agrave;n cảnh</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 1080p@30fps, tự động lấy n&eacute;t li&ecirc;n tục, video light, chống rung, HDR</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, 1.3 MP, 720p@30fps</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.0.4 (Ice Cream Sandwich)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Dual-core 1.5 GHz, Adreno 220 GPU</li>
	<li>
		Chipset:&nbsp;Qualcomm MSM8260 Snapdragon</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5, Adobe Flash</li>
	<li>
		Radio:&nbsp;Stereo FM radio với RDS</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Trắng, Đỏ</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS v&agrave; GLONASS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				Hỗ trợ ANT+</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Xem / Chỉnh sửa h&igrave;nh ảnh</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1900 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 400 giờ (2G) / 350 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:&nbsp;L&ecirc;n đến 10 giờ (2G) / 4 giờ (3G)&nbsp;<br />
		Nghe nhạc l&ecirc;n đến 12 giờ</li>
</ul>
', NULL, 10990000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'44', N'2', N'3', N'44', N'Sony Xperia Go', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 05 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;111 x 60.3 x 9.8 mm</li>
	<li>
		Trọng lượng:&nbsp;110g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung TFT, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;320 x 480 pixels, 3.5 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 10 ng&oacute;n tay)</li>
			<li>
				Sony Mobile BRAVIA Engine 2</li>
			<li>
				Timescape UI</li>
			<li>
				Mặt k&iacute;nh chống trầy xước v&agrave; chống thấm</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;8 GB (4 GB sử dụng), 512 MB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;microSD (TransFlash) hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 107 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 296 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, 14.4 Mbps; HSUPA, 5.76 Mbps</li>
	<li>
		NFC:&nbsp;Kh&ocirc;ng</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, DLNA, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v3.0 với A2DP, EDR</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0, hỗ trợ USB On-the-go</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;5 MP, 2592 x 1944 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt, chống rung, HDR, chụp to&agrave;n cảnh</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 720p@30fps, tự động lấy n&eacute;t li&ecirc;n tục, video light, chống rung</li>
	<li>
		Camera phụ:&nbsp;Kh&ocirc;ng</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v2.3 (Gingerbread), cập nhật v4.0</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Dual-core 1 GHz ARM Cortex-A9, Mali-400MP GPU</li>
	<li>
		Chipset:&nbsp;NovaThor U8500</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5, Adobe Flash</li>
	<li>
		Radio:&nbsp;Stereo FM radio với RDS</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Trắng, Đen, V&agrave;ng</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS v&agrave; GLONASS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				Khả năng chống bụi v&agrave; nước (l&ecirc;n đến 1 met trong 30 ph&uacute;t) đạt chứng chỉ IP67</li>
			<li>
				Nhận diện TrackID</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1305 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 520 giờ (2G) / 460 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:&nbsp;L&ecirc;n đến 6 giờ 30 ph&uacute;t (2G) / 5 giờ 30 ph&uacute;t (3G)<br />
		Nghe nhạc l&ecirc;n đến 45 giờ</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 6500000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'45', N'2', N'3', N'45', N'Sony Xperia Neo L', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 1900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 05 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;121 x 61.1 x 12.2 mm</li>
	<li>
		Trọng lượng:&nbsp;131.5 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung TFT, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;480 x 854 pixels, 4.0 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 4 ng&oacute;n tay)</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Timescape UI</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;1 GB (300 MB sử dụng), 512 MB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;microSD (TransFlash) hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 80 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 237 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, HSUPA</li>
	<li>
		NFC:&nbsp;Kh&ocirc;ng</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v2.1 với A2DP, EDR</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;5 MP, 2592 x 1944 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Video calling, chạm lấy n&eacute;t, geo-tagging</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 720p@30fps, video light</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, VGA</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.0.3 (Ice Cream Sandwich)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;1 GHz Scorpion, Adreno 205 GPU</li>
	<li>
		Chipset:&nbsp;Qualcomm MSM8255 Snapdragon</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5, Adobe Flash</li>
	<li>
		Radio:&nbsp;Kh&ocirc;ng</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Trắng</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV</li>
			<li>
				Nhận diện TrackID</li>
			<li>
				Xem văn bản</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1500mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 575 giờ (2G) / 410 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:L&ecirc;n đến 7 giờ 53 ph&uacute;t (2G) / 7 giờ 9 ph&uacute;t (3G)&nbsp;<br />
		Nghe nhạc l&ecirc;n đến 37 giờ</li>
</ul>
', NULL, 5900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'46', N'5', N'3', N'46', N'SONY DCR-PJ6E/BC E34', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY DCR-PJ6E/BC E34</li>
	<li>
		M&agrave;u sắc : Đen</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại lưu trữ : Flash Memory</li>
	<li>
		Thẻ nhớ tương th&iacute;ch : SD / SDHC / SDXC / PRO Duo / PRO-HG Duo</li>
	<li>
		Zoom quang học : 60x (Zoom mở rộng 70x)</li>
	<li>
		&Acirc;m thanh : Dolby&reg; Digital 2ch Stereo</li>
	<li>
		Loại Pin : NP-FV30</li>
</ul>
<p>
	<strong>CẢM BIẾN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Bộ xử l&yacute;: Sony Imaging Processor</li>
	<li>
		Loại cảm biến : CCD</li>
	<li>
		K&iacute;ch thước cảm biến : 1/8&quot;</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh : Clear Photo LCD&trade;</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh : 2.7 inch</li>
</ul>
<p>
	<strong>ỐNG K&Iacute;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại ống k&iacute;nh : Sony</li>
</ul>
<p>
	<strong>INPUT/OUTPUT M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Kết nối : AV / USB</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 58.5x55.5x124.5 mm</li>
	<li>
		Khối lượng: 230 gram (Chỉ t&iacute;nh ri&ecirc;ng th&acirc;n m&aacute;y)</li>
</ul>
', NULL, 6900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'47', N'5', N'3', N'47', N'SONY KTS – DCR-SX22E/SCE34', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY KTS &ndash; DCR-SX22E/SCE34</li>
	<li>
		M&agrave;u sắc : Bạc</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh: Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại lưu trữ : Flash Memory</li>
	<li>
		Zoom quang học : 60x (Zoom mở rộng 70x)</li>
	<li>
		Định dạng Video : MPEG 2</li>
	<li>
		&Acirc;m thanh : Dolby&reg; Digital 2ch Stereo</li>
	<li>
		Loại Pin : NP-FV30</li>
</ul>
<p>
	<strong>CẢM BIẾN M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Bộ xử l&yacute;: Sony Imaging Processor</li>
	<li>
		Loại cảm biến : CCD</li>
	<li>
		K&iacute;ch thước cảm biến : 1/8&quot;</li>
</ul>
<p>
	<strong>M&Agrave;N H&Igrave;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh : Clear Photo LCD&trade;</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh : 2.7 inch</li>
</ul>
<p>
	<strong>ỐNG K&Iacute;NH M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Loại ống k&iacute;nh : Sony lens</li>
</ul>
<p>
	<strong>INPUT/OUTPUT M&Aacute;Y QUAY PHIM</strong></p>
<ul>
	<li>
		Kết nối : AV / USB</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 54x55.5x124.5 mm</li>
	<li>
		Khối lượng: 195 gram (Chỉ t&iacute;nh ri&ecirc;ng th&acirc;n m&aacute;y)</li>
</ul>
', NULL, 4500000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'48', N'8', N'3', N'48', N'SONY KDL-55HX750 ME6', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY KDL-55HX750 ME6</li>
	<li>
		M&agrave;u sắc : Đen</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
	<li>
		Ti&ecirc;u chuẩn: Ch&iacute;nh H&atilde;ng</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh:&nbsp;&nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG CHUNG LCD</strong></p>
<ul>
	<li>
		T&iacute;nh năng 3D: C&oacute;</li>
	<li>
		Loại m&agrave;n h&igrave;nh LCD: LED</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh LCD (inches): 55</li>
	<li>
		Độ ph&acirc;n giải LCD (pixels): Full HD</li>
	<li>
		Tỉ lệ m&agrave;n h&igrave;nh: 16:9</li>
	<li>
		G&oacute;c nh&igrave;n (độ): 178&deg;(Phải/Tr&aacute;i), 178&deg;(L&ecirc;n/Xuống)</li>
</ul>
<p>
	<strong>&Acirc;M THANH LCD</strong></p>
<ul>
	<li>
		C&ocirc;ng suất loa: 10Wx2</li>
	<li>
		Hệ thống loa: 2</li>
	<li>
		Hệ thống &acirc;m thanh: Dynamic / Standard / Clear Voice</li>
	<li>
		Chế độ &acirc;m thanh: Cinema/ Music/ Sports/ Game</li>
</ul>
<p>
	<strong>KẾT NỐI LCD</strong></p>
<ul>
	<li>
		Cổng HDMI: 4</li>
	<li>
		Cổng Composite: 2</li>
	<li>
		Cổng Component: 1</li>
	<li>
		Cổng AV: Ng&otilde; ra &acirc;m thanh KTS: 1 - Ng&otilde; ra &acirc;m thanh:1 (Hybrid w/HP)</li>
	<li>
		Cổng USB: 2</li>
	<li>
		Cổng Ethernet (LAN): 1</li>
</ul>
<p>
	<strong>C&Aacute;C T&Iacute;NH NĂNG KH&Aacute;C LCD</strong></p>
<ul>
	<li>
		Cảm biến &aacute;nh s&aacute;ng m&ocirc;i trường: C&oacute;</li>
	<li>
		Điện năng ti&ecirc;u thụ (LCD): 142W</li>
	<li>
		Hẹn giờ bật/tắt: C&oacute;</li>
	<li>
		Remote control: RM-GD022</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 1271x798x312 mm</li>
	<li>
		Khối lượng : 23.6 kg</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		Bộ xử l&yacute; h&igrave;nh ảnh vượt trội X-Reality&trade;</li>
	<li>
		Đ&egrave;n nền Dynamic Edge LED với Frame Dimming</li>
	<li>
		Panel 3D 4X tốc độ cao</li>
	<li>
		Chuyển động thật mượt m&agrave; với Motionflow&trade; XR 400</li>
	<li>
		Sony Entertainment Network với nhiều nội dung giải tr&iacute; phong ph&uacute; tiếng Việt v&agrave; tiếng Anh</li>
	<li>
		T&iacute;ch hợp Wi-Fi</li>
</ul>
', NULL, 38900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'49', N'8', N'3', N'49', N'SONY KLV-24EX430', N'<p>
	<strong>MODEL</strong></p>
<ul>
	<li>
		Độ lớn m&agrave;n h&igrave;nh LCD: 24&quot;(23.6&quot;), 16:9</li>
	<li>
		Hệ TV:&nbsp;Analog: B/G, D/K, I, M</li>
	<li>
		Hệ m&agrave;u: NTSC 3.58, NTSC 4.43, PAL, SECAM</li>
	<li>
		T&iacute;n hiệu Video: 480/60i, 480/60p, 576/50i, 576/50p, 720/50p, 720/60p, 1080/50i, 1080/60i, 1080/24p (HDMI&trade; only), 1080/50p (HDMI&trade; / Component), 1080/60p (HDMI&trade; / Component)</li>
</ul>
<p>
	<strong>PICTURE</strong></p>
<ul>
	<li>
		Độ ph&acirc;n giải: Cho h&igrave;nh ảnh Full HD tuyệt đẹp</li>
	<li>
		Xử l&yacute; h&igrave;nh ảnh: C&ocirc;ng nghệ xử l&yacute; h&igrave;nh ảnh&nbsp;BRAVIA Engine&nbsp;3&trade;</li>
	<li>
		Motionflow&trade;: &nbsp;-</li>
	<li>
		C&ocirc;ng nghệ đ&egrave;n nền: Đ&egrave;n nền Direct LED</li>
	<li>
		Tối ưu độ tương phản OptiContrast Panel:&nbsp;Kh&ocirc;ng</li>
	<li>
		Live Colour&trade; (m&agrave;u sắc sống động):&nbsp;C&oacute;</li>
	<li>
		M&agrave;u sắc s&acirc;u thẳm:&nbsp;Kh&ocirc;ng</li>
	<li>
		Giảm nhiễu MPEG th&ocirc;ng minh:&nbsp;Tăng cường</li>
	<li>
		T&iacute;nh năng tăng cường độ tương phản cao cấp (ACE):&nbsp;C&oacute;</li>
	<li>
		Chế độ xem phim 24P True Cinema&trade;:&nbsp;C&oacute;</li>
	<li>
		G&oacute;c nh&igrave;n: 178&deg; (Phải/Tr&aacute;i), 160&deg; (L&ecirc;n/Xuống)</li>
	<li>
		Chế độ m&agrave;n h&igrave;nh TV: TV: FULL, Normal, Wide Zoom, Zoom</li>
	<li>
		Chế độ h&igrave;nh ảnh: Vivid/ Standard/ Custom/ Cinema/ Photo/Sports/ Game/Graphics</li>
	<li>
		CineMotion/Film Mode/Cinema Drive:&nbsp;C&oacute;</li>
	<li>
		Bộ lọc lược 3D:&nbsp;C&oacute;</li>
</ul>
<p>
	<b>&Acirc;M THANH</b></p>
<ul>
	<li>
		Chế độ &acirc;m thanh: Dynamic/ Standard/ Clear Voice</li>
	<li>
		Chế độ &acirc;m thanh v&ograve;m: Cinema/ Music/ Sports/ Game</li>
	<li>
		Tăng cường &acirc;m thanh:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>C&Aacute;C NG&Otilde; CẮM</strong></p>
<ul>
	<li>
		HDMI&trade; / ng&otilde; v&agrave;o &acirc;m thanh:&nbsp;2 (2 ph&iacute;a sau)</li>
	<li>
		USB 2.0: 1 (b&ecirc;n h&ocirc;ng)</li>
	<li>
		Ng&otilde; video composite: 2 (1Rear Hybrid w/Component)</li>
	<li>
		Ng&otilde; video component (Y/Pb/Pr): &nbsp;1 (Rear Hybrid w/Composite)</li>
	<li>
		Ng&otilde; ăngten RF: &nbsp; 1 (ph&iacute;a sau)</li>
	<li>
		Cổng&nbsp;v&agrave;o&nbsp;&acirc;m thanh:&nbsp;&nbsp;1 (Rear Hybrid w/PC)</li>
	<li>
		Ng&otilde; ra &acirc;m thanh: 1(Rear/ Hybrid w HP)</li>
	<li>
		Ng&otilde; ra tai nghe: 1(Rear/ Hybrid w Audio out)</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		Kết nối đồng bộ BRAVIA Sync:&nbsp;C&oacute;</li>
	<li>
		Ph&aacute;t qua USB: C&oacute; (Video, Music, Photo) (USB hỗ trợ xem FAT16, FAT32 v&agrave; exFAT)</li>
	<li>
		Chế độ khung ảnh:&nbsp;C&oacute;</li>
	<li>
		Lựa chọn khung cảnh Photo/ Music/ Cinema/ Game/ Graphics/ Sports/ Animation</li>
	<li>
		Kh&oacute;a trẻ em:&nbsp;C&oacute;</li>
	<li>
		M&atilde; kh&oacute;a:&nbsp;C&oacute;</li>
	<li>
		Hẹn giờ tắt:&nbsp;C&oacute;</li>
	<li>
		Hẹn giờ Tắt/Mở:&nbsp;C&oacute;</li>
	<li>
		Teletext C&oacute; (2000 trang)</li>
	<li>
		PAP (h&igrave;nh v&agrave; h&igrave;nh):&nbsp;PAP (Fixed)</li>
	<li>
		Ng&ocirc;n ngữ hiển thị:English/Chinese(Simplified)/thai/Arabic/Persian/Vietnamese/French/Russian</li>
	<li>
		Xoay / nghi&ecirc;ng C&oacute; (Tr&aacute;i 15&deg;/ Phải 15&deg;) / C&oacute; (0&deg;-6&deg;)</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG BẢO VỆ M&Ocirc;I TRƯỜNG</strong></p>
<ul>
	<li>
		Điều chỉnh &aacute;nh s&aacute;ng nền sống động:&nbsp;C&oacute;</li>
	<li>
		Chế độ tắt đ&egrave;n nền:&nbsp;C&oacute;</li>
	<li>
		Cảm biến &aacute;nh s&aacute;ng:&nbsp;C&oacute;</li>
	<li>
		Chất liệu bao b&igrave;: Giấy t&aacute;i sinh (hơn 70%)</li>
</ul>
<p>
	<strong>GENERAL</strong></p>
<ul>
	<li>
		Điện năng y&ecirc;u cầu AC: AC 110-240V, 50/60Hz</li>
	<li>
		Điện năng ti&ecirc;u thụ: 38W</li>
	<li>
		K&iacute;ch thước (rộng x cao x s&acirc;u) c&oacute; kệ: 576X399X158mm</li>
	<li>
		K&iacute;ch thước (rộng x cao x s&acirc;u) kh&ocirc;ng c&oacute; kệ: 576X366X40(71)mm</li>
	<li>
		Trọng lượng c&oacute; kệ: 4.7 kg</li>
	<li>
		Trọng lượng kh&ocirc;ng c&oacute; kệ: 4.5 kg</li>
</ul>
', NULL, 4900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'5', N'3', N'3', N'5', N'Sony Tablet Z', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 02&nbsp;năm 2013</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;266 x 172 x 6.9 mm</li>
	<li>
		Trọng lượng:&nbsp;495 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung LED-backlit LCD, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;1200 x 1920 pixels, 10.1 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 10 ng&oacute;n tay)</li>
			<li>
				Sony Mobile BRAVIA Engine 2</li>
			<li>
				Mặt k&iacute;nh chống trầy xước v&agrave; chống thấm</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;Kh&ocirc;ng hỗ trợ</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Kh&ocirc;ng hỗ trợ</li>
	<li>
		Bộ nhớ trong:&nbsp;16 GB, 2GB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;microSD (TransFlash) hỗ trợ l&ecirc;n đến 64GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 107 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 296 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, 42 Mbps; HSUPA, 5.8 Mbps</li>
	<li>
		NFC:&nbsp;C&oacute;</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 a/b/g/n, dual-band, DLNA, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v4.0 với A2DP</li>
	<li>
		Hồng ngoại:&nbsp;C&oacute;</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;8.1 MP, 3264x2448 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt v&agrave; nụ cười, HDR</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 1080p@30fps, HDR</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, 2.2 MP, 1080p@30fps</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.1.2 (Jelly Bean), n&acirc;ng cấp l&ecirc;n v4.2 (Jelly Bean)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Quad-core 1.5 GHz Krait, Adreno 320 GPU</li>
	<li>
		Chipset:&nbsp;Qualcomm Snapdragon APQ8064</li>
	<li>
		Tin nhắn:&nbsp;Email, Push Mail, IM, RSS</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5</li>
	<li>
		Radio:&nbsp;Stereo FM radio với RDS</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Trắng</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS v&agrave; GLONASS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				Khả năng chống bụi v&agrave; nước theo ti&ecirc;u chuẩn IPX5/IPX7</li>
			<li>
				M&aacute;y t&iacute;nh bảng kh&ocirc;ng hỗ trợ gọi điện thoại</li>
			<li>
				Sử dụng micro-Sim</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Xem / Chỉnh sửa h&igrave;nh ảnh</li>
			<li>
				Ghi &acirc;m giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Po 6000 mAh</li>
	<li>
		Chờ:-</li>
	<li>
		Đ&agrave;m thoại:-</li>
</ul>
', NULL, 12100000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'50', N'8', N'3', N'50', N'SONY KDL-32EX650', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model : SONY KDL-32EX650 ME6</li>
	<li>
		Nh&agrave; sản xuất : SONY</li>
	<li>
		Ti&ecirc;u chuẩn: Ch&iacute;nh H&atilde;ng</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: &nbsp;24 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh:</li>
	<li>
		Địa điểm bảo h&agrave;nh:</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG CHUNG LCD</strong></p>
<ul>
	<li>
		Loại m&agrave;n h&igrave;nh LCD: LCD</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh LCD (inches): 32</li>
	<li>
		Độ ph&acirc;n giải LCD (pixels): Full HD</li>
	<li>
		Tỉ lệ m&agrave;n h&igrave;nh: 16:9</li>
	<li>
		G&oacute;c nh&igrave;n (độ): 178&deg;(Phải/Tr&aacute;i), 178&deg;(L&ecirc;n/Xuống)</li>
</ul>
<p>
	<strong>&Acirc;M THANH LCD</strong></p>
<ul>
	<li>
		C&ocirc;ng suất loa: 10Wx2</li>
	<li>
		Hệ thống loa: 2</li>
	<li>
		Hệ thống &acirc;m thanh: Dynamic / Standard / Clear Voice</li>
	<li>
		Headphone: 1</li>
</ul>
<p>
	<strong>KẾT NỐI LCD</strong></p>
<ul>
	<li>
		Cổng HDMI: 4</li>
	<li>
		Cổng Composite: 2(1 ph&iacute;a sau Hybrid w/Component)</li>
	<li>
		Cổng Component: 1(Y/Pb/Pr)</li>
	<li>
		Cổng AV: Ng&otilde; ra &acirc;m thanh KTS: 1 - Ng&otilde; ra &acirc;m thanh:1 (Hybrid w/HP)</li>
	<li>
		Cổng USB: 2</li>
	<li>
		Cổng Ethernet (LAN): 1</li>
</ul>
<p>
	<strong>C&Aacute;C T&Iacute;NH NĂNG KH&Aacute;C LCD</strong></p>
<ul>
	<li>
		Cảm biến &aacute;nh s&aacute;ng m&ocirc;i trường: C&oacute;</li>
	<li>
		Điện năng ti&ecirc;u thụ (LCD): 70W</li>
	<li>
		Hẹn giờ bật/tắt: C&oacute;</li>
	<li>
		Remote control: RM-GD023</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC &amp; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước : 753x507x219 mm</li>
	<li>
		Khối lượng : 10.2 kg</li>
</ul>
<p>
	<strong>T&Iacute;NH NĂNG KH&Aacute;C</strong></p>
<ul>
	<li>
		C&ocirc;ng nghệ xử l&yacute; h&igrave;nh ảnh vượt trội X-Reality&trade;</li>
	<li>
		Full HD 1920x1080</li>
	<li>
		Đ&egrave;n nền Edge LED</li>
	<li>
		C&ocirc;ng nghệ qu&eacute;t h&igrave;nh Motionflow&trade; XR 100</li>
	<li>
		Sony Entertainment Network với nhiều nội dung giải tr&iacute; phong ph&uacute; tiếng Việt v&agrave; tiếng Anh</li>
	<li>
		Hội thoại trực tuyến với Skype&trade; sẵn s&agrave;ng (cần trang bị th&ecirc;m camera CMU-BR100)</li>
	<li>
		Chơi game tr&ecirc;n Opera TV Store</li>
	<li>
		&Acirc;m thanh S-Force Front Surround</li>
	<li>
		Chế độ tiết kiệm điện, sản phẩm th&acirc;n thiện m&ocirc;i trường</li>
	<li>
		Kết nối Internet, chat với Skype, Duyệt web</li>
	<li>
		Kết nối th&ocirc;ng minh Wifi-Direct với điện thoại, m&aacute;y t&iacute;nh bảng</li>
	<li>
		Xoay m&agrave;n h&igrave;nh ngang</li>
</ul>
<p>
	&nbsp;</p>
<p>
	&nbsp;</p>
', NULL, 9000000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'51', N'2', N'3', N'51', N'Sony Xperia J', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 1900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 08 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;124.3 x 61.2 x 9.2 mm</li>
	<li>
		Trọng lượng:&nbsp;124 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung TFT, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;480 x 854 pixels, 4.0 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm</li>
			<li>
				Ph&iacute;m điều khiển cảm ứng</li>
			<li>
				Timescape UI</li>
			<li>
				Mặt k&iacute;nh chống trầy xước v&agrave; chống thấm</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;4 GB (2 GB sử dụng), 512 MB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;microSD (TransFlash) hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 86 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 237 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</li>
	<li>
		NFC: Kh&ocirc;ng</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, DLNA, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v2.1 với A2DP, EDR</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0 (MHL)</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;5 MP, 2592х1944 pixels, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, chống rung</li>
	<li>
		Quay phim:&nbsp;C&oacute;, VGA</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, VGA</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.0.4 (Ice Cream Sandwich)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;1 GHz Cortex-A5, Adreno 200 GPU</li>
	<li>
		Chipset:&nbsp;Qualcomm MSM7227A Snapdragon</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5, Adobe Flash</li>
	<li>
		Radio:&nbsp;Kh&ocirc;ng</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Trắng, V&agrave;ng, Hồng</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				50 GB lưu trữ tr&ecirc;n Cloud (giới hạn thời gian)</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV</li>
			<li>
				Xem văn bản</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1750 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 607 giờ (2G) / 618 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:&nbsp;L&ecirc;n đến 5 giờ 36 ph&uacute;t (2G) / 7 giờ 18 ph&uacute;t (3G)</li>
</ul>
', NULL, 5900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'52', N'1', N'3', N'52', N'Sony Xperia E Dual', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 12 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;113.5 x 61.8 x 11 mm</li>
	<li>
		Trọng lượng:&nbsp;115.7 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung TFT, 256K m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;320 x 480 pixels, 3.5 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 10 ng&oacute;n tay)</li>
			<li>
				Timescape UI</li>
			<li>
				Mặt k&iacute;nh chống trầy xước</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;4 GB (2 GB sử dụng), 512 MB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;microSD (TransFlash) hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 86 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 237 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, 7.2 Mbps; HSUPA, 5.76 Mbps</li>
	<li>
		NFC:&nbsp;Kh&ocirc;gn</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 b/g/n, DLNA, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v2.1 với EDR</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;3.15 MP, 2048x1536 pixels</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t</li>
	<li>
		Quay phim:&nbsp;C&oacute;, VGA</li>
	<li>
		Camera phụ:&nbsp;Kh&ocirc;ng</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.0.4 (Ice Cream Sandwich)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;1 GHz Cortex-A5, Adreno 200 GPU</li>
	<li>
		Chipset:&nbsp;Qualcomm MSM7227A Snapdragon</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5</li>
	<li>
		Radio:&nbsp;Stereo FM radio với RDS</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, V&agrave;ng</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS v&agrave; GLONASS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				Dual Sim (2 chế độ chờ)</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Xem / Chỉnh sửa h&igrave;nh ảnh</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1530 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 530 giờ (2G) / 530 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:&nbsp;L&ecirc;n đến 6 giờ 12 ph&uacute;t (2G) / 6 giờ 18 ph&uacute;t (3G)</li>
</ul>
', NULL, 4590000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'53', N'2', N'2', N'53', N'Iphone 6S', N'<p>
	iPhone 6s Plus l&agrave; phi&ecirc;n bản n&acirc;ng cấp ho&agrave;n hảo từ iPhone 6 Plus</p>
<p>
	với nhiều t&iacute;nh năng mới hấp dẫn.</p>
<p>
	Camera được cải tiến iPhone 6s Plus<br />
	<br />
	iPhone 6s Plus 64 GB được n&acirc;ng cấp độ ph&acirc;n giải camera sau l&ecirc;n 12 MP</p>
<p>
	(thay v&igrave; 8 MP như tr&ecirc;n iPhone 6 Plus), camera cho tốc độ lấy n&eacute;t</p>
<p>
	v&agrave; chụp nhanh, thao t&aacute;c chạm để chụp nhẹ nh&agrave;ng.</p>
<p>
	Chất lượng ảnh trong c&aacute;c điều kiện chụp kh&aacute;c nhau tốt.</p>
', NULL, 16500000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'54', N'2', N'1', N'54', N'Samsung Galaxy J7 Prime', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.5 inch (1080 x 1920 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 13.0 MP, Phụ: 8.0 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 32 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android Marshmallow 6.0.1</li>
	<li>
		<label>CPU :</label> Octa-Core 1.60GHz</li>
	<li>
		<label>K&iacute;ch thước :</label> 151.5 x 74.9 x 8.1 mm</li>
</ul>
', NULL, 6290000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'55', N'1', N'8', N'55', N'OPPO F1s', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	<span style="font-size:14px;"><span style="font-family:times new roman,times,serif;">Th&ocirc;ng số cơ bản</span></span></p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.5 inch (1280 x 720 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 13.0MP; Phụ: 16.0MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 32 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> ColorOS 3.0, nền tảng Android 5.1</li>
	<li>
		<label>Chipset :</label> MediaTek MT6750</li>
	<li>
		<label>CPU :</label> Octa-core 1.5GHz</li>
	<li>
		<label>GPU :</label> Mali-T860 MP2</li>
	<li>
		<label>K&iacute;ch thước :</label> 154.5 x 76 x 7.38 mm</li>
</ul>
', NULL, 5990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'56', N'2', N'2', N'56', N'iPhone 7 Plus 128GB', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.5 inch (1920 x 1080 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: Dual Camera 12.0MP; Phụ: 7.0MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 128 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> iOS 10</li>
	<li>
		<label>Chipset :</label> Apple A10</li>
	<li>
		<label>GPU :</label> M10</li>
	<li>
		<label>K&iacute;ch thước :</label> 158.2 x 77.9 x 7.3 mm</li>
</ul>
', NULL, 25190000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'57', N'2', N'1', N'57', N'Samsung Galaxy J5 Prime', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.0 inch 720 x 1280 Pixels</li>
	<li>
		<label>Camera :</label> 13.0MP/ 5.0MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 16 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 6.0 (Marshmallow)</li>
	<li>
		<label>CPU :</label> Quad-Core 1.4GHz</li>
	<li>
		<label>K&iacute;ch thước :</label> 142.8 x 69.5 x 8.1 mm</li>
</ul>
', NULL, 4990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'58', N'2', N'8', N'58', N'OPPO A37 (Neo 9)', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.0 inch (1280 x 720 pixels)</li>
	<li>
		<label>Camera :</label> Camera: Ch&iacute;nh 8.0 MP, Phụ 5.0MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 16 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> ColorOS 3.0(Android 5.1)</li>
	<li>
		<label>Chipset :</label> Qualcomm Snapdragon 410</li>
	<li>
		<label>CPU :</label> Quad Core 1.2 GHz</li>
	<li>
		<label>GPU :</label> Adreno 306</li>
	<li>
		<label>K&iacute;ch thước :</label> 143.1 x 71 x 7.68 mm</li>
</ul>
', NULL, 3690000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'59', N'2', N'2', N'59', N'iPhone 7 Plus 32GB', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.5 inch (1920 x 1080 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: Dual Camera 12.0MP; Phụ: 7.0MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 32 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> iOS 10</li>
	<li>
		<label>Chipset :</label> Apple A10</li>
	<li>
		<label>GPU :</label> M10</li>
	<li>
		<label>K&iacute;ch thước :</label> 158.2 x 77.9 x 7.3 mm</li>
</ul>
', NULL, 22190000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'6', N'2', N'3', N'6', N'Sony Xperia TX', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 08 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;131 x 68.6 x 8.6 mm</li>
	<li>
		Trọng lượng:&nbsp;127 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong></p>
<ul>
	<li>
		Loại:&nbsp;M&agrave;n h&igrave;nh cảm ứng điện dung TFT, 16 triệu m&agrave;u</li>
	<li>
		K&iacute;ch thước:&nbsp;720 x 1280 pixels, 4.55 inches</li>
	<li>
		M&agrave;n h&igrave;nh:
		<ul>
			<li>
				Cảm ứng đa điểm (l&ecirc;n đến 10 ng&oacute;n tay)</li>
			<li>
				Ph&iacute;m điều khiển cảm ứng</li>
			<li>
				Sony Mobile BRAVIA Engine 2</li>
			<li>
				Timescape UI</li>
			<li>
				Mặt k&iacute;nh chống trầy xước v&agrave; chống thấm</li>
			<li>
				Cảm biến &aacute;nh s&aacute;ng</li>
			<li>
				Cảm biến gia tốc</li>
			<li>
				Cảm biến con quay hồi chuyển</li>
			<li>
				Cảm biến la b&agrave;n số</li>
		</ul>
	</li>
</ul>
<p>
	<strong>&Acirc;M THANH</strong></p>
<ul>
	<li>
		Kiểu chu&ocirc;ng:&nbsp;B&aacute;o rung, nhạc chu&ocirc;ng MP3</li>
	<li>
		Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</li>
</ul>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Khả năng lưu kh&ocirc;ng giới hạn</li>
	<li>
		Bộ nhớ trong:&nbsp;16 GB, 1 GB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;microSD (TransFlash) hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;L&ecirc;n đến 86 kbps</li>
	<li>
		EDGE:&nbsp;L&ecirc;n đến 237 kbps</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA, 42 Mbps; HSUPA, 5.8 Mbps</li>
	<li>
		NFC:&nbsp;C&oacute;</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 a/b/g/n, dual-band, Wi-Fi Direct, DLNA, Wi-Fi hotspot&nbsp;</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v3.1 với A2DP</li>
	<li>
		Hồng ngoại:&nbsp;Kh&ocirc;ng</li>
	<li>
		USB:&nbsp;C&oacute;, microUSB v2.0 (MHL)</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;13 MP, autofocus, LED flash</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt v&agrave; nụ cười, chụp to&agrave;n cảnh 3D, chống rung</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 1080p@30fps, lấy n&eacute;t li&ecirc;n tục, video light, chống rung</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, 1.3 MP, 720p@30fps</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.0.4 (Ice Cream Sandwich), n&acirc;ng cấp l&ecirc;n v4.1 (Jelly Bean)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Dual-core 1.5 GHz Krait, Adreno 225 GPU</li>
	<li>
		Chipset:&nbsp;Qualcomm MSM8260A Snapdragon</li>
	<li>
		Tin nhắn:&nbsp;SMS (threaded view), MMS, Email, IM, Push Email</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5</li>
	<li>
		Radio:&nbsp;Stereo FM radio với RDS</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen, Trắng, Hồng</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS v&agrave; GLONASS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				Chỉ hỗ trợ MicroSIM</li>
			<li>
				50 GB lưu trữ tr&ecirc;n Cloud (giới hạn thời gian)</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Chống ồn với mic chuy&ecirc;n dụng</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Xem / Chỉnh sửa h&igrave;nh ảnh</li>
			<li>
				Ghi &acirc;m / Quay số bằng giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 1850 mAh</li>
	<li>
		Chờ:&nbsp;L&ecirc;n đến 300 giờ (2G) / 400 giờ (3G)</li>
	<li>
		Đ&agrave;m thoại:&nbsp;L&ecirc;n đến 6 giờ 40 ph&uacute;t (2G) / 6 giờ 40 ph&uacute;t (3G)&nbsp;<br />
		Nghe nhạc l&ecirc;n đến 18 giờ</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 12900000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'60', N'2', N'1', N'60', N'OPPO A39 (Neo 9s)', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.2 inch (720 x 1280 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 13.0 MP, Phụ: 5.0 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 32 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Adnroid 5.1</li>
	<li>
		<label>Chipset :</label> Media Tek MT6750</li>
	<li>
		<label>CPU :</label> Octa-core 1.5GHz</li>
	<li>
		<label>GPU :</label> Mali-T860 MP2</li>
	<li>
		<label>K&iacute;ch thước :</label> 149.1 x 72.9 x 7.65 mm</li>
</ul>
', NULL, 4690000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'61', N'3', N'1', N'61', N'Samsung Galaxy Tab A 7" 2016', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 7 inch, 1280 x 800 Pixels</li>
	<li>
		<label>Vi xử l&yacute; CPU :</label> Quad-core 1.5 GHz</li>
	<li>
		<label>RAM :</label> 1.5 GB</li>
	<li>
		<label>Bộ nhớ trong :</label> 8 GB</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh 5.0 MP, Phụ: 2.0 MP</li>
	<li>
		<label>Kết nối :</label> 2G, 3G, Wi-Fi, Bluetooth</li>
	<li>
		<label>Thời gian sử dụng :</label> 8 giờ</li>
	<li>
		<label>K&iacute;ch thước :</label> 186.9 x 108.8 x 8.7 mm</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 5.1</li>
</ul>
', NULL, 3590000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'62', N'2', N'9', N'62', N'Asus Zenfone 3 max 5.5 inch ZC553KL', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.5 inches IPS LCD (1080 x 1920)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 16 MP, Phụ: 8 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 32 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 6.0 (Marshmallow)</li>
	<li>
		<label>Chipset :</label> Snapdragon 430</li>
	<li>
		<label>CPU :</label> Octa-core 1.4 GHz</li>
	<li>
		<label>GPU :</label> Adreno 505</li>
	<li>
		<label>K&iacute;ch thước :</label> 151.4 x 76.24 x 8.3 mm</li>
</ul>
', NULL, 5490000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'63', N'3', N'10', N'63', N'Lenovo Yoga Book', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 10.1inch, FHD IPS, 1920 x 1200 Pixels</li>
	<li>
		<label>Vi xử l&yacute; CPU :</label> Intel&reg; Atom&trade; x5-Z8550 Processor(2M Cache, Quad-Core, Up to 2.4 GHz)</li>
	<li>
		<label>RAM :</label> 4 GB LPDDR3</li>
	<li>
		<label>Bộ nhớ trong :</label> 64 GB</li>
	<li>
		<label>Camera :</label> 8.0MP/ 2.0MP</li>
	<li>
		<label>Kết nối :</label> 2G, 3G, 4G, Wifi, Bluetooth</li>
	<li>
		<label>Thời gian sử dụng :</label> 15 giờ</li>
	<li>
		<label>K&iacute;ch thước :</label> 256.6 x 170.8 x 9.6 mm</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 6.0.1 Marshmallow</li>
</ul>
', NULL, 12990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'64', N'2', N'3', N'64', N'Sony Xperia XZ', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.2 inch( 1920 x 1080 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 23.0 MP, Phụ: 13.0 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 64 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 6.0 (Marshmallow)</li>
	<li>
		<label>Chipset :</label> Qualcomm snapdragon 820</li>
	<li>
		<label>CPU :</label> Dual-Core 2.2 &amp; Dual-Core 1.6GHz</li>
	<li>
		<label>K&iacute;ch thước :</label> 146 x 71.9 x 8.1 mm</li>
</ul>
', NULL, 14990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'65', N'2', N'1', N'65', N'Samsung Galaxy S7 Edge', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.5 inch (1440 x 2560 pixels)</li>
	<li>
		<label>Bộ nhớ trong :</label> 32 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 6.0 (Marshmallow)</li>
	<li>
		<label>Chipset :</label> Exynos 8890</li>
	<li>
		<label>CPU :</label> Octa-core</li>
	<li>
		<label>GPU :</label> Mali-T880 MP12</li>
	<li>
		<label>K&iacute;ch thước :</label> 150.9 x 72.6 x 7.7 mm</li>
</ul>
', NULL, 16990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'66', N'1', N'10', N'66', N'Lenovo IdeaPad 100-14IBD/ i3-5005U', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel Core i3-5005U Processor (3M Cache, 2.00 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 4 GB</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 1 TB</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 14 inch HD (1366 x 768)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> LAN, Wifi, Bluetooth</li>
	<li>
		<label>Pin :</label> 4 cell</li>
</ul>
', NULL, 8290000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'67', N'2', N'2', N'67', N'iPhone 5s 16GB', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 4 inch (640 x 1136 pixels )</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh : 8 MP, Phụ 1.2 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 16 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> iOS 9</li>
	<li>
		<label>Chipset :</label> Apple A7</li>
	<li>
		<label>CPU :</label> Dual-core 1.3Ghz</li>
	<li>
		<label>GPU :</label> PowerVR G6430</li>
	<li>
		<label>K&iacute;ch thước :</label> 123.8 x 58.6 x 7.6 mm</li>
</ul>
', NULL, 6999000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'68', N'2', N'1', N'68', N'Samsung Galaxy Note 5', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	&nbsp; &nbsp; Th&ocirc;ng số cơ bản</p>
<ul class="detail-main-specification">
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.7 inch (1440 x 2560 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 16.0, Phụ: 5.0 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 32 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 5.1.1 (Lollipop)</li>
	<li>
		<label>Chipset :</label> Exynos 7420</li>
	<li>
		<label>CPU :</label> Octa-core (2.1 GHz + 1.5 GHz)</li>
	<li>
		<label>GPU :</label> Mali-T760MP8</li>
	<li>
		<label>K&iacute;ch thước :</label> 153.2 x 76.1 x 7.6 mm</li>
</ul>
', NULL, 12490000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'69', N'2', N'1', N'69', N'Samsung Galaxy A9 Pro', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 6.0 inch (1080 x 1920 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 16.0 MP, Phụ: 8.0 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 32 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 6.0 (Marshmallow)</li>
	<li>
		<label>Chipset :</label> Qualcomm Snapdragon 652</li>
	<li>
		<label>CPU :</label> Octa-core 1.8 GHz</li>
</ul>
', NULL, 10990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'7', N'3', N'3', N'7', N' Sony Xperia Tablet S 3G 32GB', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Mạng 2G:&nbsp;GSM 850 / 900 / 1800 / 1900</li>
	<li>
		Mạng 3G:&nbsp;HSDPA 850 / 900 / 2100</li>
	<li>
		Ra mắt:&nbsp;Th&aacute;ng 08 năm 2012</li>
	<li>
		H&atilde;ng sản xuất: Sony</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC</strong></p>
<ul>
	<li>
		<strong>​</strong>K&iacute;ch thước:&nbsp;239.8 x 174.4 x 8.8 mm</li>
	<li>
		Trọng lượng:&nbsp;585 g</li>
</ul>
<p>
	<strong>HIỂN THỊ</strong>&lt;&gt; Ng&otilde; ra audio 3.5mm:&nbsp;C&oacute;</p>
<p>
	<strong>BỘ NHỚ</strong></p>
<ul>
	<li>
		Danh bạ:&nbsp;Khả năng lưu c&aacute;c mục v&agrave; fields kh&ocirc;ng giới hạn, danh bạ h&igrave;nh ảnh</li>
	<li>
		C&aacute;c số đ&atilde; gọi:&nbsp;Kh&ocirc;ng hỗ trợ</li>
	<li>
		Bộ nhớ trong:&nbsp;32 GB, 1GB RAM</li>
	<li>
		Khe cắm thẻ nhớ:&nbsp;SD, hỗ trợ l&ecirc;n đến 32GB</li>
</ul>
<p>
	<strong>TRUYỀN DỮ LIỆU</strong></p>
<ul>
	<li>
		GPRS:&nbsp;C&oacute;</li>
	<li>
		EDGE:&nbsp;C&oacute;</li>
	<li>
		Tốc độ 3G:&nbsp;HSDPA 14.4 Mbps, HSUPA 5.76 Mbps</li>
	<li>
		NFC:&nbsp;Kh&ocirc;ng</li>
	<li>
		WLAN:&nbsp;Wi-Fi 802.11 a/b/g/n, dual-band, Wi-Fi hotspot</li>
	<li>
		Bluetooth:&nbsp;C&oacute;, v3.0 với A2DP</li>
	<li>
		Hồng ngoại:&nbsp;C&oacute;</li>
	<li>
		USB:&nbsp;C&oacute;, v2.0</li>
</ul>
<p>
	<strong>CHỤP ẢNH</strong></p>
<ul>
	<li>
		Camera ch&iacute;nh:&nbsp;8 MP, 3264x2448 pixels, autofocus</li>
	<li>
		Đặc điểm:&nbsp;Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt</li>
	<li>
		Quay phim:&nbsp;C&oacute;, 1080p@30fps</li>
	<li>
		Camera phụ:&nbsp;C&oacute;, 1.0 MP, quay video 720p</li>
</ul>
<p>
	<strong>ĐẶC ĐIỂM</strong></p>
<ul>
	<li>
		Hệ điều h&agrave;nh:&nbsp;Android OS, v4.0.3 (Ice Cream Sandwich)</li>
	<li>
		Bộ xử l&yacute;:&nbsp;Quad-core 1.3 GHz Cortex-A9, ULP GeForce GPU</li>
	<li>
		Chipset:&nbsp;Nvidia Tegra 3</li>
	<li>
		Tin nhắn:&nbsp;Email, Push Mail, IM, RSS</li>
	<li>
		Tr&igrave;nh duyệt:&nbsp;HTML5</li>
	<li>
		Radio:&nbsp;Kh&ocirc;ng</li>
	<li>
		Tr&ograve; chơi:&nbsp;C&oacute;</li>
	<li>
		Ng&ocirc;n ngữ:&nbsp;Tiếng Anh, Tiếng Việt</li>
	<li>
		M&agrave;u sắc:&nbsp;Đen/Bạc</li>
	<li>
		Định vị to&agrave;n cầu:&nbsp;C&oacute;, hỗ trợ A-GPS</li>
	<li>
		Java:&nbsp;C&oacute;, giả lập Java MIDP</li>
	<li>
		Chức năng kh&aacute;c:
		<ul>
			<li>
				M&aacute;y t&iacute;nh bảng kh&ocirc;ng hỗ trợ cuộc gọi, gửi tin nhắn SMS, MMS</li>
			<li>
				T&iacute;ch hợp mạng x&atilde; hội</li>
			<li>
				Xem video MP4/H.263/H.264/WMV</li>
			<li>
				Nghe nhạc MP3/eAAC+/WMA/WAV/Flac</li>
			<li>
				Xem văn bản</li>
			<li>
				Xem / Chỉnh sửa h&igrave;nh ảnh</li>
			<li>
				Ghi &acirc;m&nbsp;giọng n&oacute;i</li>
			<li>
				Nhập liệu đo&aacute;n trước từ</li>
		</ul>
	</li>
</ul>
<p>
	<strong>PIN</strong></p>
<ul>
	<li>
		Pin chuẩn:&nbsp;Li-Ion 6000 mAh</li>
	<li>
		Chờ: -</li>
	<li>
		Đ&agrave;m thoại: -</li>
</ul>
<p>
	&nbsp;</p>
', NULL, 13200000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'70', N'2', N'1', N'70', N'Samsung Galaxy A7 (2016)', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.5 inch (1080 x 1920 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 13.0 MP, Phụ: 5.0 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 16 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 5.1.1 (Lollipop)</li>
	<li>
		<label>Chipset :</label> Exynos 7580</li>
	<li>
		<label>CPU :</label> Octa-core 1.6 GHz</li>
	<li>
		<label>K&iacute;ch thước :</label> 151.5 x 74.1 x 7.3 mm</li>
</ul>
', NULL, 8990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'71', N'2', N'1', N'71', N'Samsung Galaxy A5 (2016)', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 5.2 inch (1080 x 1920 pixels )</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 13.0 MP, Phụ: 5.0 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 16 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 5.1.1 (Lollipop)</li>
	<li>
		<label>CPU :</label> Octa-core 1.6 GHz</li>
	<li>
		<label>K&iacute;ch thước :</label> 144.8 x 71 x 7.3 mm</li>
</ul>
', NULL, 7290000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'72', N'2', N'1', N'72', N'Samsung Galaxy A3 2016', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 4.7 inch (1280 x 720 pixels)</li>
	<li>
		<label>Camera :</label> Ch&iacute;nh: 13.0 MP, Phụ: 5.0 MP</li>
	<li>
		<label>Bộ nhớ trong :</label> 16 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Android 5.1 Lollipop</li>
	<li>
		<label>Chipset :</label> Exynos 7578</li>
	<li>
		<label>CPU :</label> Quad-core 1.5 GHz</li>
	<li>
		<label>GPU :</label> Mali T720</li>
	<li>
		<label>K&iacute;ch thước :</label> 134.5 x 65.2 x 7.3 mm</li>
</ul>
', NULL, 5690000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'73', N'8', N'1', N'73', N'Samsung Gear S2 Sport', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Th&ocirc;ng số cơ bản</p>
<ul>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> Super AMOLED 1.2 inch (360 x 360)</li>
	<li>
		<label>Camera :</label> kh&ocirc;ng</li>
	<li>
		<label>Bộ nhớ trong :</label> 4 GB</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Tizen</li>
	<li>
		<label>CPU :</label> 1 GHz Dual-Core</li>
	<li>
		<label>K&iacute;ch thước :</label> 49.8 x 42.3 x 11.4 mm</li>
</ul>
', NULL, 6490000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'74', N'1', N'10', N'74', N'Lenovo Ideapad 100s-11IBY', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel Atom Z3735F 1.33 GHz (2M Cache, up to 1.83 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3L Bus 1333 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel&reg; HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 32 GB (eMMC)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 11.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Windows 10</li>
	<li>
		<label>Kết nối :</label> Wi-Fi, USB 2.0, HDMI, Bluetooth 4.0</li>
	<li>
		<label>Pin :</label> 2 Cell (7 giờ sử dụng)</li>
</ul>
', NULL, 3990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'75', N'1', N'9', N'75', N'Asus E200HA-FD0006TS', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Atom&trade; x5-Z8300 Processor (2M Cache, up to 1.84 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3L Bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 32 GB (eMMC)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 11.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Windows 10 + Office 365</li>
	<li>
		<label>Kết nối :</label> USB 2.0, USB 3.0</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 4890000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'76', N'1', N'10', N'76', N'Lenovo IdeaPad 110-14IBR', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3060 (2M Cache, up to 2.48 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 4 GB (DDR3L bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 14 inch (HD LED, 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> LAN, 2 x USB 3.0 1 x USB 2.0 1 x HDMI Card Reader</li>
	<li>
		<label>Pin :</label> 3 Cell</li>
</ul>
', NULL, 4990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'77', N'1', N'1', N'77', N'Asus E200HA-FD0043TS', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Atom&trade; x5-Z8350 (2M Cache, 1.44 GHz up to 1.92 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB</li>
	<li>
		<label>Đồ họa :</label> Intel&reg; HD Graphics 400</li>
	<li>
		<label>Ổ đĩa cứng :</label> 32 GB (eMMC)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 11.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Windows 10 + Office 365(D&ugrave;ng thử)</li>
	<li>
		<label>Kết nối :</label> LAN, WIFI. BLUETOOTH, USB 2.0, USB 3.0</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 4990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'78', N'1', N'9', N'78', N'Asus E402SA-WX043D/Celeron N3050/RAM 2G/HDD 500GB/', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3050 (2M Cache, up to 2.16 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3L Bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 14 inch (HD LED, 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 5090000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'79', N'1', N'9', N'79', N'Asus E402SA-WX251D', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel Celeron N3060 (2MB Cache, 1.6 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3L Bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphics 400</li>
	<li>
		<label>Ổ đĩa cứng :</label> HDD 500GB SATA</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 14 Inch LED HD (1366x768)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> LAN, Wifi, Bluetooth</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 5290000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'8', N'7', N'3', N'8', N'MP4 SONY NWZ-E473', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: MP4 SONY NWZ-E473</li>
	<li>
		M&agrave;u sắc: Đen</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN MP3 &amp; MP4</strong></p>
<ul>
	<li>
		Bộ nhớ trong MP3-MP4: 4 GB</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh: 2 inch</li>
	<li>
		Loại m&agrave;n h&igrave;nh: LED TFT</li>
	<li>
		Số b&agrave;i h&aacute;t lưu trữ: 835</li>
	<li>
		Định dạng xem video: AVC(H.264/AVC), MPEG-4, AAC-LC, WMA</li>
	<li>
		Định dạng file nhạc: MP3, WMA, AAC-LC, Linear-PCM</li>
	<li>
		Định dạng file h&igrave;nh: JPEG</li>
	<li>
		Đ&agrave;i FM: C&oacute;</li>
	<li>
		Kết nối: USB</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước: 43.3x97.2x7.4 mm</li>
	<li>
		Khối lượng: 51 gram</li>
</ul>
', NULL, 1990000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'80', N'1', N'9', N'80', N'Asus E402SA-WX098D', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3050 (2M Cache, up to 2.16 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 4 GB</li>
	<li>
		<label>Đồ họa :</label> Intel&reg; HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB (HDD)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 14 inch (HD LED, 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> 1x USB 2.0, 1x USB 3.0, 1x Type C, LAN, Wifi</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 5390000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'81', N'1', N'9', N'81', N'Asus E502SA-XX024D/Celeron N3050', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3050 (2M Cache, up to 2.16 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3L Bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphic</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 15.6 inch(HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 5390000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'82', N'1', N'10', N'82', N'Lenovo IdeaPad 100-15IBY/N2840', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel Celeron N2840 2.16 GHz (1MB cache, up to 2.58 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3 Bus 1333 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB (HDD)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Pin :</label> 4 cell</li>
</ul>
', NULL, 5490000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'83', N'1', N'9', N'83', N'Asus E502SA-XX188D/Celeron N3060', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3060 (2M Cache, up to 2.48 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3L Bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 5490000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'84', N'1', N'9', N'84', N'Asus E402SA-WX134D', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3060 (2M Cache, up to 2.48 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 4 GB (DDR3L bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 14 inch (HD LED, 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 5590000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'85', N'1', N'9', N'85', N'Acer ES1-533-C5TS', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3350 (2M Cache, up to 2.4 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 4 GB (DDR3L bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel&reg; HD Graphics 500</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> 2 x USB 2.0, 1 x USB 3.0, 1 x HDMI, 1 x Headphones/speaker</li>
	<li>
		<label>Pin :</label> 3 Cell</li>
</ul>
', NULL, 5690000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'86', N'1', N'5', N'86', N'Dell Ins 3552', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3050 (2M Cache, up to 2.16 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3L Bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphic</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Windows 10</li>
	<li>
		<label>Kết nối :</label> Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>
		<label>Pin :</label> 4 cell</li>
</ul>
', NULL, 5990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'87', N'1', N'6', N'87', N'HP Pavilion 11', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3050 (2M Cache, up to 2.16 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3L Bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB (HDD)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 11.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Windows 10</li>
	<li>
		<label>Kết nối :</label> Wi-fi,VGA, HDMI, khe cắm thẻ microSD, USB 3.0, USB 2.0, khe cắm jack 3.5mm</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 5990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'88', N'1', N'5', N'88', N'Dell Ins N3452A', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3050 (2M Cache, up to 2.16 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 2 GB (DDR3L Bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphic</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 14 inch (HD LED, 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Windows 10</li>
	<li>
		<label>Kết nối :</label> Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>
		<label>Pin :</label> 4 cell</li>
</ul>
', NULL, 5990000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'89', N'1', N'5', N'89', N'Dell Inspiron 3552', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Celeron&reg; Processor N3060 (2M Cache, up to 2.48 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 4 GB (DDR3L bus 1600 MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Windows 10</li>
	<li>
		<label>Kết nối :</label> 2 x USB 2.0, HDMI, USB 3.0</li>
	<li>
		<label>Pin :</label> 4 cell</li>
</ul>
', NULL, 6490000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'9', N'7', N'3', N'9', N'MP4 SONY NWZ-E463/B', N'<p>
	<strong>TH&Ocirc;NG TIN CHUNG</strong></p>
<ul>
	<li>
		Model: MP4 SONY NWZ-E473</li>
	<li>
		M&agrave;u sắc: Đen</li>
	<li>
		Nh&agrave; sản xuất: SONY</li>
</ul>
<p>
	<strong>BẢO H&Agrave;NH</strong></p>
<ul>
	<li>
		Thời gian bảo h&agrave;nh: 12 th&aacute;ng</li>
	<li>
		Quy định bảo h&agrave;nh: Moonly Center</li>
	<li>
		Địa điểm bảo h&agrave;nh:&nbsp;Moonly Center</li>
</ul>
<p>
	<strong>TỔNG QUAN MP3 &amp; MP4</strong></p>
<ul>
	<li>
		Bộ nhớ trong MP3-MP4: 4 GB</li>
	<li>
		K&iacute;ch thước m&agrave;n h&igrave;nh: 2 inch</li>
	<li>
		Loại m&agrave;n h&igrave;nh: LED TFT</li>
	<li>
		Số b&agrave;i h&aacute;t lưu trữ: 845 (128kbps)</li>
	<li>
		Định dạng xem video: H.264/AVC, MPEG-4, AAC-LC Video, WMA</li>
	<li>
		Định dạng file nhạc: MP3, WMA, AAC-LC, Linear-PCM</li>
	<li>
		Định dạng file h&igrave;nh: JPEG</li>
	<li>
		Đ&agrave;i FM: C&oacute;</li>
	<li>
		Kết nối: USB</li>
</ul>
<p>
	<strong>K&Iacute;CH THƯỚC V&Agrave; KHỐI LƯỢNG</strong></p>
<ul>
	<li>
		K&iacute;ch thước: 45x96.8x10 mm</li>
	<li>
		Khối lượng: 58 gram</li>
</ul>
', NULL, 1990000, 1)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'90', N'1', N'6', N'90', N'HP 15-ay071TU', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Pentium&reg; Processor N3710 (2M Cache, up to 2.56 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 4 GB(DDR3L bus 1600MHz)</li>
	<li>
		<label>Đồ họa :</label> Intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>
		<label>Pin :</label> 4 cell</li>
</ul>
', NULL, 6590000, 0)
INSERT [dbo].[Product] ([ID], [Category_ID], [Supplier_ID], [Product_Image_ID], [Name], [Description], [Cost], [Price], [Continued]) VALUES (N'91', N'1', N'1', N'91', N'Asus E502SA-XX070D', N'<h3 class="detail-title">
	Th&ocirc;ng số kỹ thuật</h3>
<p>
	Cấu h&igrave;nh nổi bật</p>
<ul>
	<li>
		<label>Bộ vi xử l&yacute; :</label> Intel&reg; Pentium&reg; Processor N3700 (2M Cache, up to 2.40 GHz)</li>
	<li>
		<label>Bộ nhớ RAM :</label> 4 GB(DDR3L bus 1600MHz)</li>
	<li>
		<label>Đồ họa :</label> intel HD Graphics</li>
	<li>
		<label>Ổ đĩa cứng :</label> 500 GB(HDD 5400rpm)</li>
	<li>
		<label>M&agrave;n h&igrave;nh :</label> 15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>
		<label>Hệ điều h&agrave;nh :</label> Free DOS</li>
	<li>
		<label>Kết nối :</label> LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>
		<label>Pin :</label> 2 Cell</li>
</ul>
', NULL, 6690000, 0)
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductImage] FOREIGN KEY([Product_Image_ID])
REFERENCES [dbo].[Product_Image] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductImage]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
