<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryManager.ascx.cs" Inherits="HMShop.Qwerty.Products.CategoryManager" %>

<%@ Register TagPrefix="dgridCtrl" Namespace="HM.Control" Assembly="HM.Control" %>

<asp:label ID="lblStatus" runat="server" style="text-align: center;"></asp:label>
<%--<div id="catDetail" class="table table-striped table-bordered table-hover" 
    style="width: 50%; height: 15%; border: 0px; text-align: center;">

</div>--%>
<table id="tblDetails" style="width: 50%; height: 15%; border: 0px; text-align: center;" >
	<tr>
		<td style="width: 25%; text-align:left;">ID</td>
		<td>
            <asp:TextBox ID="txtCategoryId" style="width: 95%;" runat="server"></asp:TextBox>
            <%--<asp:TextBox id="txtID" style="width: 95%;" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>--%>
		</td>
	</tr>
	<tr>
		<td style="width: 25%; text-align:left;">Tên danh mục</td>
		<td><asp:TextBox ID="txtCategoryName" style="width: 95%;" runat="server"></asp:TextBox>
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
            <dgridCtrl:DataGrid  ID="dtgCategories" CssClass="table table-striped table-bordered table-hover" style="width: 80%;" 
                AutoGenerateColumns="False" AllowPaging="True" PageSize="15" runat="server" CellPadding="2" 
                OnItemCommand="dtgCategories_ItemCommand" OnItemDataBound="dtgCategories_ItemDataBound">
			<AlternatingItemStyle CssClass="DarkRow"></AlternatingItemStyle>
			<ItemStyle CssClass="LightRow"></ItemStyle>
			<HeaderStyle Font-Bold="True" CssClass="HeaderRow"></HeaderStyle>
			<Columns>
				<asp:BoundColumn DataField="ID" HeaderText="ID" Visible="true">
                    <HeaderStyle Width="5%"></HeaderStyle>
				</asp:BoundColumn>
				<asp:BoundColumn DataField="Name" HeaderText="Tên danh mục">
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