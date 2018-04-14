<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MainOne.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="HMShop.ProductDetail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btn-back {width: 70px; height: 25px; color: #fff; background-color: #E00228; margin:20px auto; padding-bottom:2px; border-radius:3px;}
        .btn-buy {width: 70px; height: 25px; color: #fff; background-color: #F0C24F; margin:20px auto; padding-bottom:2px; border-radius:3px;}
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:1px solid #C06C06;">
        <div style="display:inline-block; width: 100%;">
            <div style="width: auto; float: left; padding: 1px 1px 2px 10px;">
                <asp:Image ID="imgProd" runat="server" />
            </div>
            <div style="width: 15px;"></div>
            <div style="width: auto; float: left;">
                <asp:Label ID="lblProdName" runat="server" Font-Bold="True" ForeColor="#330000" ></asp:Label>
                <br />
                <asp:Label ID="lblProdPrice" runat="server" ForeColor="#990000" Font-Size="20px" ></asp:Label>
                <br />
                <div style="height:15px;"></div>
                <asp:Label ID="lblQuan" runat="server" ForeColor="#060605"></asp:Label>
                <asp:DropDownList ID="ddlQuantity" runat="server"></asp:DropDownList>
                <div style="height:15px;"></div>
                <div style="width: 100%; height: 24px; padding-top: 10px;">
                    <%--<asp:Button ID="btnBack" runat="server" Text="Trở về" CssClass="btn-back" OnClick="btnBack_Click"/>--%>
                    <asp:Button ID="btnBuy" runat="server" Text="Mua hàng" CssClass="btn-back" OnClick="btnBuy_Click"/>
                </div>
            </div>
        </div>

        <div style="display:inline-block; width: 100%;">
            <div style="text-align:center; color: #076ce1; font-size: 24px;"><span>THÔNG TIN CHI TIẾT</span></div>
            <div style="text-align:left; padding-left:15px;">
                <asp:Label ID="lblDescription" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>