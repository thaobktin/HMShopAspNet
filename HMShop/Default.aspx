<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MainOne.Master" AutoEventWireup="true" 
    MaintainScrollPositionOnPostback="true" CodeBehind="Default.aspx.cs" Inherits="HMShop.Default" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:TextBox ID="txtSearch" runat="server" CssClass="txtSearch"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="" CssClass="btnSearch" OnClick="btnSearch_Click"/>
    </div>
    <br />
    <div class="slider">
        <div id="coin-slider">
            <a href="#"><img src="/assets/images/sliders/slide01.jpg" alt="slide01" /></a>
            <a href="#"><img src="/assets/images/sliders/slide02.jpg" alt="slide02" /></a>
            <a href="#"><img src="/assets/images/sliders/slide03.jpg" alt="slide03" /></a>
            <a href="#"><img src="/assets/images/sliders/slide04.jpg" alt="slide04" /></a>
            <a href="#"><img src="/assets/images/sliders/slide05.jpg" alt="slide05" /></a>
            <a href="#"><img src="/assets/images/sliders/slide06.png" alt="slide06" /></a>
            <a href="#"><img src="/assets/images/sliders/slide07.png" alt="slide07" /></a>
            <a href="#"><img src="/assets/images/sliders/slide08.jpg" alt="slide08" /></a>
            <a href="#"><img src="/assets/images/sliders/slide09.png" alt="slide09" /></a>
            <a href="#"><img src="/assets/images/sliders/slide10.png" alt="slide10" /></a>
            <a href="#"><img src="/assets/images/sliders/slide11.jpg" alt="slide11" /></a>
            <a href="#"><img src="/assets/images/sliders/slide12.jpg" alt="slide12" /></a>
        </div>
    </div>
    <div class="clr"></div>
    <br />
    <p><asp:Label ID="lblSearchResult" runat="server" Font-Bold="True" ForeColor="#400000"></asp:Label></p>
    <%--<div style="height: 10px;"></div>--%>
    
    <asp:DataList ID="dtlProduct" runat="server" RepeatColumns="4" Width="100%" CaptionAlign="Top" HorizontalAlign="Center">
        <ItemTemplate>
            <asp:HyperLink ID="hypDetail" runat="server" NavigateUrl='<%# Eval("ID","~/ProductDetail.aspx?ProductID={0}") %>'>
                <div class="prod-in-list" >
                    <div style="width: 100%">
                        <div class="prod-td-img" >
                            <asp:Image ID="imgDetail" runat="server" Height="125px" Width="100px" 
                            ImageUrl='<%# Eval("Image.ID","~/HttpHandlers/DisplayProductImage.ashx?ProductImageID={0}") %>' />
                        </div>
                        <div class="prod-td-lbl" >
                            <asp:Label ID="Label1" runat="server" Width="180px" Text='<%# Eval("Name") %>' Font-Bold="True" ForeColor="#330000"></asp:Label>
                        </div>
                        <div style="height:15px;"></div>
                        <div class="prod-td-lbl" >
                            <asp:Label ID="Label2" runat="server" ForeColor="#EA281C"
                                Text='<%# Eval("Price", "{0:##,###,###} VND") %>'></asp:Label>
                        </div>
                    </div>
                </div>
            </asp:HyperLink>
        </ItemTemplate>
    </asp:DataList>
    
    <div style="height:5px;"></div>
    <div class="prod-list-pager">
        <cc1:CollectionPager ID="colPager" runat="server" HideOnSinglePage="True" IgnoreQueryString="False" 
            PagingMode="QueryString" ResultsLocation="None" ShowLabel="True" ShowPageNumbers="True" UseSlider="True">
        </cc1:CollectionPager>
    </div>
</asp:Content>