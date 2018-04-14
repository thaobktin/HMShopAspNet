<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThumbProductManager.ascx.cs" Inherits="HMShop.Qwerty.Products.ThumbProductManager" %>

<%@ Import Namespace="HM.Common" %>

<div id="lstProdName" style="width:90%; padding-left: 35px;">
    <asp:DataList ID="dtlProducts" runat="server" style="width:100%;" CssClass="table table-striped table-bordered cell-hover"
        CellPadding="0" RepeatColumns="3" RepeatDirection="Horizontal" >
        <ItemTemplate>
            <asp:Panel ID="pnlProducts" runat="server" BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" style="width:100%;">
                <table id="tblProduct" cellpadding="0" cellspacing="0" style="width:100%; height: 15%;">
                    <tr>
                        <td rowspan="1" style="width: 50%; height: 100%" align="center" valign="middle">
                            <asp:Image ID="imgProd" runat="server" Height="150px" Width="125px" 
                                ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ProductImageId","~/HttpHandlers/DisplayProductImage.ashx?ProductImageID={0}") %>'/>
                        </td>
                        <td style="width: 50%; height: 100%;" align="center" valign="middle">
                            <asp:HyperLink ID="hypProd" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'
                                NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "ID", PathConfig.ADMIN_CMD + CmdConfig.PRODUCT_DETAIL_PRODUCT + "&productid={0}") %>'>
                            </asp:HyperLink>
                            <br />
                            <asp:Label ID="lblProdPrice" runat="server" 
                                Text='<%# DataBinder.Eval(Container.DataItem, "Price","{0:###,###,###} VND") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" rowspan="1" style="width: 100%;">
                            <asp:Label ID="lblProdDesc" runat="server" 
                                Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ItemTemplate>
    </asp:DataList>
    <asp:LinkButton runat="server" ID="lnkFirst" Text="Trang đầu" OnClick="lnkFirst_Click"> </asp:LinkButton>
    <span>&nbsp;&nbsp;&nbsp;</span>
    <asp:LinkButton runat="server" ID="lnkPrev" Text="<<" OnClick="lnkPrev_Click"> </asp:LinkButton>
    <span>&nbsp;&nbsp;&nbsp;</span>
    <asp:LinkButton runat="server" ID="lnkNext" Text=">>" OnClick="lnkNext_Click"> </asp:LinkButton>
    <span>&nbsp;&nbsp;&nbsp;</span>
    <asp:LinkButton runat="server" ID="lnkLast" Text="Trang cuối" OnClick="lnkLast_Click"> </asp:LinkButton>
</div>