<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SettingManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.SettingManager" %>

<table class="Area" id="tblSetting" cellSpacing="0" cellPadding="5" align="center" style="width: 600px; border: 0px;">
	<tr>
		<td colSpan="2"><asp:Label id="lblStatusUpdate" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td style="width: 30%;">Tên website</td>
		<td>
			<asp:TextBox id="txtWebTitle" runat="server" Width="280px"></asp:TextBox></td>
	</tr>
	<tr>
		<td style="width: 30%;">Mail Server</td>
		<td><asp:TextBox id="txtMailServer" runat="server" Width="280px"></asp:TextBox></td>
	</tr>
	<tr>
		<td style="width: 30%;">Thời gian cache</td>
		<td><asp:TextBox id="txtDefaultCacheExpire" runat="server" Width="280px"></asp:TextBox>&nbsp;(h)</td>
	</tr>
	<tr>
		<td style="width: 30%;" colspan="2">Tối ưu tìm kiếm</td>
	</tr>
	<tr>
		<td colspan="2"><asp:TextBox id="txtMetaSearch" runat="server" Width="100%" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
	</tr>
	<tr>
		<td></td>
		<td>
			<asp:Button id="cmdUpdate" runat="server" CssClass="btn btn-small btn-primary" Text="Cập nhật" onclick="cmdUpdate_Click">
			</asp:Button>
			<asp:Button id="cmdBack" runat="server" CssClass="btn btn-success btn-small" Text="Trở lại" onclick="cmdBack_Click">
			</asp:Button>
		</td>
	</tr>
</table>