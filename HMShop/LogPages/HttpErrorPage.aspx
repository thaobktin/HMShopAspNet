<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HttpErrorPage.aspx.cs" Inherits="HMShop.LogPages.HttpErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Http Error Page</h2>
        <asp:Label ID="FriendlyErrorMsg" runat="server" Text="Label" Font-Size="Large" style="color: red"></asp:Label>
        <asp:Panel ID="DetailedErrorPanel" runat="server" Visible="false">
            <p>&nbsp;</p>
            <h4>Error Handler:</h4>
            <p>
                <asp:Label ID="ErrorHandler" runat="server" Font-Size="Small" /><br />
            </p>
            <h4>Detailed Error:</h4>
            <p>
                <asp:Label ID="ErrorDetailedMsg" runat="server" Font-Size="Small" /><br />
            </p>
            <h4>Inner Error Message:</h4>
            <p>
            <asp:Label ID="InnerMessage" runat="server" Font-Size="Small" /><br />
            </p>
            <p>
                <asp:Label ID="InnerTrace" runat="server"  />
            </p>
        </asp:Panel>
        <br />
        Return to the <a href="<%= Page.ResolveClientUrl("~/Default.aspx") %>">Default Page</a>
    </div>
    </form>
</body>
</html>
