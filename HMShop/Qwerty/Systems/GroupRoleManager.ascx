<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupRoleManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.GroupRoleManager" %>

<table id="tblGroupRole" style="width: 600px; border: 0px;" cellSpacing="0" cellPadding="0" align="center" >
	<tr>
		<td width="20%">Nhóm</td>
		<td><asp:Label id="txtGroupName" runat="server" ForeColor="Red"></asp:Label></td>
		<td align="right" width="20%">
			<asp:Button id="cmdBack" Width="60px" runat="server" Text="Trở lại" onclick="cmdBack_Click"></asp:Button>
		</td>
	</tr>
</table>
<br />
<table class="SidePanel" id="tblGroupRoleList" style="width: 600px; border: 0px;" cellSpacing="0" cellPadding="5" align="center" >
	<tr align="center">
		<td width="50%">Quyền nhóm</td>
		<td width="50"></td>
		<td width="50%">Danh sách</td>
	</tr>
	<tr align="center">
		<td><asp:ListBox id="lstGroupRoles" SelectionMode="Multiple" Rows="15" Width="100%" runat="server"></asp:ListBox></td>
		<td vAlign="middle">
			<asp:Button id="cmdAdd" Width="45px" runat="server" Text="<<" onclick="cmdAdd_Click"></asp:Button>
            <br />
			<br />
			<asp:Button id="cmdRemover" Width="45px" runat="server" Text=">>" onclick="cmdRemover_Click"></asp:Button>
		</td>
		<td><asp:ListBox id="lstRoles" SelectionMode="Multiple" Rows="15" Width="100%" runat="server"></asp:ListBox></td>
	</tr>
	<tr>
		<td colSpan="3"><asp:label id="lblUpdateStatus" runat="server"></asp:label></td>
	</tr>
</table>