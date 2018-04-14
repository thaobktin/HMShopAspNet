<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserCart.ascx.cs" Inherits="HMShop.UserControls.UserCart" %>

<script type="text/javascript">
    //$(document).ready(function () {
    //   <%-- $('#<%= btnViewCart.ClientID %>').hide();
    //    $('#<%= btnPay.ClientID %>').hide();--%>
    //    var rowCount = $('#tblCart tr').length;
    //});
</script>

<asp:Repeater ID="rptCarts" OnItemDataBound="rptCarts_ItemDataBound" runat="server">
    <HeaderTemplate>
        <div id="titleCart" style="z-index: 11; position: absolute; float: left; width: auto; display:block; height: 25px; padding: 1px; border: 1px solid #808080; background-color: #808080; color:#ffffff; font-size: 18px; font-family: Arial;">Giỏ hàng</div>
        <div id="listCart" style="z-index: 11; position: absolute; float: left; width: auto; min-width: 120px; display:block; background-color: #FFD; border: 1px solid #808080; ">
        <table id="tblCart">
            <tr>
                <td style="border: 1px solid #C84660; background-color: #FFD; font-weight: bold;">
                    <asp:Label ID="lblHeaderProduct" runat="server" Text="Sản phẩm" Visible="true" ></asp:Label>
                </td>
                <td style="border: 1px solid #C84660; background-color: #FFD; font-weight: bold;">
                    <asp:Label ID="lblHeaderQuantity" runat="server" Text="Số lượng" Visible="true" ></asp:Label>
                </td>
                <td style="border: 1px solid #C84660; background-color: #FFD; font-weight: bold;">
                    <asp:Label ID="lblHeaderPrice" runat="server" Text="Giá tiền" Visible="true" ></asp:Label>
                </td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td style="border: 1px solid #C84660;">
                <asp:Label id="lblName" runat="server" ForeColor="Maroon" Font-Bold="False"
                    Text='<%# Eval("Product.Name") %>'>
                </asp:Label>
            </td>
            <td style="border: 1px solid #C84660; text-align:center;">
                <asp:Label id="lblQuantity" runat="server" ForeColor="Maroon" Font-Bold="False"
                    Text='<%# Eval("Amount") %>'>
                </asp:Label>
            </td>
            <td style="border: 1px solid #C84660;">
                <asp:Label id="lblPrice" runat="server" ForeColor="Maroon" Font-Bold="False"
                    Text='<%# Eval("Price", "{0:###,###,###}")%>'>
                </asp:Label>
                <asp:HiddenField ID="hidPrice" Value='<%# Eval("Price") %>' runat="server" />
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
            <tr>
                <td style="border: 1px solid #FFD; background-color: #FFD;"></td>
                <td style="border: 1px solid #C84660; background-color: #FFD;"><%--Tổng tiền--%>
                    <asp:Label ID="lblFooterSumPrice" runat="server" Text=""></asp:Label>
                </td>
                <td style="border: 1px solid #C84660; background-color: #FFD;">
                    <asp:Label id="lblSumPrice" runat="server" ForeColor="Maroon" Font-Bold="False" Text="">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnViewCart" runat="server" Text="Xem giỏ hàng" CssClass="btn-continue" OnClick="btnViewCart_Click"/>
                </td>
                <td>
                    <asp:Button ID="btnPay" runat="server" Text="Thanh toán" CssClass="btn-confirm" OnClick="btnPay_Click"/>
                </td>
            </tr>
        </table>
    </div>
    </FooterTemplate>
</asp:Repeater>
<br />