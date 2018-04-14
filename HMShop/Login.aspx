<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/MainOne.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HMShop.Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .list{
            background:#f4f4f4;
            border:2px solid #808080;
            text-align:center;
            font-size: 12px;
            font-family:'Times New Roman', Times, serif;
            width:40%;
        }
        .list-row {
            display:inline-block;
        }
        .list-left {
            width:auto;
            padding:5px;
            float:left;
         }
        .list-right {
            width: auto;
            padding:5px;
            float:right;
         }
        .list-title {
            font-size: 14px;
            padding: 5px;
        }
        .list-empty {
            padding: 5px;
            height: 23px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:30%; display:inline-block;"></div>
    <div class="list" style="width:40%; display:inline-block;">
        <div class="list-row">
		    <div class="list-right">
			    <div class="list-title"><span>Tên Đăng Nhập</span></div>
			    <div class="list-title"><span>Mật Khẩu</span></div>
                <div class="list-empty"></div>
			    <div class="list-empty"></div>
		    </div>
	    </div>
	    <div class="list-row">
		    <div class="list-right">
			    <div class="list-title">
                    <asp:TextBox ID="txtUserName" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Width="10px" ControlToValidate="txtUserName" 
                        ForeColor="Red" ErrorMessage="(*)"></asp:RequiredFieldValidator>
			    </div>
			    <div class="list-title">
                    <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Width="10px" ControlToValidate="txtPassWord" 
                        ForeColor="Red" ErrorMessage="(*)"></asp:RequiredFieldValidator>
			    </div>
                <div class="list-title"><asp:Button ID="btnLogIn" runat="server" Text="Đăng nhập" OnClick="btnLogIn_Click"/></div>
			    <div class="list-title"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">Đăng Ký Tài Khoản</asp:HyperLink></div>
            </div>
	    </div>
        <div class="list-title"><asp:Label ID="lblMessage" runat="server"></asp:Label></div>
	</div>
    <br />
</asp:Content>