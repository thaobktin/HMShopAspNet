<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailOrderManager.ascx.cs" Inherits="HMShop.Qwerty.Orders.DetailOrderManager" %>

<%@ Register TagPrefix="dgridCtrl" Namespace="HM.Control" Assembly="HM.Control" %>

<%--<asp:label id="lblError" runat="server" style="text-align: center;"></asp:label>--%>

<script src="~/Assets/js/jquery-3.2.1.min.js" type="text/javascript" ></script>
<script src="~/Assets/js/jquery-ui-1.10.3.full.min.js" type="text/javascript" ></script>
<link href="~/Assets/css/jquery-ui-1.10.3.full.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("[id$=txtShippedDate]").datepicker({
            //dateFormat: 'mm/dd/yyyy',
            //showButtonPanel: true,
            //changeMonth: true,
            //changeYear: true,
            //setDate: new Date(),
            format: 'dd/mm/yyyy',
            yearRange: '1999:c+1',
            showOn: 'button',
            buttonImageOnly: true,
            buttonImage: '/Assets/images/calendar.jpg' //,
            //minDate: new Date(1999, 10 - 1, 25),
            //maxDate: '+30Y',
            //inline: true
        });
    });
</script>
<br />
<table class="SidePanel" id="tblDetailOrder" style="width: 80%; border: 0px;">
    <tr>
        <%--<td style="width: 20%" align="left">ID Giao dịch</td>--%>
        <td style="width: 20%" align="left">Mã đơn hàng</td>
        <td style="width: 80%">
            <%--<asp:Label ID="lblDealID" runat="server" ForeColor="#3300FF"></asp:Label>--%>
            <asp:Label ID="lblOrderID" runat="server" ForeColor="#3300FF"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 20%" align="left">Danh sách sản phẩm</td>
        <td style="width: 80%; text-align: center;">
            <dgridCtrl:DataGrid ID="dtgOrderDetails" CssClass="table table-striped table-bordered table-hover"  
                CellPadding="2" runat="server" AutoGenerateColumns="False" >
		        <AlternatingItemStyle CssClass="DarkRow"></AlternatingItemStyle>
		        <ItemStyle CssClass="LightRow"></ItemStyle>
		        <HeaderStyle Font-Bold="True" CssClass="HeaderRow"></HeaderStyle>
		        <Columns>
			        <asp:BoundColumn Visible="True" DataField="Product_ID" HeaderText="Mã SP">
                        <HeaderStyle Width="5%"></HeaderStyle>
			        </asp:BoundColumn>
			        <asp:BoundColumn Visible="True" DataField="Product_Name" HeaderText="Tên sản phẩm">
				        <HeaderStyle Width="30%"></HeaderStyle>
			        </asp:BoundColumn>
                    <asp:BoundColumn Visible="True" DataField="OrderDetail_Amount" HeaderText="Số lượng">
				        <HeaderStyle Width="5%"></HeaderStyle>
			        </asp:BoundColumn>
                    <asp:BoundColumn Visible="True" DataField="Product_Price" DataFormatString="{0:N0} đ" HeaderText="Đơn giá">
				        <HeaderStyle Width="5%"></HeaderStyle>
			        </asp:BoundColumn>
		        </Columns>
		        <%--<PagerStyle Mode="NumericPages"></PagerStyle>--%>
	        </dgridCtrl:DataGrid>
        </td>
    </tr>
    <tr>
        <td style="width: 20%" align="left">Ngày xử lý đơn hàng</td>
        <td style="width: 80%">
            <asp:TextBox ID="txtShippedDate" runat="server" Text=""></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 20%" align="left">Tracking number</td>
        <td style="width: 80%">
            <asp:TextBox ID="textTrackingNumber" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 20%" align="left">Tình trạng đơn hàng</td>
        <td style="width: 80%">
            <asp:DropDownList ID="ddlOrdStt" runat="server" Width="139px"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 20%"></td>
        <td style="width: 80%">
            <asp:Button ID="cmdBack" CssClass="btn btn-small btn-purple" runat="server" CausesValidation="False"
                Text="Về danh sách" OnClick="cmdBack_Click" />
            <asp:Button ID="cmdUpdate" CssClass="btn btn-small btn-primary" runat="server" CausesValidation="False"
                Text="Cập nhật" OnClick="cmdUpdate_Click" />
        </td>
    </tr>
</table>