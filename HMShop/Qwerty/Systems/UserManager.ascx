<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.UserManager" %>

<%@ Register TagPrefix="dgridCtrl" Namespace="HM.Control" Assembly="HM.Control" %>

<table cellSpacing="0" cellPadding="0" style="width: 100%; height: 100%; border: 0px;" >
<tr>
	<td vAlign="top" style="width: 60%;">
		<dgridCtrl:DataGrid  id="dtgUsers" CssClass="table table-striped table-bordered table-hover" style="width: 90%;" 
            AutoGenerateColumns="False" AllowPaging="True" PageSize="15" runat="server" CellPadding="2" 
            OnItemCommand="dtgUsers_ItemCommand" OnItemDataBound="dtgUsers_ItemDataBound">
			<AlternatingItemStyle CssClass="DarkRow"></AlternatingItemStyle>
			<ItemStyle CssClass="LightRow"></ItemStyle>
			<HeaderStyle Font-Bold="True" CssClass="HeaderRow"></HeaderStyle>
			<Columns>
				<asp:BoundColumn DataField="ID" HeaderText="ID" Visible="False">
				</asp:BoundColumn>
				<asp:BoundColumn DataField="Email" HeaderText="Email">
					<HeaderStyle Width="25%"></HeaderStyle>
				</asp:BoundColumn>
				<asp:BoundColumn DataField="FullName" HeaderText="Tên">
					<HeaderStyle Width="30%"></HeaderStyle>
				</asp:BoundColumn>
				<asp:TemplateColumn>
					<HeaderStyle Width="1%"></HeaderStyle>
					<ItemStyle HorizontalAlign="Center"></ItemStyle>
					<ItemTemplate>
						<asp:Button id="cmdEdit" CssClass="btn btn-small btn-info" CausesValidation="False" 
                            CommandName="edit" runat="server" Text="Sửa" ></asp:Button>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<HeaderStyle Width="1%"></HeaderStyle>
					<ItemStyle HorizontalAlign="Center"></ItemStyle>
					<ItemTemplate>
						<asp:Button id="cmdDel" CssClass="btn btn-small btn-yellow" CausesValidation="False" 
                            CommandName="del" runat="server" Text="Xóa" ></asp:Button>
					</ItemTemplate>
				</asp:TemplateColumn>
				<asp:TemplateColumn>
					<HeaderStyle Width="1%"></HeaderStyle>
					<ItemTemplate>
						<asp:Button id="cmdRole" CssClass="btn btn-small btn-grey" CausesValidation="False" 
                            CommandName="roles" runat="server" Text="Phân quyền"></asp:Button>
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
			<PagerStyle Mode="NumericPages"></PagerStyle>
		</dgridCtrl:DataGrid>
	</td>
	
	<td vAlign="top" style="width: 40%;">
		<table class="table table-striped table-bordered table-hover" style="width: 100%; height: 100%; border: 0px;" >
			<tr>
				<td colSpan="2"><asp:label id="lblUpdateStatus" runat="server"></asp:label></td>
			</tr>
			<tr>
				<td style="width: 25%;"></td>
				<td><asp:textbox id="txtID" style="width: 95%;" runat="server" Enabled="False" Visible="False"></asp:textbox></td>
			</tr>
			<tr>
				<td style="width: 25%;">Email</td>
				<td><asp:textbox id="txtEmail" style="width: 95%;" runat="server"></asp:textbox>
                    <asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" ErrorMessage="(*)" 
                        ControlToValidate="txtEmail" Display="Dynamic"></asp:requiredfieldvalidator>
					<asp:regularexpressionvalidator id="RegularExpressionValidator2" runat="server" ErrorMessage="(*)" 
                        ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">(*)
					</asp:regularexpressionvalidator>
				</td>
			</tr>
            <tr>
				<td style="width: 25%;">Email Confirmed</td>
                <td><asp:checkbox id="chkEmailConfirm" runat="server"></asp:checkbox></td>
			</tr>
			<tr>
				<td style="width: 25%;">Họ tên</td>
				<td><asp:textbox id="txtFullName" style="width: 95%;" runat="server"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtFullName" ErrorMessage="(*)" Display="Dynamic"></asp:requiredfieldvalidator>
				</td>
			</tr>
            <tr>
				<td style="width: 25%;">Tên đăng nhập</td>
				<td><asp:textbox id="txtLoginName" style="width: 95%;" runat="server"></asp:textbox>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtLoginName" ErrorMessage="(*)" Display="Dynamic"></asp:requiredfieldvalidator>
				</td>
			</tr>
			<tr>
				<td style="width: 25%;">Mật khẩu</td>
				<td><asp:textbox id="txtPassword" style="width: 95%;" runat="server" TextMode="Password"></asp:textbox></td>
			</tr>
			<tr>
				<td style="width: 25%;">Giới tính</td>
				<td><asp:dropdownlist id="dropGender" style="width: 25%;" runat="server">
						<asp:ListItem Value="1">Nam</asp:ListItem>
						<asp:ListItem Value="0">Nữ</asp:ListItem>
					</asp:dropdownlist>
				</td>
			</tr>
			<tr>
				<td style="width: 25%;">Địa chỉ</td>
				<td><asp:textbox id="txtAddress" style="width: 95%;" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<td style="width: 25%;">Ngày sinh</td>
				<td><asp:textbox id="txtBirthDay" style="width: 95%;" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<td style="width: 25%;">Điện thoại</td>
				<td><asp:textbox id="txtPhone" style="width: 95%;" runat="server"></asp:textbox></td>
			</tr>
			<tr>
				<td style="width: 25%;">Super Admin</td>
				<td><asp:checkbox id="chkIsSuperAdmin" runat="server"></asp:checkbox></td>
			</tr>
			<tr>
				<td style="width: 25%;">Nhóm</td>
				<td><asp:listbox id="lstGroups" style="width: 95%;" runat="server" Rows="5" SelectionMode="Multiple"></asp:listbox></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<asp:button id="cmdUpdate" CssClass="btn btn-small btn-primary" runat="server" Text="Cập nhật" onclick="cmdUpdate_Click"></asp:button>
					<asp:button id="cmdAddNew" CssClass="btn btn-small btn-danger" runat="server" Text="Thêm mới" onclick="cmdAddNew_Click"></asp:button>
					<asp:button id="cmdEmpty" CssClass="btn btn-small btn-success" runat="server" Text="Hủy" CausesValidation="False" onclick="cmdEmpty_Click"></asp:button>
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>