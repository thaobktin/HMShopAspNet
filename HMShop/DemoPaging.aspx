<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoPaging.aspx.cs" Inherits="HMShop.DemoPaging" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Custom Paging of DataList - Asp.NET(C#)</title>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
            <tr>
                <td align="center">
                    <strong>Data List Custom Paging</strong></td>
            </tr>
            <tr>
                <td align="left">
                    <asp:DataList runat="server" ID="dListItems" CellPadding="2">
                        <ItemTemplate>
                            <%#Eval("title") %>
                        </ItemTemplate>
                        <AlternatingItemStyle BackColor="Silver" />
                        <ItemStyle BackColor="White" />
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" border="0">
                        <tr>
                            <td align="right">
                                <asp:LinkButton ID="lbtnFirst" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                                &nbsp;</td>
                            <td align="right">
                                <asp:LinkButton ID="lbtnPrevious" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Previous</asp:LinkButton>&nbsp;&nbsp;</td>
                            <td align="center" valign="middle">
                                <asp:DataList ID="dlPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="dlPaging_ItemCommand"
                                    OnItemDataBound="dlPaging_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                            CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>&nbsp;
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td align="left">
                                &nbsp;&nbsp;<asp:LinkButton ID="lbtnNext" runat="server" CausesValidation="false"
                                    OnClick="lbtnNext_Click">Next</asp:LinkButton></td>
                            <td align="left">
                                &nbsp;
                                <asp:LinkButton ID="lbtnLast" runat="server" CausesValidation="false" OnClick="lbtnLast_Click">Last</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td colspan="5" align="center" style="height: 30px" valign="middle">
                                <asp:Label ID="lblPageInfo" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
