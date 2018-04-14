<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MainTwo.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="HMShop.ShoppingCart" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center;"><asp:Label ID="lblMessage" runat="server" Text="" Visible="false"></asp:Label></div>
    <br />
    <asp:Button ID="btnMain" runat="server" Text="" CssClass="btn-continue" Visible="false" OnClick="btnReturnMain_Click" />
    <br />
    <div style="display:inline-block; padding-left: 10px; width: 80%;">
        <asp:GridView ID="grShopCart" runat="server" AutoGenerateColumns="False" Width="100%" HorizontalAlign="Left"
            DataKeyNames="ID" OnRowDataBound="grShopCart_RowDataBound" >
            <Columns>
                <asp:TemplateField HeaderText="Xóa" HeaderStyle-Width="5%">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkDel" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" ForeColor="Maroon" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="Solid" BorderWidth="1px" />
                    <ItemStyle BackColor="White" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center"/>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sản Phẩm" HeaderStyle-Width="40%">
                    <ItemTemplate>
                        <%# Eval("Product.Name") %>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" ForeColor="Maroon" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="Solid" BorderWidth="1px" />
                    <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Số lượng" HeaderStyle-Width="15%">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Amount") %>' Width="50px"></asp:TextBox>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" ForeColor="Maroon" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="Solid" BorderWidth="1px" />
                    <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Đơn Giá" HeaderStyle-Width="20%">
                    <ItemTemplate>
                        <%# Eval("Price", "{0:###,###,###}")%>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" ForeColor="Maroon" HorizontalAlign="Center"
                        VerticalAlign="Middle" BorderStyle="Solid" BorderWidth="1px" />
                    <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thành Tiền" HeaderStyle-Width="20%">
                    <ItemTemplate>
                        <%# Eval("SumPrice","{0:###,###,###}đ")%>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#E0E0E0" BorderColor="#404040" ForeColor="Maroon" HorizontalAlign="Center"
                        VerticalAlign="Middle" BorderStyle="Solid" BorderWidth="1px" />
                    <ItemStyle ForeColor="#404040" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="#404040" BorderStyle="Solid" BorderWidth="1px" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%--<asp:HiddenField ID="hidCartGuid" runat="server" />
        <asp:HiddenField ID="hidGridChanged" runat="server" />--%>
    </div>
    <div style="height: 5px;"></div>
    <div style="display:inline-block; padding-left: 10px;">
        <asp:Label ID="lblTota" runat="server" Text="Tổng tiền:" Font-Bold="True" ForeColor="#330000"></asp:Label>
        <asp:Label ID="lblTotal" runat="server" ForeColor="#330000" Visible="true"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnContinue" runat="server" Text="Tiếp tục mua" CssClass="btn-continue" OnClick="btnContinue_Click"/>
        <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CssClass="btn-update" OnClick="btnUpdate_Click"/>
        <asp:Button ID="btnConfirm" runat="server" Text="Thanh toán" CssClass="btn-confirm" OnClick="btnConfirm_Click"/>
    </div>
</asp:Content>