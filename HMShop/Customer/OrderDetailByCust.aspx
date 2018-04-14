<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MainTwo.Master" AutoEventWireup="true" CodeBehind="OrderDetailByCust.aspx.cs" Inherits="HMShop.Customer.OrderDetailByCust" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btn-back {width: 70px; height: 25px; color: #fff; background-color: #E00228; margin:20px auto; padding-bottom:2px; border-radius:3px;}
        .grid-style {padding: 10px;}
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div style="padding-left: 5px; width: 80%;">

    </div>--%>
    <div style="display:inline-block; padding-left: 5px; width: 80%;">
        <span style="color: #cc0000"><strong style="font-size: 15pt"><span style="color: #cc0000">
        <br />CHI TIẾT ĐƠN HÀNG</span></strong></span>
        <br />
        <span style="color: #cc0000">Mã đơn hàng:</span>
        <asp:Label ID="lblOrderId" runat="server" Font-Bold="True" ForeColor="#330000"></asp:Label>
    </div>
    <div style="height: 5px;"></div>
    <div style="display:inline-block; padding-left: 10px; width: 40%; text-align: center;">
        <asp:GridView ID="grOrderDetail" runat="server" AutoGenerateColumns="False" Width="530px" CssClass="grid-style" OnRowDataBound="grOrderDetail_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="T&#234;n Sản Phẩm">
                <ItemTemplate>
                    <%# Eval("Name") %>
                </ItemTemplate>
                <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px"
                    ForeColor="#400000" />
                <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <%# Eval("Amount") %>
                </ItemTemplate>
                <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px"
                    ForeColor="#400000" />
                <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gi&#225; Sản phẩm">
                <ItemTemplate>
                    <%# Eval("Price" , "{0:###,###,###} đ" )%>
                </ItemTemplate>
                <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px"
                    ForeColor="#400000" />
                <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
    <div style="height: 5px;"></div>
    <div style="display:inline-block; padding-left: 5px; width: 80%;">
        <span style="color: #330000"><strong>Tổng cộng:</strong></span>
        <asp:Label ID="lblSumPrice" runat="server" Font-Bold="True" ForeColor="#330000"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnBack" runat="server" Text="Trở về" CssClass="btn-back" OnClick="btnBack_Click"/>
    </div>
</asp:Content>
