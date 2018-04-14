<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserProfileManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.UserProfileManager" %>

<table style="margin-left:270px;" class="Area" id="tblUserProfile" cellSpacing="0" cellPadding="5" width="500" border="0">
	<tr>
		<td colSpan="2"><asp:label id="lblUpdateStatus" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td width="20%">Email</td>
		<td><asp:textbox id="txtEmail" runat="server" Width="296px" Enabled="False"></asp:textbox></td>
	</tr>
	<tr>
		<td>Họ tên</td>
		<td>
			<asp:textbox id="txtFullName" runat="server" Width="296px"></asp:textbox>
			<asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" 
                ControlToValidate="txtFullName" Display="Dynamic"></asp:requiredfieldvalidator>
		</td>
	</tr>
	<tr>
		<td>Giới tính</td>
		<td>
			<asp:dropdownlist id="dropGender" runat="server" Width="296px">
				<asp:ListItem Value="1">Nam</asp:ListItem>
				<asp:ListItem Value="0">Nữ</asp:ListItem>
			</asp:dropdownlist>
		</td>
	</tr>
	<tr>
		<td>Địa chỉ</td>
		<td><asp:textbox id="txtAddress" runat="server" Width="296px"></asp:textbox></td>
	</tr>
	<tr>
		<td>Ngày sinh</td>
		<td><asp:textbox id="txtBirthDay" runat="server" Width="296px"></asp:textbox></td>
	</tr>
	<tr>
		<td>Điện thoại</td>
		<td><asp:textbox id="txtPhone" runat="server" Width="296px"></asp:textbox></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>
			<asp:button id="cmdUpdate" runat="server" CssClass="btn btn-primary btn-small" Text="Cập nhật" onclick="cmdUpdate_Click"></asp:button>
			<asp:button id="cmdBack" runat="server" CssClass="btn btn-success btn-small" Text="Trở lại" CausesValidation="False" onclick="cmdBack_Click"></asp:button>
		</td>
	</tr>
</table>