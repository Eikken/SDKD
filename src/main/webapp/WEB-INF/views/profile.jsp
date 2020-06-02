<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/5/12
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>进出口纺织原料质量安全风险监测系统</title>

    <meta name="keywords" content="进出口纺织原料质量安全风险监测系统" />
    <meta name="description" content="进出口纺织原料质量安全风险监测系统" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%--        layui 四大件 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/layui/css/layui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/view/libs/jquery-1.12.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/view/layer/layer.js"></script>
    <link href="//at.alicdn.com/t/font_1794036_a3aqkx4z5fo.css" rel="stylesheet">
    <!-- basic styles -->
    <link href="${pageContext.request.contextPath}/view/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/font-awesome.min.css" />

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace-skins.min.css" />

    <!-- ace settings handler -->
    <script src="${pageContext.request.contextPath}/view/assets/js/ace-extra.min.js"></script>
    <style type="text/css">
        .tool {
            display: none;
        }
    </style>
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    </script>

    <%@ include file="base/header.jsp"%>
</div>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
            </script>

            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <button class="btn btn-success">
                        <i class="icon-signal"></i>
                    </button>

                    <button class="btn btn-info">
                        <i class="icon-pencil"></i>
                    </button>

                    <button class="btn btn-warning">
                        <i class="icon-group"></i>
                    </button>

                    <button class="btn btn-danger">
                        <i class="icon-cogs"></i>
                    </button>
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div><!-- #sidebar-shortcuts -->


            <script src='${pageContext.request.contextPath}/view/assets/js/jquery-2.0.3.min.js'></script>

            <ul id="fmUL" class="nav nav-list">
                <li class="active">
                    <a href="#">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> 控制台 </span>
                    </a>
                </li>
            </ul><!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
            </script>
        </div>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="SendBlog.action">主页</a>
                    </li>

                    <li>
                        <a href="#">个人信息</a>
                    </li>
                    <li class="active"><a href="editProfile.action?uid="+<%=request.getAttribute("uid")%>>更多</a></li>
                </ul><!-- .breadcrumb -->

                <!-- #nav-search -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        个人信息
                        <small>
                            <i class="icon-double-angle-right"></i>
                            profile info
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="clearfix">
                            <div class="pull-left alert alert-success no-margin">
                                <a href="editProfile.action?uid="+<%=request.getAttribute("uid")%>>
                                    <button type="button" class="close" data-dismiss="alert">
                                        <i class="icon-remove"></i>
                                    </button>
                                    <i class="icon-umbrella bigger-120 blue"></i>
                                    点击修改你的个人信息
                                </a>
                            </div>
                        </div>
                        <div class="tab-content profile-edit-tab-content">
                        </div>
                        <div id="user-profile-2" class="user-profile">
                            <div class="tabbable">
                                <ul class="nav nav-tabs padding-18">
                                    <li class="active">
                                        <a data-toggle="tab" href="#home">
                                            <i class="green icon-user bigger-120"></i>
                                            Profile
                                        </a>
                                    </li>

                                    <li class="">
                                        <a data-toggle="tab" href="#blog">
                                            <i class="orange icon-rss bigger-120"></i>
                                            Blogs
                                        </a>
                                    </li>
                                </ul>

                                <div class="tab-content no-border padding-24">
                                    <div id="home" class="tab-pane active">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-3 center">
															<span class="profile-picture">
																<img class="editable img-responsive" alt="Alex's Avatar" id="userPic" src="${pageContext.request.contextPath}/view/assets/avatars/sdust.jpg">
															</span>

                                                <div class="space space-4"></div>

                                                <a href="#" class="btn btn-sm btn-block btn-success">
                                                    <i class="icon-plus-sign bigger-120"></i>
                                                    <span class="bigger-110">Add as a friend</span>
                                                </a>

                                                <a href="#" class="btn btn-sm btn-block btn-primary">
                                                    <i class="icon-envelope-alt bigger-110"></i>
                                                    <span class="bigger-110">Send a message</span>
                                                </a>
                                            </div><!-- /span -->

                                            <div class="col-xs-12 col-sm-9">
                                                <h4 class="blue">
                                                    <span class="middle">Welcome Visit Me</span>

                                                    <span class="label label-purple arrowed-in-right">
																	<i class="icon-circle smaller-80 align-middle"></i>
																	online
																</span>
                                                </h4>

                                                <div class="profile-user-info">
                                                    <div class="profile-info-row">
                                                        <div class="profile-info-name"> Username </div>
                                                        <div class="profile-info-value">
                                                            <span id="pname">null</span><!-- pid ==> profile id -->
                                                        </div>
                                                    </div>

                                                    <div class="profile-info-row">
                                                        <div class="profile-info-name"> Location </div>
                                                        <div class="profile-info-value">
                                                            <i class="icon-map-marker light-orange bigger-110"></i>
                                                            <span id="paddress">null</span>
                                                        </div>
                                                    </div>

                                                    <div class="profile-info-row">
                                                        <div class="profile-info-name"> Age </div>

                                                        <div class="profile-info-value">
                                                            <span id="page">null</span>
                                                        </div>
                                                    </div>

                                                    <div class="profile-info-row">
                                                        <div class="profile-info-name"> Born </div>

                                                        <div class="profile-info-value">
                                                            <span id="pbirthday">null</span>
                                                        </div>
                                                    </div>

                                                    <div class="profile-info-row">
                                                        <div class="profile-info-name"> E-mail </div>

                                                        <div class="profile-info-value">
                                                            <span id="pemail">null</span>
                                                        </div>
                                                    </div>
                                                    <div class="profile-info-row">
                                                        <div class="profile-info-name"> State </div>

                                                        <div class="profile-info-value" id="pstatus">

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="hr hr-8 dotted"></div>

                                                <div class="profile-user-info">
                                                    <div class="profile-info-row">
                                                        <div class="profile-info-name"> Website </div>

                                                        <div class="profile-info-value">
                                                            <a href="#">www.alexdoe.com</a><!--<a href="#" target="_blank">-->
                                                        </div>
                                                    </div>

                                                    <div class="profile-info-row">
                                                        <div class="profile-info-name">
                                                            <i class="middle icon-facebook-sign bigger-150 blue"></i>
                                                        </div>

                                                        <div class="profile-info-value">
                                                            <a href="#">Find me on Facebook</a>
                                                        </div>
                                                    </div>

                                                    <div class="profile-info-row">
                                                        <div class="profile-info-name">
                                                            <i class="middle icon-twitter-sign bigger-150 light-blue"></i>
                                                        </div>

                                                        <div class="profile-info-value">
                                                            <a href="#">Follow me on Twitter</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- /span -->
                                        </div><!-- /row-fluid -->

                                        <div class="space-20"></div>

                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6">
                                                <div class="widget-box transparent">
                                                    <div class="widget-header widget-header-small">
                                                        <h4 class="smaller">
                                                            <i class="icon-check bigger-110"></i>
                                                            个性签名
                                                        </h4>
                                                    </div>

                                                    <div class="widget-body">
                                                        <div class="widget-main" id="profile">
<%--                                                            <p>--%>
<%--                                                                Thanks for visiting my profile.--%>
<%--                                                            </p>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- #home -->

                                    <div id="blog" class="tab-pane">
                                        <div class="profile-feed row-fluid">
                                            <div class="span6" id="myBlog">

                                            </div><!-- /span -->
                                        </div><!-- /row -->

                                        <div class="space-12"></div>

                                        <div class="center">
                                            <a href="SendBlog.action" class="btn btn-small btn-primary">
                                                <i class="icon-rss bigger-150 middle"></i>
                                                View more activities
                                                <i class="icon-on-right icon-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div><!-- #blog -->

                                </div>
                            </div>
                        </div>

                    </div>
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->

        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
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
                    <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                    <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                    <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                    <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                    <label class="lbl" for="ace-settings-add-container">
                        Inside
                        <b>.container</b>
                    </label>
                </div>
            </div>
        </div><!-- /#ace-settings-container -->
    </div><!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
    <input type="hidden" id="sessiondata" value="<%=session.getAttribute("uid")%>">
</div><!-- /.main-container -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='${pageContext.request.contextPath}/view/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
</script>

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/view/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
</script>
<script src="${pageContext.request.contextPath}/view/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/view/assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->
<script src="${pageContext.request.contextPath}/view/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/view/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="${pageContext.request.contextPath}/view/assets/js/jqGrid/i18n/grid.locale-en.js"></script>

<!-- ace scripts -->
<script src="${pageContext.request.contextPath}/view/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/view/assets/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath}/view/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath}/view/js/profile.js"></script>
<script src="${pageContext.request.contextPath}/view/js/beifenBlog.js"></script>
</body>
</html>

