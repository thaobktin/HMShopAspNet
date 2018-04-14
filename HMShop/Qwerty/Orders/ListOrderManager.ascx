<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListOrderManager.ascx.cs" Inherits="HMShop.Qwerty.Orders.ListOrderManager" %>

<%@ Register TagPrefix="dgridCtrl" Namespace="HM.Control" Assembly="HM.Control" %>


<asp:label id="lblError" runat="server" style="text-align: center;"></asp:label>
<br />
<%--<h2 style="text-align: center;">Danh sách đơn hàng</h2>
<br />
<br />--%>
<div style="text-align: center; width:90%; padding-left: 35px;">
    <dgridCtrl:DataGrid id="dtgOrders" CssClass="table table-striped table-bordered table-hover" HorizontalAlign="Center"
        CellPadding="2" runat="server" AutoGenerateColumns="False" OnItemCommand="dtgOrders_ItemCommand" >
		<AlternatingItemStyle CssClass="DarkRow"></AlternatingItemStyle>
		<ItemStyle CssClass="LightRow"></ItemStyle>
		<HeaderStyle Font-Bold="True" CssClass="HeaderRow"></HeaderStyle>
		<Columns>
			<asp:BoundColumn Visible="False" DataField="Deal_ID" HeaderText="ID">
                <HeaderStyle Width="5%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn Visible="True" DataField="Order_ID" HeaderText="ID">
                <HeaderStyle Width="5%"></HeaderStyle>
			</asp:BoundColumn>
			<asp:BoundColumn DataField="User_FullName" HeaderText="Họ tên">
				<HeaderStyle Width="15%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn DataField="User_Address" HeaderText="Địa chỉ">
				<HeaderStyle Width="10%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn DataField="User_Phone" HeaderText="Số điện thoại">
				<HeaderStyle Width="10%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn DataField="User_Email" HeaderText="Email">
				<HeaderStyle Width="10%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn DataField="OrderStatus_Name" HeaderText="Tình trạng">
				<HeaderStyle Width="10%"></HeaderStyle>
			</asp:BoundColumn>
            <asp:BoundColumn DataField="Order_CreatedDate" HeaderText="Ngày tạo">
				<HeaderStyle Width="10%"></HeaderStyle>
			</asp:BoundColumn>

			<asp:TemplateColumn>
				<HeaderStyle Width="1%"></HeaderStyle>
				<ItemTemplate>
					<asp:Button id="cmdDetail" CssClass="btn btn-small btn-purple" runat="server" 
                        CommandName="detail" Text="Chi tiết" CausesValidation="False"></asp:Button>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
		<PagerStyle Mode="NumericPages"></PagerStyle>
	</dgridCtrl:DataGrid>
</div>