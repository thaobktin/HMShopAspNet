<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserRoleManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.UserRoleManager" %>

<%@ Register TagPrefix="webCtrl" Namespace="HM.WebControls" Assembly="HM.WebControls" %>

<table style="border: 0px; width: 80%;" cellSpacing="0" cellPadding="0" align="center">
	<tr>
		<td style="width: 20%;">Người dùng</td>
		<td style="width: 60%;">
			<asp:Label id="lblUserEmail" runat="server" ForeColor="Red"></asp:Label>
		</td>
		<td align="right" style="width: 20%;">
			<asp:Button id="cmdBack" runat="server" Text="Trở lại" Width="60px" onclick="cmdBack_Click"></asp:Button>
		</td>
	</tr>
</table>
<br />

<table style="border: 0px; width: 80%;" cellSpacing="0" cellPadding="5" align="center" class="SidePanel">
	<tr align="center">
		<td style="width: 45%;">Quyền người dùng</td>
		<td style="width: 10%;"></td>
		<td style="width: 45%;">Danh sách</td>
	</tr>
	<tr align="center">
		<td style="width: 45%;">
			<asp:ListBox id="lstUserRoles" runat="server" SelectionMode="Multiple" Rows="15"></asp:ListBox>
		</td>
		<td valign="middle" style="width: 5%;">
			<asp:Button id="cmdAdd" runat="server" Text="<<" Width="50%" onclick="cmdAdd_Click"></asp:Button>
			<br />
			<asp:Button id="cmdRemover" runat="server" Text=">>" Width="50%" onclick="cmdRemover_Click"></asp:Button>
		</td>
		<td style="width: 45%;">
			<asp:ListBox id="lstRoles" runat="server" SelectionMode="Multiple" Rows="15"></asp:ListBox>
		</td>
	</tr>
	<tr>
		<td colspan="3"><asp:label id="lblUpdateStatus" runat="server"></asp:label></td>
	</tr>
</table>