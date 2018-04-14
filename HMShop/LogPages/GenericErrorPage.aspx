﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenericErrorPage.aspx.cs" Inherits="HMShop.LogPages.GenericErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2>Generic Error Page</h2>
        <asp:Panel ID="InnerErrorPanel" runat="server" Visible="false">
          <p>
            Inner Error Message:<br />
            <asp:Label ID="innerMessage" runat="server" Font-Bold="true" Font-Size="Large" /><br />
          </p>
          <pre>
            <asp:Label ID="innerTrace" runat="server" />
          </pre>
        </asp:Panel>
        <p>
          Error Message:<br />
          <asp:Label ID="exMessage" runat="server" Font-Bold="true" Font-Size="Large" />
        </p>
        <pre>
          <asp:Label ID="exTrace" runat="server" Visible="false" />
        </pre>
        <br />
        Return to the <a href="<%= Page.ResolveClientUrl("~/Default.aspx") %>">Default Page</a>
    </div>
    </form>
</body>
</html>
