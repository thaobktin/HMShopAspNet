<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuCate.ascx.cs" Inherits="HMShop.UserControls.MenuCate" %>

<asp:Repeater ID="rptCategories" runat="server">
    <HeaderTemplate>
        <ul class="menu-nav">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <asp:HyperLink ID="FirstLevelMenu" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'
                NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "ID", "../Default.aspx?CategoryID={0}") %>'>
            </asp:HyperLink>
        </li>
    </ItemTemplate>
    <FooterTemplate>
         </ul>
    </FooterTemplate>
</asp:Repeater>