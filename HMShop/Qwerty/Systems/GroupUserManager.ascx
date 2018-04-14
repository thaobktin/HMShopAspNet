<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupUserManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.GroupUserManager" %>

<table id="tblMember" style="width: 600px; border: 0px;" cellSpacing="0" cellPadding="0" align="center" >
	<tr>
		<td width="20%">Nhóm</td>
		<td>
			<asp:Label id="txtGroupName" runat="server" ForeColor="Red"></asp:Label></td>
		<td align="right" width="20%">
			<asp:Button id="cmdBack" runat="server" Text="Trở lại" Width="60px" onclick="cmdBack_Click"></asp:Button></td>
	</tr>
</table>
<br />
<table class="SidePanel" id="tblMemberList" style="width: 600px; border: 0px;" cellSpacing="0" cellPadding="5" align="center">
	<tr align="center">
		<td width="50%">Thành viên</td>
		<td width="50"></td>
		<td width="50%">Danh sách</td>
	</tr>
	<tr align="center">
		<td>
			<asp:ListBox id="lstGroupMembers" runat="server" Width="100%" SelectionMode="Multiple" Rows="15"></asp:ListBox>
		</td>
		<td vAlign="middle">
			<asp:Button id="cmdAdd" runat="server" Text="<<" Width="45px" onclick="cmdAdd_Click"></asp:Button>
            <br />
			<br />
			<asp:Button id="cmdRemover" runat="server" Text=">>" Width="45px" onclick="cmdRemover_Click"></asp:Button>
		</td>
		<td><asp:ListBox id="lstUsers" runat="server" Width="100%" SelectionMode="Multiple" Rows="15"></asp:ListBox></td>
	</tr>
	<tr>
		<td colSpan="3"><asp:label id="lblUpdateStatus" runat="server"></asp:label></td>
	</tr>
</table>