<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CacheManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.CacheManager" %>

<table class="SidePanel" cellSpacing="0" cellPadding="5" style="width: 80%; border: 0px;" align="center">
	<tr>
		<td><h3>Tên Cache</h3></td>
	</tr>
	<tr>
		<td><asp:ListBox id="lstBCaches" CssClass="InputBox" runat="server" SelectionMode="Multiple" 
            style="width:100%; height: 50%;"></asp:ListBox>
		</td>
	</tr>
	<tr>
		<td style="height: 40px;" align="center">
			<asp:Button id="cmdRemover" CssClass="btn btn-small btn-primary" runat="server" Text="Xóa bộ đệm" onclick="cmdRemover_Click"></asp:Button>
			<asp:Button id="cmdRemoverAll" CssClass="btn btn-small btn-yellow" runat="server" Text="Xóa toàn bộ" onclick="cmdRemoverAll_Click"></asp:Button>
			<asp:Button id="cmdCancel" CssClass="btn btn-small btn-success" runat="server" Text="Bỏ qua"></asp:Button>
		</td>
	</tr>
</table>