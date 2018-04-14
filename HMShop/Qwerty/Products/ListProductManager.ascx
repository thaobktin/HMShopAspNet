<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListProductManager.ascx.cs" Inherits="HMShop.Qwerty.Products.ListProductManager" %>

<%@ Import Namespace="HM.Common" %>
<%@ Register TagPrefix="dgridCtrl" Namespace="HM.Control" Assembly="HM.Control" %>

<asp:label id="lblError" runat="server" style="text-align: center;"></asp:label>
<br />
<div style="width:45%; padding: 0px 0px 5px 35px; display: inline-block;">
    <table>
        <tr>
            <td>
                <asp:Button ID="btnAddProduct" CssClass="btn btn-small btn-primary" runat="server" 
                    Text="Thêm Sản Phẩm" OnClick="btnAddProduct_Click" />
            </td>
            <%--<td style="width: 5px;"></td>
            <td>
                <asp:Button ID="btnThumbProduct" Visible="true" CssClass="btn btn-small btn-purple" runat="server" 
                    Text="Hình ảnh Sản phẩm" OnClick="btnThumbProduct_Click" />
            </td>--%>
        </tr>
    </table>
</div>

<div id="lstProdName" style="width:90%; padding-left: 35px;">
    <dgridCtrl:DataGrid id="dtgProducts" CssClass="table table-striped table-bordered table-hover" HorizontalAlign="Center"
        CellPadding="2" runat="server" AutoGenerateColumns="False" AllowPaging="True" 
        OnItemDataBound="dtgProducts_ItemDataBound" OnItemCommand="dtgProducts_ItemCommand" >
		<AlternatingItemStyle CssClass="DarkRow"></AlternatingItemStyle>
		<ItemStyle CssClass="LightRow"></ItemStyle>
		<HeaderStyle Font-Bold="True" CssClass="HeaderRow"></HeaderStyle>
		<Columns>
            <asp:BoundColumn DataField="ID" HeaderText="Mã hàng hóa">
                <HeaderStyle Width="8%"></HeaderStyle>
			</asp:BoundColumn>
			<asp:BoundColumn DataField="Name" HeaderText="Tên sản phẩm">
				<HeaderStyle Width="15%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn DataField="SupplierName" SortExpression="Supplier.Name" HeaderText="Nhà cung cấp">
				<HeaderStyle Width="15%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn DataField="CategoryName" SortExpression="Category.Name" HeaderText="Loại hàng">
				<HeaderStyle Width="10%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn DataField="Price" HeaderText="Giá bán">
				<HeaderStyle Width="8%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn DataField="Cost" HeaderText="Giá vốn">
				<HeaderStyle Width="8%"></HeaderStyle>
			</asp:BoundColumn>

            <asp:TemplateColumn>
				<HeaderStyle Width="1%"></HeaderStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<ItemTemplate>
					<asp:Button ID="cmdEdit" CssClass="btn btn-small btn-info" CausesValidation="False" 
                        CommandName="edit" runat="server" Text="Sửa" ></asp:Button>
				</ItemTemplate>
			</asp:TemplateColumn>
            <asp:TemplateColumn>
				<HeaderStyle Width="1%"></HeaderStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<ItemTemplate>
					<asp:Button ID="cmdDel" CssClass="btn btn-small btn-yellow" CausesValidation="False" 
                        CommandName="del" runat="server" Text="Xóa" ></asp:Button>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<PagerStyle Mode="NumericPages"></PagerStyle>
	</dgridCtrl:DataGrid>
</div>