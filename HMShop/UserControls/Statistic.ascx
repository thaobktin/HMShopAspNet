<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Statistic.ascx.cs" Inherits="HMShop.UserControls.Statistic" %>

<table cellpadding="0" cellspacing="0" style="width: 100%;">
    <tr>
        <td align="center" style="width: 200px; height: 19px">
            <strong>Số người Online:</strong>
            <asp:Label ID="lblOnline" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="width: 200px" align="center">
            <asp:Label ID="Label1" runat="server" Text="Tổng số truy cập:"></asp:Label>
            <asp:Label ID="lblSumAccess" runat="server" Text=""></asp:Label>
        </td>
    </tr>
</table>