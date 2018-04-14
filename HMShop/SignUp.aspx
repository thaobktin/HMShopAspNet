<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MainOne.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="HMShop.SignUp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btn-sign-up {width: 70px; height: 25px; color: #fff; background-color: #E00228; padding-bottom:2px; border-radius:3px;}
        .list{
            background:#f4f4f4;
            border:2px solid #808080;
            text-align:center;
            font-size: 12px;
            font-family:'Times New Roman', Times, serif;
            width:80%;
        }
        .list-column-left {
            width: 20%;
            display:inline-block;
            text-align:left;
        }
        .list-column-center {
            width: 40%;
            display:inline-block;
            text-align:center;
        }
        .list-left {
            width: 100%;
            padding: 50px;
            float: left;
         }
        .list-right {
            width: 100%;
            padding: 5px;
            float: right;
         }
        .list-title {
            height: 25px;
            font-size: 14px;
            padding: 5px;
            text-align:left;
        }
        .list-text {
            width: 100%;
            height: 25px;
            font-size: 14px;
            padding: 5px;
        }
        .list-empty {
            padding: 5px;
            height: 25px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:15%; display:inline-block;"></div>
    <div class="list" style="width: 70%; display: inline-block;">
        <div class="list-column-left">
            <div class="list-right">
                <div class="list-title"><span style="color: #000000; height:25px;">Họ Và Tên</span></div>
                <div class="list-title"><span style="color: #000000; height:25px;">Tên Đăng Nhập</span></div>
                <div class="list-title"><span style="color: #000000; height:25px;">Email</span></div>
                <div class="list-title"><span style="color: #000000; height:25px;">Mật Khẩu</span></div>
                <div class="list-title"><span style="color: #000000; height:25px;">Nhập Lại Mật Khẩu</span></div>
                <div class="list-title"><span style="color: #000000; height:25px;">Địa chỉ</span></div>
                <div class="list-title"><span style="color: #000000; height:25px;">Số Điện Thoại</span></div>
                <div class="list-empty"><asp:Label ID="lblWel" runat="server" Text="" Font-Size="Larger"></asp:Label></div>
            </div>
        </div>
        <div class="list-column-center">
            <div class="list-right">
                <div class="list-text">
                    <span style="color: #000000; height:35px; font-size:28px;">TÀI KHOẢN MỚI</span>
                </div>
                <div class="list-text">
                    <asp:TextBox ID="txtFullName" runat="server" Width="90%" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Width="15px" ControlToValidate="txtFullName" 
                        ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="list-text">
                    <asp:TextBox ID="txtLoginName" runat="server" Width="90%" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Width="15px" ControlToValidate="txtLoginName" 
                        ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="list-text">
                    <asp:TextBox ID="txtEmail" runat="server" Width="90%" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Width="15px" ControlToValidate="txtEmail" 
                        ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="list-text">
                    <asp:TextBox ID="txtPassWord" runat="server" Width="90%" Height="20px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Width="5px" ControlToValidate="txtPassWord"
                        ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Width="5px" ControlToValidate="txtPassWord"
                        ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="list-text">
                    <asp:TextBox ID="txtRePass" runat="server" Width="90%" Height="20px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Width="15px" ControlToValidate="txtRePass"
                        ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="list-text">
                    <asp:TextBox ID="txtAddress" runat="server" Width="90%" Height="20px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Width="15px" ControlToValidate="txtAddress" 
                        ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="list-text" style="padding-left:0px; margin-left: -4px;">
                    <asp:TextBox ID="txtPhone" runat="server" Width="90%" Height="20px"></asp:TextBox>
                </div>
                <div class="list-text">
                    <asp:Button ID="btnSignUp" runat="server" Text="Đăng ký" CssClass="btn-sign-up" OnClick="btnSignUp_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
