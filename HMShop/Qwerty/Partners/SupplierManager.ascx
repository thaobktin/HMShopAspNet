<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SupplierManager.ascx.cs" Inherits="HMShop.Qwerty.Partners.SupplierManager" %>

<%@ Import Namespace="HM.Common" %>
<%@ Register TagPrefix="dgridCtrl" Namespace="HM.Control" Assembly="HM.Control" %>

<asp:label ID="lblStatus" runat="server" style="text-align: center;"></asp:label>

<table id="tblDetails" style="width: 50%; height: 15%; border: 0px; text-align: center;" >
	<tr>
		<td style="width: 25%; text-align:left;">ID</td>
		<td>
            <asp:TextBox ID="txtId" style="width: 95%;" runat="server"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 25%; text-align:left;">Tên nhà cung cấp</td>
		<td><asp:TextBox ID="txtName" style="width: 95%;" runat="server"></asp:TextBox>
		</td>
	</tr>
    <tr>
		<td style="width: 25%; text-align:left;">Địa chỉ</td>
		<td><asp:TextBox ID="txtAddress" style="width: 95%;" runat="server"></asp:TextBox>
		</td>
	</tr>
    <tr>
		<td style="width: 25%; text-align:left;">Số điện thoại</td>
		<td><asp:TextBox ID="txtPhone" style="width: 95%;" runat="server"></asp:TextBox>
		</td>
	</tr>
    <tr>
		<td style="width: 25%; text-align:left;">Số fax</td>
		<td><asp:TextBox ID="txtFax" style="width: 95%;" runat="server"></asp:TextBox>
		</td>
	</tr>
    <tr>
		<td style="width: 25%; text-align:left;">Websites</td>
		<td><asp:TextBox ID="txtWebsite" style="width: 95%;" runat="server"></asp:TextBox>
		</td>
	</tr>
            
    <tr>
	    <td colspan="2" align="center">
		    <asp:button ID="cmdUpdate" CssClass="btn btn-small btn-primary" runat="server" Text="Cập nhật" onclick="cmdUpdate_Click" CausesValidation="False"></asp:button>
		    <asp:button ID="cmdAddNew" CssClass="btn btn-small btn-danger" runat="server" Text="Thêm mới" onclick="cmdAddNew_Click" CausesValidation="False"></asp:button>
		    <asp:button ID="cmdEmpty" CssClass="btn btn-small btn-success" runat="server" Text="Hủy" onclick="cmdEmpty_Click" CausesValidation="False"></asp:button>
	    </td>
    </tr>
</table>
<br />
<table cellSpacing="0" cellPadding="0" style="width: 100%; height: 85%; border: 0px;" >
    <tr>
        <td>
            <dgridCtrl:DataGrid  ID="dtgSuppliers" CssClass="table table-striped table-bordered table-hover" style="width: 80%;" 
                AutoGenerateColumns="False" AllowPaging="True" PageSize="15" runat="server" CellPadding="2" 
                OnItemCommand="dtgSuppliers_ItemCommand" OnItemDataBound="dtgSuppliers_ItemDataBound">
			<AlternatingItemStyle CssClass="DarkRow"></AlternatingItemStyle>
			<ItemStyle CssClass="LightRow"></ItemStyle>
			<HeaderStyle Font-Bold="True" CssClass="HeaderRow"></HeaderStyle>
			<Columns>
				<asp:BoundColumn DataField="ID" HeaderText="ID" Visible="true">
                    <HeaderStyle Width="5%"></HeaderStyle>
				</asp:BoundColumn>
				<asp:BoundColumn DataField="Name" HeaderText="Tên nhà cung cấp">
					<HeaderStyle Width="45%"></HeaderStyle>
				</asp:BoundColumn>
                <asp:BoundColumn DataField="Address" HeaderText="Địa chỉ">
					<HeaderStyle Width="45%"></HeaderStyle>
				</asp:BoundColumn>
                <asp:BoundColumn DataField="Phone" HeaderText="Số điện thoại">
					<HeaderStyle Width="45%"></HeaderStyle>
				</asp:BoundColumn>
                <asp:BoundColumn DataField="Fax" HeaderText="Số fax">
					<HeaderStyle Width="45%"></HeaderStyle>
				</asp:BoundColumn>
                <asp:BoundColumn DataField="Website" HeaderText="Website">
					<HeaderStyle Width="45%"></HeaderStyle>
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
			</Columns>
			<PagerStyle Mode="NumericPages"></PagerStyle>
		</dgridCtrl:DataGrid>
        </td>
    </tr>
</table>