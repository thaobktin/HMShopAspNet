<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MainTwo.Master" AutoEventWireup="true" CodeBehind="OrderAddNew.aspx.cs" Inherits="HMShop.Customer.OrderAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <br />
    <div style="display:inline-block; padding-left: 5px; width: 80%;">
    <asp:GridView ID="grShopCart" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDataBound="grShopCart_RowDataBound" Width="530px">
        <Columns>            
            <asp:TemplateField HeaderText="Tên Sản Phẩm">
                <ItemTemplate>
                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Product.Name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" ForeColor="Maroon" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="Solid" BorderWidth="1px" />
                <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>&nbsp;
                </ItemTemplate>
                <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" ForeColor="Maroon" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="Solid" BorderWidth="1px" />
                <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Đơn Giá">
                <ItemTemplate>
                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price", "{0:###,###,###}") %>'></asp:Label>
                    <asp:HiddenField ID="hidPrice" Value='<%# Eval("Price") %>' runat="server" />
                </ItemTemplate>
                <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" ForeColor="Maroon" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="Solid" BorderWidth="1px" />
                <ItemStyle ForeColor="#404040" HorizontalAlign="Right" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thành Tiền">
                <ItemTemplate>
                    <asp:Label ID="lblSumPrice" runat="server" Text='<%# Eval("SumPrice", "{0:###,###,###}đ") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" ForeColor="Maroon" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="Solid" BorderWidth="1px" />
                <ItemStyle ForeColor="#404040" HorizontalAlign="Right" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
    <div style="height: 5px;"></div>
    <div style="display:inline-block; padding-left: 10px; width: 50%; text-align: left;">
        <asp:Label ID="lblTongTien" runat="server" Text="Tổng tiền:" Font-Bold="True" ForeColor="#330000"></asp:Label>
        <asp:Label ID="lblTotal" runat="server" ForeColor="#330000"></asp:Label>
        <br />
        <asp:Button ID="btnContinue" runat="server" Text="Tiếp tục mua" CssClass="btn-continue" OnClick="btnContinue_Click"/>
        <asp:Button ID="btnSendOrder" runat="server" Text="Đặt hàng" CssClass="btn-update" OnClick="btnSendOrder_Click"/>
    </div>
    <br />
</asp:Content>