<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.GroupManager" %>

<div style="text-align: center; width:70%;">
    <asp:DataGrid id="dtgGroups" CssClass="table table-striped table-bordered table-hover"  
        CellPadding="2" runat="server" AutoGenerateColumns="False" 
        OnItemCommand="dtgGroups_ItemCommand" OnItemDataBound="dtgGroups_ItemDataBound" >
		<AlternatingItemStyle CssClass="DarkRow"></AlternatingItemStyle>
		<ItemStyle CssClass="LightRow"></ItemStyle>
		<HeaderStyle Font-Bold="True" CssClass="HeaderRow"></HeaderStyle>
		<Columns>
			<asp:BoundColumn Visible="False" DataField="Group_ID" HeaderText="ID"></asp:BoundColumn>
			<asp:BoundColumn DataField="Group_Name" HeaderText="Tên nhóm">
				<HeaderStyle Width="90%"></HeaderStyle>
			</asp:BoundColumn>
			<asp:TemplateColumn>
				<HeaderStyle Width="1%"></HeaderStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<ItemTemplate>
					<asp:Button id="cmdEdit" CssClass="btn btn-small btn-info" runat="server"
                        CommandName="edit" Text="Sửa" CausesValidation="False"></asp:Button>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<HeaderStyle Width="1%"></HeaderStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<ItemTemplate>
					<asp:Button id="cmdDel" CssClass="btn btn-small btn-yellow" runat="server" 
                        CommandName="del" Text="Xóa" CausesValidation="False"></asp:Button>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<HeaderStyle Width="1%"></HeaderStyle>
				<ItemTemplate>
					<asp:Button id="cmdMember" CssClass="btn btn-small btn-purple" runat="server" 
                        CommandName="members" Text="Thành viên" CausesValidation="False"></asp:Button>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<HeaderStyle Width="1%"></HeaderStyle>
				<ItemTemplate>
					<asp:Button id="cmdRole" CssClass="btn btn-small btn-pink" runat="server" 
                        CommandName="roles" Text="Phân quyền" CausesValidation="False"></asp:Button>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<PagerStyle Mode="NumericPages"></PagerStyle>
	</asp:DataGrid>
</div>

<table class="SidePanel" id="tblGroup" style="width: 50%; border: 0px; "cellSpacing="0" cellPadding="5" align="center">
	<tr>
		<td colspan="2"><asp:label id="lblUpdateStatus" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td style="width: 20%;"></td>
		<td><asp:TextBox id="txtID" runat="server" style="width: 50%;" Visible="False"></asp:TextBox></td>
	</tr>
	<tr>
		<td style="width: 20%;">Tên nhóm</td>
		<td>
			<asp:TextBox id="txtName" runat="server" style="width: 70%;"></asp:TextBox>
			<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" 
                ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<td style="width: 20%;">Mô tả</td>
		<td><asp:TextBox id="txtDes" runat="server" style="width: 70%;" Rows="2" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td style="width: 20%;"></td>
		<td>
			<asp:button id="cmdUpdate" runat="server" CssClass="btn btn-small btn-primary" Text="Cập nhật" onclick="cmdUpdate_Click"></asp:button>
			<asp:button id="cmdAddNew" runat="server" CssClass="btn btn-small btn-danger" Text="Thêm mới" onclick="cmdAddNew_Click"></asp:button>
			<asp:button id="cmdCancel" runat="server" CssClass="btn btn-small btn-success" Text="Hủy" CausesValidation="False" onclick="cmdCancel_Click"></asp:button>
		</td>
	</tr>
</table>