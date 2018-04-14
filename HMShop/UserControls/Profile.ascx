<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Profile.ascx.cs" Inherits="HMShop.UserControls.Profile" %>

<asp:Repeater ID="rptProfile" runat="server" OnItemDataBound="rptProfile_ItemDataBound" OnItemCommand="rptProfile_ItemCommand">
    <HeaderTemplate>
        <ul id="listProfile" style="z-index: 11; position: absolute; float:right; display:block; background-color: #FFD; border: 1px solid #808080; width: auto; padding: 5px 10px 5px 15px;">
    </HeaderTemplate>
    <ItemTemplate>
        <li style="margin: 4px;">
            <asp:HyperLink ID="hypItem" runat="server"
                NavigateUrl='<%# Eval("Url") %>' Text='<%# Eval("Text") %>'>
            </asp:HyperLink>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        <li class="divider"></li>
        <li>
            <asp:Button ID="btnLogInOut" runat="server" Visible="false" CommandName="logout" BackColor="WhiteSmoke" BorderColor="WhiteSmoke" />
        </li>
        </ul>
    </FooterTemplate>
</asp:Repeater>
