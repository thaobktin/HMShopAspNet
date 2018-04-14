<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CmdManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.CmdManager" %>

<table cellSpacing="0" cellPadding="0" style="width: 100%; height: 100%; border: 0px;" >
	<tr>
		<td vAlign="top" style="width: 30%;">
			<asp:TreeView ID="treFunction" runat="server" CssClass="ym-vlist" 
                OnSelectedNodeChanged="treFunction_SelectedNodeChanged" >
            </asp:TreeView>
        </td>
		<td style="width: 50px;"></td>
		<td vAlign="top" style="width: 70%;">
			<table class="table table-striped table-bordered table-hover" id="Table3">
				<tr>
					<td colSpan="2"><asp:Label id="lblUpdateStatus" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td style="width: 25%;">ID</td>
					<td><asp:TextBox id="txtID" style="width: 95%;" runat="server" Enabled="False"></asp:TextBox></td>
				</tr>
				<tr>
					<td style="width: 25%;">Tên</td>
					<td>
						<asp:TextBox id="txtName" style="width: 95%;" runat="server"></asp:TextBox>
						<%--<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" Display="Dynamic" 
                            ControlToValidate="txtName" ErrorMessage="(*)"></asp:RequiredFieldValidator>--%>
					</td>
				</tr>
				<tr>
					<td style="width: 25%;">Lệnh</td>
					<td><asp:TextBox id="txtCmd" style="width: 95%;" runat="server"></asp:TextBox></td>
				</tr>
				<tr>
					<td style="width: 25%;">Link Url</td>
					<td><asp:TextBox id="txtUrl" style="width: 95%;" runat="server"></asp:TextBox></td>
				</tr>
				<tr>
					<td style="width: 25%;">Đường dẫn</td>
					<td>
						<asp:TextBox id="txtPath" style="width: 95%;" runat="server"></asp:TextBox></td>
				</tr>
				<tr>
					<td style="width: 25%;">Cha</td>
					<td><asp:DropDownList id="dropParent" style="width: 40%;" runat="server"></asp:DropDownList></td>
				</tr>
				<tr>
					<td style="width: 25%;">Thứ tự</td>
					<td><asp:DropDownList id="dropIndex" style="width: 20%;" runat="server"></asp:DropDownList></td>
				</tr>
				<tr>
					<td style="width: 25%;">Hoạt động</td>
					<td><asp:CheckBox id="chkEnable" CssClass="input" runat="server" Checked="True"></asp:CheckBox></td>
				</tr>
				<tr>
					<td style="width: 25%;">Hiện thị</td>
					<td><asp:CheckBox id="chkVisble" CssClass="input" runat="server" Checked="True"></asp:CheckBox></td>
				</tr>
			</table>
			<br />
            <br />
			<table class="SidePanel" id="Table2" cellSpacing="0" cellPadding="3" style="width: 100%; height: 35px; border: 0px;" >
				<tr>
					<td align="center">
						<asp:Button id="cmdUpdate" CssClass="btn btn-primary" runat="server" Text="Cập nhật" OnClick="cmdUpdate_Click" ></asp:Button>
						<asp:Button id="cmdAddNew" CssClass="btn btn-pink" runat="server" Text="Thêm mới" OnClick="cmdAddNew_Click"></asp:Button>
						<asp:Button id="cmdDelete" CssClass="btn btn-red" runat="server" Text="Xóa" OnClick="cmdDelete_Click"></asp:Button>
						<asp:Button id="cmdEmpty" CssClass="btn btn-yellow" runat="server" Text="Hủy" CausesValidation="False" OnClick="cmdEmpty_Click"></asp:Button>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>