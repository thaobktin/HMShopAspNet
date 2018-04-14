<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MainTwo.Master" AutoEventWireup="true" CodeBehind="OrderListByCust.aspx.cs" Inherits="HMShop.Customer.OrderListByCust" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btn-back {width: 70px; height: 25px; color: #fff; background-color: #E00228; margin:20px auto; padding-bottom:2px; border-radius:3px;}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 530px">
        <strong><span style="font-size: 15pt; color: #330000"><span style="color: #cc0000">CÁC ĐƠN HÀNG CỦA BẠN</span><br />
        </span></strong>
        <asp:GridView ID="grOrders" runat="server" AutoGenerateColumns="False" Width="530px">
            <Columns>
                <asp:TemplateField HeaderText="Mã đơn hàng">
                    <ItemTemplate>
                        <asp:HyperLink ID="hypItem" runat="server"
                            NavigateUrl='<%# String.Format("~/Customer/OrderDetailByCust.aspx?DealId={0}&OrderId={1}", Eval("DealID"), Eval("ID")) %>'
                            Text='<%# String.Format("DH{0}", Eval("ID")) %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="#400000" />
                    <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày tạo đơn hàng">
                    <ItemTemplate>
                        <%# Eval("Created_Date", "{0:dd/MM/yyyy}") %>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="#400000" />
                    <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tình trạng đơn hàng">
                    <ItemTemplate>
                        <%# Eval("Status") %>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="#400000" />
                    <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <%--<br />
    <asp:Button ID="btnBack" runat="server" Text="Trở về" CssClass="btn-back" OnClick="btnBack_Click"/>--%>
</asp:Content>