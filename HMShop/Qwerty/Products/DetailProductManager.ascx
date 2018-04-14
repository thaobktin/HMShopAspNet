<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailProductManager.ascx.cs" Inherits="HMShop.Qwerty.Products.DetailProductManager" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<%--<asp:label id="lblError" runat="server" style="text-align: center;"></asp:label>--%>
<br />
<table style="width: 90%" class="table table-striped table-bordered table-hover">
    <tr>
        <td style="width: 20%" align="center">Tên sản phẩm</td>
        <td style="width: 80%">
            <asp:TextBox ID="txtProductName" runat="server" Width="50%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductName"
                ErrorMessage="Tên sản phẩm không để trống"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 20%" align="center">Mô tả sản phẩm</td>
        <td style="width: 80%">
            <CKEditor:CKEditorControl ID="ckeDesc" runat="server"></CKEditor:CKEditorControl>
        </td>
    </tr>
    <tr>
        <td style="width: 20%" align="center">Đơn giá</td>
        <td style="width: 80%">
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice"
                ErrorMessage="Giá sản phẩm không để trống"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 20%" align="center">Danh mục</td>
        <td style="width: 80%">
            <asp:DropDownList ID="ddlCategories" runat="server" Width="156px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 20%" align="center">Nhà cung cấp</td>
        <td style="width: 80%">
            <asp:DropDownList ID="ddlSuppliers" runat="server" Width="156px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 20%" align="center">Hình</td>
        <td style="width: 80%">
            <asp:Image ID="imgProduct" runat="server" Height="125px" Width="100px" />
        </td>
    </tr>
    <tr>
        <td style="width: 20%"></td>
        <td style="width: 80%">
            <asp:FileUpload ID="fudImgPrd" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="width: 20%"></td>
        <td style="width: 80%">
            <asp:Button ID="btnUpdate" runat="server" Text="Cập Nhật" CssClass="btn btn-small btn-primary" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Bỏ Qua" CssClass="btn btn-small btn-purple" OnClick="btnCancel_Click" />
        </td>
    </tr>
</table>