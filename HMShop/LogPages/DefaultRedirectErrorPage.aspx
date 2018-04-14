<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultRedirectErrorPage.aspx.cs" Inherits="HMShop.LogPages.DefaultRedirectErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Default Error Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>DefaultRedirect Error Page</h2>
        Standard error message suitable for all unhandled errors. 
        The original exception object is not available.
        <br />
        <br />
        Return to the <a href="<%= Page.ResolveClientUrl("~/Default.aspx") %>">Default Page</a>
    </div>
    </form>
</body>
</html>
