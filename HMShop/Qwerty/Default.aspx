<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    EnableEventValidation="false" EnableViewState="true" ValidateRequest="false"
    Inherits="HMShop.Qwerty.Default" %>

<%@ Register TagPrefix="navi" TagName="Navigator" Src="~/Qwerty/Systems/NavigatorManager.ascx" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><asp:Literal ID="litTitle" runat="server"></asp:Literal></title>
    <meta charset="utf-8" />
    <meta name="description" content="Administrator &amp; Management" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/png" href="~/assets/images/fav/fav-icon-03.png" />

    <link rel="stylesheet" type="text/css" href="~/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/chosen.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/daterangepicker.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/colorpicker.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/default.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/ace-fonts.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/ace.min.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/ace-responsive.min.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/jquery.Jcrop.min.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/sweetalert.css" />
    <link rel="stylesheet" type="text/css" href="~/assets/css/fakeLoader.css" />
    
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery-3.2.1.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery.mobile.custom.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery.color.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery.Jcrop.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery-ui-1.10.3.custom.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery.ui.touch-punch.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery.easy-pie-chart.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery.knob.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery.autosize-min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery.inputlimiter.1.3.1.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/jquery.maskedinput.min.js") %>"></script>
    
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/bootstrap.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/bootstrap-tag.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/bootbox.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/bootstrap-colorpicker.min.js") %>"></script>

    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/ace-elements.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/ace.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/ace-extra.min.js") %>"></script>

    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/date-time/daterangepicker.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/date-time/bootstrap-datepicker.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/date-time/bootstrap-timepicker.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/date-time/moment.min.js") %>"></script>

    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/chosen.jquery.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/fuelux/fuelux.spinner.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/sweetalert.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/dropzone.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/fakeLoader.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/assets/js/process_range_slider.js") %>"></script>

    <!--inline scripts related to this page-->
    <script type="text/javascript">
        jQuery(function ($) {
            $('[data-rel=tooltip]').tooltip({ container: 'body' });
            $('[data-rel=popover]').popover({ container: 'body' });

            $('textarea[class*=autosize]').autosize({ append: "\n" });
            $('textarea.limited').inputlimiter({
                remText: '%n character%s remaining...',
                limitText: 'max allowed : %n.'
            });

            $.mask.definitions['~'] = '[+-]';
            $('.input-mask-date').mask('99/99/9999');
            $('.input-mask-phone').mask('(999) 999-9999');
            $('.input-mask-eyescript').mask('~9.99 ~9.99 999');
            $(".input-mask-product").mask("a*-999-a999", { placeholder: " ", completed: function () { alert("You typed the following: " + this.val()); } });

            
            $("#input-span-slider").slider({
                value: 1,
                range: "min",
                min: 1,
                max: 11,
                step: 1,
                slide: function (event, ui) {
                    var val = parseInt(ui.value);
                    $('#form-field-5').attr('class', 'span' + val).val('.span' + val).next().attr('class', 'span' + (12 - val)).val('.span' + (12 - val));
                }
            });

            $("#slider-range").css('height', '200px').slider({
                orientation: "vertical",
                range: true,
                min: 0,
                max: 100,
                values: [17, 67],
                slide: function (event, ui) {
                    var val = ui.values[$(ui.handle).index() - 1] + "";

                    if (!ui.handle.firstChild) {
                        $(ui.handle).append("<div class='tooltip right in' style='display:none;left:15px;top:-8px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>");
                    }
                    $(ui.handle.firstChild).show().children().eq(1).text(val);
                }
            }).find('a').on('blur', function () {
                $(this.firstChild).hide();
            });

            $("#slider-range-max").slider({
                range: "max",
                min: 1,
                max: 10,
                value: 2
            });

            $("#eq > span").css({ width: '90%', 'float': 'left', margin: '15px' }).each(function () {
                var value = parseInt($(this).text(), 10);
                $(this).empty().slider({
                    value: value,
                    range: "min",
                    animate: true

                });
            });


            $('#id-input-file-1 , #id-input-file-2').ace_file_input({
                no_file: 'No File ...',
                btn_choose: 'Choose',
                btn_change: 'Change',
                droppable: false,
                onchange: null,
                thumbnail: false //| true | large
                //whitelist:'gif|png|jpg|jpeg'
                //blacklist:'exe|php'
                //onchange:''
                //
            });

            //dynamically change allowed formats by changing before_change callback function
            $('#id-file-format').removeAttr('checked').on('change', function () {
                var before_change
                var btn_choose
                var no_icon
                if (this.checked) {
                    btn_choose = "Drop images here or click to choose";
                    no_icon = "icon-picture";
                    before_change = function (files, dropped) {
                        var allowed_files = [];
                        for (var i = 0 ; i < files.length; i++) {
                            var file = files[i];
                            if (typeof file === "string") {
                                if (!(/\.(jpe?g|png|gif|bmp)$/i).test(file)) return false;
                            }
                            else {
                                var type = $.trim(file.type);
                                if ((type.length > 0 && !(/^image\/(jpe?g|png|gif|bmp)$/i).test(type))
										|| (type.length == 0 && !(/\.(jpe?g|png|gif|bmp)$/i).test(file.name))//for android's default browser which gives an empty string for file.type
									) continue;//not an image so don't keep this file
                            }

                            allowed_files.push(file);
                        }
                        if (allowed_files.length == 0) return false;

                        return allowed_files;
                    }
                }
                else {
                    btn_choose = "Drop files here or click to choose";
                    no_icon = "icon-cloud-upload";
                    before_change = function (files, dropped) {
                        return files;
                    }
                }
                
            });

            $('#spinner1').ace_spinner({ value: 0, min: 0, max: 200, step: 10, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
			.on('change', function () {
				//alert(this.value)
			});
            $('#spinner2').ace_spinner({ value: 0, min: 0, max: 10000, step: 100, icon_up: 'icon-caret-up', icon_down: 'icon-caret-down' });
            $('#spinner3').ace_spinner({ value: 0, min: -100, max: 100, step: 10, icon_up: 'icon-plus', icon_down: 'icon-minus', btn_up_class: 'btn-success', btn_down_class: 'btn-danger' });

            $('.date-picker').datepicker().next().on(ace.click_event, function () {
                $(this).prev().focus();
            });
            $('#ctl20_txtDateRange').daterangepicker().prev().on(ace.click_event, function () {
                $(this).next().focus();
            });

            $('#timepicker1').timepicker({
                minuteStep: 1,
                showSeconds: true,
                showMeridian: false
            })

            $('#colorpicker1').colorpicker();
            $('#simple-colorpicker-1').ace_colorpicker();

            $(".knob").knob();

            //we could just set the data-provide="tag" of the element inside HTML, but IE8 fails!
            var tag_input = $('#form-field-tags');
            if (!(/msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()))) {
                tag_input.tag(
					{
					    placeholder: tag_input.attr('placeholder'),
					    //enable typeahead by specifying the source array
					    source: ace.variable_US_STATES //defined in ace.js >> ace.enable_search_ahead
					}
				);
            }
            else {
                //display a textarea for old IE, because it doesn't support this plugin or another one I tried!
                tag_input.after('<textarea id="' + tag_input.attr('id') + '" name="' + tag_input.attr('name') + '" rows="3">' + tag_input.val() + '</textarea>').remove();
            }

            $('#modal-form input[type=file]').ace_file_input({
                style: 'well',
                btn_choose: 'Drop files here or click to choose',
                btn_change: null,
                no_icon: 'icon-cloud-upload',
                droppable: true,
                thumbnail: 'large'
            })

            //chosen plugin inside a modal will have a zero width because the select element is originally hidden
            //and its width cannot be determined.
            //so we set the width after modal is show
            $('#modal-form').on('show', function () {
                $(this).find('.chosen-container').each(function () {
                    $(this).find('a:first-child').css('width', '200px');
                    $(this).find('.chosen-drop').css('width', '210px');
                    $(this).find('.chosen-search input').css('width', '200px');
                });
            })
            
        });
    </script>
</head>
<body>
    <form id="frmAdmin" method="post" runat="server">
        <div class="navbar" id="navbar">
            <script type="text/javascript">
                try { ace.settings.check('navbar', 'fixed') } catch (e) { }
            </script>

            <div class="navbar-inner">
                <div class="container-fluid">
                    <a href="#" class="brand">
                        <small>
                            <i class="icon-leaf"></i>HuongMoon.com - Your Satisfied, Our Force
                        </small>
                    </a>
                    <!--/.brand-->

                    <ul class="nav ace-nav pull-right">
                        <li class="grey">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="icon-tasks"></i>
                                <span class="badge badge-grey">4</span>
                            </a>
                            <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
                                <li class="nav-header">
                                    <i class="icon-ok"></i>
                                    4 Tasks to complete
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">Software Update</span>
                                            <span class="pull-right">65%</span>
                                        </div>

                                        <div class="progress progress-mini ">
                                            <div style="width: 65%" class="bar"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">Hardware Upgrade</span>
                                            <span class="pull-right">35%</span>
                                        </div>

                                        <div class="progress progress-mini progress-danger">
                                            <div style="width: 35%" class="bar"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">Unit Testing</span>
                                            <span class="pull-right">15%</span>
                                        </div>

                                        <div class="progress progress-mini progress-warning">
                                            <div style="width: 15%" class="bar"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">Bug Fixes</span>
                                            <span class="pull-right">90%</span>
                                        </div>

                                        <div class="progress progress-mini progress-success progress-striped active">
                                            <div style="width: 90%" class="bar"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">See tasks with details
										<i class="icon-arrow-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="purple">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="icon-bell-alt icon-animated-bell"></i>
                                <span class="badge badge-important">8</span>
                            </a>
                            <ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-closer">
                                <li class="nav-header">
                                    <i class="icon-warning-sign"></i>
                                    8 Notifications
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-mini no-hover btn-pink icon-comment"></i>
                                                New Comments
                                            </span>
                                            <span class="pull-right badge badge-info">+12</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <i class="btn btn-mini btn-primary icon-user"></i>
                                        Bob just signed up as an editor ...
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-mini no-hover btn-success icon-shopping-cart"></i>
                                                New Orders
                                            </span>
                                            <span class="pull-right badge badge-success">+8</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-mini no-hover btn-info icon-twitter"></i>
                                                Followers
                                            </span>
                                            <span class="pull-right badge badge-info">+11</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">See all notifications
										<i class="icon-arrow-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="green">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="icon-envelope icon-animated-vertical"></i>
                                <span class="badge badge-success">5</span>
                            </a>

                            <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
                                <li class="nav-header">
                                    <i class="icon-envelope-alt"></i>
                                    5 Messages
                                </li>

                                <li>
                                    <a href="#">
                                        <img src="../assets/images/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Alex:</span>
                                                Ciao sociis natoque penatibus et auctor ...
                                            </span>

                                            <span class="msg-time">
                                                <i class="icon-time"></i>
                                                <span>a moment ago</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <img src="../assets/images/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Susan:</span>
                                                Vestibulum id ligula porta felis euismod ...
                                            </span>

                                            <span class="msg-time">
                                                <i class="icon-time"></i>
                                                <span>20 minutes ago</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <img src="../assets/images/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Bob:</span>
                                                Nullam quis risus eget urna mollis ornare ...
                                            </span>

                                            <span class="msg-time">
                                                <i class="icon-time"></i>
                                                <span>3:15 pm</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">See all messages
										<i class="icon-arrow-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="light-blue">
                            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                                <img class="nav-user-photo" src="/assets/images/avatars/user2.jpg" alt="Jason's Photo" />
                                <span class="user-info">
                                    <small>Chào bạn, </small><asp:Literal runat="server" ID="litUserName" ></asp:Literal>
                                </span>
                                <i class="icon-caret-down"></i>
                            </a>

                            <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
                                <li>
                                    <%--<a href="/Qwerty/Default.aspx?cmd=system_setting">
                                        <i class="icon-cog"></i>
                                        Thiết lập
                                    </a>--%>
                                    <asp:HyperLink ID="hypSetting" runat="server"></asp:HyperLink>
                                </li>
                                <li>
                                    <%--<a href="/Qwerty/Default.aspx?cmd=system_userprofile">
                                        <i class="icon-user"></i>
                                        Trang cá nhân
                                    </a>--%>
                                    <asp:HyperLink ID="hypPersonal" runat="server"></asp:HyperLink>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <asp:Button CssClass="btn btn-danger btn-block" Text="Logout" runat="server" ID="btnLogout" OnClick="btnLogout_Click" />
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <!--/.ace-nav-->
                </div>
                <!--/.container-fluid-->
            </div>
            <!--/.navbar-inner-->
        </div>

        <div class="main-container container-fluid">
            <a class="menu-toggler" id="menu-toggler" href="#">
                <span class="menu-text"></span>
            </a>

            <div class="sidebar" id="sidebar">
                <script type="text/javascript">
                    try { ace.settings.check('sidebar', 'fixed') } catch (e) { }
                </script>

                <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                        <button class="btn btn-small btn-success">
                            <i class="icon-signal"></i>
                        </button>
                        <button class="btn btn-small btn-info">
                            <i class="icon-pencil"></i>
                        </button>
                        <button class="btn btn-small btn-warning">
                            <i class="icon-group"></i>
                        </button>
                        <button class="btn btn-small btn-danger">
                            <i class="icon-cogs"></i>
                        </button>
                    </div>

                    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                        <span class="btn btn-success"></span>
                        <span class="btn btn-info"></span>
                        <span class="btn btn-warning"></span>
                        <span class="btn btn-danger"></span>
                    </div>
                </div>
                <!--#sidebar-shortcuts-->

                <ul class="nav nav-list">
                    <navi:Navigator ID="leftNav" runat="server"></navi:Navigator>
                </ul>
                <!--/.nav-list-->

                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
                </div>

                <script type="text/javascript">
                    try { ace.settings.check('sidebar', 'collapsed') } catch (e) { }
                </script>
            </div>

            <div class="main-content">
                <div class="breadcrumbs" id="breadcrumbs">
                    <script type="text/javascript">
                        try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
                    </script>

                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home home-icon"></i>
                            <a href="#">Home</a>

                            <span class="divider">
                                <i class="icon-angle-right arrow-icon"></i>
                            </span>
                        </li>
                        <li class="active">Dashboard</li>
                    </ul>
                    <!--.breadcrumb-->

                    <div class="nav-search" id="nav-search">
                        <form class="form-search">
                            <span class="input-icon">
                                <input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
                                <i class="icon-search nav-search-icon"></i>
                            </span>
                        </form>
                    </div>
                    <!--#nav-search-->
                </div>

                <div class="page-content">
                    <div class="page-header position-relative">
                        <h1>HuongMoon.com
							<small>
                                <i class="icon-double-angle-right"></i>
                                <asp:Literal ID="litCommandName" runat="server"></asp:Literal>
                            </small>
                        </h1>
                    </div>
                    <!--/.page-header-->

                    <div class="row-fluid">
                        <div class="span12">
                            <!--PAGE CONTENT BEGINS-->

                            <div class="alert alert-block alert-success">
                                <button type="button" class="close" data-dismiss="alert">
                                    <i class="icon-remove"></i>
                                </button>

                                <i class="icon-ok green"></i>

                                <asp:Label ID="lblErrorMessage" runat="server">
                                    Hệ thống đang chạy thử nghiệm, mọi thông báo lỗi xin quý vị vui lòng gửi về cho quản trị theo email huongmoon.com@gmail.com
                                </asp:Label>
                            </div>

                            <div class="space-6"></div>
                            <div class="row-fluid">
                                <asp:PlaceHolder ID="placeControls" runat="server"></asp:PlaceHolder>
                            </div>

                            <!--PAGE CONTENT ENDS-->
                        </div>
                        <!--/.span-->
                    </div>
                    <!--/.row-fluid-->
                </div>
                <!--/.page-content-->

                <div class="ace-settings-container" id="ace-settings-container">
                    <div class="btn btn-app btn-mini btn-warning ace-settings-btn" id="ace-settings-btn">
                        <i class="icon-cog bigger-150"></i>
                    </div>

                    <div class="ace-settings-box" id="ace-settings-box">
                        <div>
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="default" value="#438EB9">#438EB9</option>
                                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                </select>
                            </div>
                            <span>&nbsp; Choose Skin</span>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                            <label class="lbl" for="ace-settings-navbar">Fixed Navbar</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                            <label class="lbl" for="ace-settings-sidebar">Fixed Sidebar</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                            <label class="lbl" for="ace-settings-breadcrumbs">Fixed Breadcrumbs</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                            <label class="lbl" for="ace-settings-rtl">Right To Left (rtl)</label>
                        </div>
                    </div>
                </div>
                <!--/#ace-settings-container-->
            </div>
            <!--/.main-content-->
        </div>
        <!--/.main-container-->

        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
            <i class="icon-double-angle-up icon-only bigger-110"></i>
        </a>
    </form>
</body>
</html>