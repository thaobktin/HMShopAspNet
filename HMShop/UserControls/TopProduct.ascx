<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopProduct.ascx.cs" Inherits="HMShop.UserControls.TopProduct" %>

<marquee height="300px" direction="up" scrollamount="1" scrolldelay="10" truespeed="truespeed" style="text-align: center"
    onmouseover="this.stop()" onmouseout="this.start()" >
    <asp:DataList id="dtlTopTenProduct" runat="server" width="100%">
        <ItemTemplate>
            <table cellSpacing= 0 cellPadding= 0 width=200 style="border: 1px solid rgb(238, 238, 238);">
		        <tr>
			        <td style="width: 100%; height: 19px; background-color: gainsboro">
			        <asp:Label id="Label1" runat="server" ForeColor="Maroon" Font-Bold="True"
                        Text='<%# Eval("Product_Name") %>' __designer:wfdid="w10"></asp:Label>
			        </td>
		        </tr>
		        <tr>
			        <td style="width: 100%">
			        <asp:HyperLink id="HyperLink1" runat="server" Width="230px" Height="250px" __designer:wfdid="w4" 
                        NavigateUrl='<%# Eval("ID","../ChiTietSanPham.aspx?ProductID={0}") %>' 
                        ImageUrl='<%# Eval("Product_Image_ID","../HttpHandlers/DisplayProductImage.ashx?ProductImageID={0}") %>'>
			        </asp:HyperLink>
			        </td>
		        </tr>
		        <tr>
			        <td style="width: 100%; height: 40px" vAlign=top>
			        <asp:Label id="Label2" runat="server" ForeColor="Maroon" Font-Bold="True"
                        Text='<%# Eval("Price","{0:##,###,###} VND") %>' __designer:wfdid="w12"></asp:Label>
			        </td>
		        </tr>
	        </table>
        </ItemTemplate>
    </asp:DataList>
</marquee>