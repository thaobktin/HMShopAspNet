<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" EnableEventValidation="false" Inherits="HMShop.Qwerty.Login" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title><%--HuongMoon.com--%> Administrator - Log In or Sign Up</title>
	<meta charset="utf-8" />
	<meta name="description" content="User login page" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--basic styles-->
	<link rel='stylesheet' type='text/css' href='~/assets/css/font-google.css' />
    <link rel='stylesheet' type='text/css' href="~/assets/css/bootstrap.min.css" />
	<link rel='stylesheet' type='text/css' href="~/assets/css/bootstrap-responsive.min.css" />
	<link rel='stylesheet' type='text/css' href="~/assets/css/font-awesome.min.css" />
	<link rel='stylesheet' type='text/css' href="~/assets/css/ace-fonts.css" />
	<link rel='stylesheet' type='text/css' href="~/assets/css/ace.min.css" />
	<link rel='stylesheet' type='text/css' href="~/assets/css/ace-responsive.min.css" />
	<link rel='stylesheet' type='text/css' href="~/assets/css/ace-skins.min.css" />

    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery-3.2.1.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/bootstrap.min.js") %>"></script>
	<script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/ace-elements.min.js") %>"></script>
	<script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/ace.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/ace-extra.min.js") %>"></script>
    
	<script type="text/javascript">
		function show_box(id) {
			jQuery('.widget-box.visible').removeClass('visible');
			jQuery('#' + id).addClass('visible');
		}
	</script>
</head>
<body class="login-layout">
	<form id="frmLogin" method="post" runat="server">
		<div class="main-container container-fluid">
			<div class="main-content">
				<div class="row-fluid">
					<div class="span12">
						<div class="login-container">
							<div class="row-fluid">
								<div class="center">
									<h1>
										<i class="icon-leaf green"></i>
										<span class="red">Shop</span>
										<span class="white">Management</span>
									</h1>
									<%--<h4 class="blue">&copy; TreViet Technology</h4>--%>
								</div>
							</div>
							<div class="space-6"></div>
							<div class="row-fluid">
								<div class="position-relative">
									<div id="login-box" class="login-box visible widget-box no-border">
										<div class="widget-body">
											<div class="widget-main">
												<h4 class="header blue lighter bigger">
													<i class="icon-coffee green"></i>
													Please Enter Your Information
												</h4>
												<div class="space-6"></div>
												<form>
													<fieldset>
														<label>
															<span class="block input-icon input-icon-right">
																<asp:TextBox ID="txtUserLogIn" runat="server" CssClass="span12" placeholder="Username" Text="thaond@com.vn"></asp:TextBox>
																<i class="icon-user"></i>
															</span>
														</label>
														<label>
															<span class="block input-icon input-icon-right">
																<asp:TextBox ID="txtPasswordLogIn" runat="server" CssClass="span12" TextMode="Password" placeholder="Password" Text="ainopdiu"></asp:TextBox>
																<i class="icon-lock"></i>
															</span>
														</label>
														<div class="space"></div>
														<asp:Label ID="lblMessage" runat="server" ForeColor="Maroon" Font-Size="12px" Font-Names="Tahoma"
															Visible="False">Information incorrect</asp:Label>
                                                        <div class="space"></div>
														<div class="clearfix">
															<label class="inline">
																<%--<input type="checkbox" class="ace" />--%>
                                                                <%--<asp:CheckBox ID="chkRememberMe" runat="server" CssClass="ace" />
																<span class="lbl" style="padding-top:5px;">Remember Me</span>--%>
															</label>
															<asp:Button ID="btnLogin" runat="server" CssClass="width-35 pull-right btn btn-small btn-primary" 
                                                                Text="Login" OnClick="btnLogin_Click" ></asp:Button>
														</div>
														<div class="space-4"></div>
													</fieldset>
												</form>
												<%--<div class="social-or-login center">
													<span class="bigger-110">Or Login Using</span>
												</div>
												<div class="social-login center">
													<a class="btn btn-primary">
														<i class="icon-facebook"></i>
													</a>
													<a class="btn btn-info">
														<i class="icon-twitter"></i>
													</a>
													<a class="btn btn-danger">
														<i class="icon-google-plus"></i>
													</a>
												</div>--%>
											</div>
											<!--/widget-main-->
											<div class="toolbar clearfix">
												<div>
													<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
														<i class="icon-arrow-left"></i>
														I forgot my password
													</a>
												</div>
												<div>
													<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">
                                                        I want to register
														<i class="icon-arrow-right"></i>
													</a>
												</div>
											</div>
										</div>
										<!--/widget-body-->
									</div>
									<!--/login-box-->

									<div id="forgot-box" class="forgot-box widget-box no-border">
										<div class="widget-body">
											<div class="widget-main">
												<h4 class="header red lighter bigger">
													<i class="icon-key"></i>
													Retrieve Password
												</h4>
												<div class="space-6"></div>
												<p>
													Enter your email and to receive instructions
												</p>
												<form>
													<fieldset>
														<label>
															<%--<span class="block input-icon input-icon-right">
																<input type="email" class="span12" placeholder="Email" />
																<i class="icon-envelope"></i>
															</span>--%>
															<span class="block input-icon input-icon-right">
																<asp:TextBox ID="txtEmailReset" runat="server" CssClass="span12" placeholder="Email" Text=""></asp:TextBox>
																<asp:RequiredFieldValidator ID="RequiredFieldValidator3" Visible="false" runat="server" ControlToValidate="txtEmailReset" ErrorMessage="*"></asp:RequiredFieldValidator>
																<i class="icon-envelope"></i>
															</span>
														</label>

														<div class="clearfix">
															<%--<button onclick="return false;" class="width-35 pull-right btn btn-small btn-danger">
																<i class="icon-lightbulb"></i>Send Me!
															</button>--%>
                                                            <%--<asp:Button ID="btnResetPass" runat="server" CssClass="width-35 pull-right btn btn-small btn-danger" 
                                                                Text="Send Me!" OnClick="btnResetPass_Click"></asp:Button>--%>
                                                            <asp:Button ID="btnResetPass" runat="server" CssClass="width-35 pull-right btn btn-small btn-danger" 
                                                                Text="Send Me!" OnClick="btnResetPass_Click" ></asp:Button>
														</div>
													</fieldset>
												</form>
                                                <asp:Label ID="lblMsgSendEmail" runat="server" ForeColor="Maroon" Font-Size="11px" Font-Names="Tahoma"
															Visible="False">Information incorrect</asp:Label>
											</div>
											<!--/widget-main-->
											<div class="toolbar center">
												<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
                                                    Back to login
													<i class="icon-arrow-right"></i>
												</a>
											</div>
										</div>
										<!--/widget-body-->
									</div>
									<!--/forgot-box-->

									<div id="signup-box" class="signup-box widget-box no-border">
										<div class="widget-body">
											<div class="widget-main">
												<h4 class="header green lighter bigger">
													<i class="icon-group blue"></i>
													New User Registration
												</h4>
												<div class="space-6"></div>
												<p>Enter your details to begin: </p>
												<form>
													<fieldset>
														<label>
															<span class="block input-icon input-icon-right">
																<%--<input type="email" class="span12" placeholder="Email" />--%>
																<asp:TextBox ID="txtEmailNew" runat="server" CssClass="span12" placeholder="Email" Text=""></asp:TextBox>
	                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" Visible="false" runat="server" ControlToValidate="txtEmailReset" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
	                                                            <i class="icon-envelope"></i>
															</span>
														</label>

														<label>
															<span class="block input-icon input-icon-right">
																<%--<input type="text" class="span12" placeholder="UserName" />--%>
                                                                <asp:TextBox ID="txtUserNew" runat="server" CssClass="span12" placeholder="UserName" Text=""></asp:TextBox>
																<i class="icon-user"></i>
															</span>
														</label>

														<label>
															<span class="block input-icon input-icon-right">
																<%--<input type="password" class="span12" placeholder="Password" />--%>
                                                                <asp:TextBox ID="txtPasswordNew" runat="server" CssClass="span12" placeholder="Password" Text=""></asp:TextBox>
																<i class="icon-lock"></i>
															</span>
														</label>

														<label>
															<span class="block input-icon input-icon-right">
																<%--<input type="password" class="span12" placeholder="Repeat password" />--%>
                                                                <asp:TextBox ID="txtPasswordResetNew" runat="server" CssClass="span12" placeholder="Repeat password" Text=""></asp:TextBox>
																<i class="icon-retweet"></i>
															</span>
														</label>

														<label>
															<%--<input type="checkbox" class="ace" />--%>
                                                            <asp:CheckBox ID="chkUserAgree" runat="server" CssClass="ace" />
															<span class="lbl">
                                                                I accept the <a href="#">User Agreement</a>
															</span>
														</label>
                                                        <div class="space"></div>

                                                        <asp:Label ID="lblMessageNew" runat="server" ForeColor="Maroon" Font-Size="12px" Font-Names="Tahoma"
															Visible="False">Please enter full Information</asp:Label>
														<div class="space-24"></div>

														<div class="clearfix">
															<button type="reset" class="width-30 pull-left btn btn-small">
																<i class="icon-refresh"></i>Reset
															</button>

															<%--<button onclick="return false;" class="width-65 pull-right btn btn-small btn-success">
																Register<i class="icon-arrow-right icon-on-right"></i>
															</button>--%>
                                                            <%--<asp:Button ID="btnRegister" runat="server" CssClass="width-65 pull-right btn btn-small btn-success" 
                                                                Text="Register" OnClick="btnRegister_Click"></asp:Button>--%>
                                                            <asp:LinkButton ID="lnkBtnRegister" runat="server" CssClass="width-50 pull-right btn btn-small btn-success" 
                                                                OnClick="lnkBtnRegister_Click">Register<i class="icon-arrow-right icon-on-right"></i></asp:LinkButton>
														</div>
													</fieldset>
												</form>
											</div>

											<div class="toolbar center">
												<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
													<i class="icon-arrow-left"></i>
													Back to login
												</a>
											</div>
										</div>
										<!--/widget-body-->
									</div>
									<!--/signup-box-->
								</div>
								<!--/position-relative-->
							</div>
						</div>
					</div>
					<!--/.span-->
				</div>
				<!--/.row-fluid-->
			</div>
		</div>
		<!--/.main-container-->

	</form>
</body>
</html>