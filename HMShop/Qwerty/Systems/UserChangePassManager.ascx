<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserChangePassManager.ascx.cs" Inherits="HMShop.Qwerty.Systems.UserChangePassManager" %>

<table style="margin-left: 270px; width: 500px; border: 0px;" class="Area" id="Table1" cellspacing="0" cellpadding="5">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblUpdateStatus" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td width="20%">Mật khẩu cũ</td>
        <td>
            <asp:TextBox ID="txtCurPwd" runat="server" Width="296px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" 
                ControlToValidate="txtCurPwd" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Mật khẩu mới</td>
        <td><asp:TextBox ID="txtNewPwd" runat="server" Width="296px" TextMode="Password"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Gõ lại</td>
        <td>
            <asp:TextBox ID="txtRetypeNewPwd" runat="server" Width="296px" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" 
                ControlToValidate="txtRetypeNewPwd" ControlToCompare="txtNewPwd">(*)</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="cmdUpdate" runat="server" CssClass="btn btn-primary btn-small" Text="Cập nhật" OnClick="cmdUpdate_Click"></asp:Button>
            <asp:Button ID="cmdBack" runat="server" CssClass="btn btn-success btn-small" Text="Trở lại" CausesValidation="False" OnClick="cmdBack_Click"></asp:Button>
        </td>
    </tr>
</table>