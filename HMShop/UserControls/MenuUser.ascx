<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuUser.ascx.cs" Inherits="HMShop.UserControls.MenuUser" %>

<asp:Repeater ID="rptProfile" runat="server" OnItemDataBound="rptProfile_ItemDataBound" OnItemCommand="rptProfile_ItemCommand" >
    <HeaderTemplate>
        <ul class="menu-nav">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <asp:HyperLink ID="hypItem" runat="server" NavigateUrl='<%# Eval("Url") %>' Text='<%# Eval("Text") %>'>
            </asp:HyperLink>
        </li>
    </ItemTemplate>
    <FooterTemplate>
         </ul>
    </FooterTemplate>
</asp:Repeater>