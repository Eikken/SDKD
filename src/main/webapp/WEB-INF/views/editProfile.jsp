<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/5/12
  Time: 12:16
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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/view/libs/jquery-1.12.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/view/layer/layer.js"></script>
    <link href="//at.alicdn.com/t/font_1794036_a3aqkx4z5fo.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/view/js/editProfile.js"></script>

    <!-- basic styles -->
    <link href="${pageContext.request.contextPath}/view/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/font-awesome.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/jquery-ui-1.10.3.full.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/datepicker.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ui.jqgrid.css" />

    <!-- fonts -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace-skins.min.css" />

    <!-- ace settings handler -->
    <script src="${pageContext.request.contextPath}/view/assets/js/ace-extra.min.js"></script>
    <style type="text/css">
        #textarea {
            display: block;
            margin:0 auto;
            overflow: hidden;
            width: 550px;
            font-size: 14px;
            height: 18px;
            line-height: 24px;
            padding:2px;
        }
        textarea {
            outline: 0 none;
            border-color: rgba(82, 168, 236, 0.8);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px rgba(82, 168, 236, 0.6);
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
                        <a href="profile.action?uid=<%=session.getAttribute("uid")%>">个人信息</a>
                    </li>
                    <li class="active"><a href="editProfile.action?uid=<%=session.getAttribute("uid")%>">编辑信息</a></li>
                </ul><!-- .breadcrumb -->

                <!-- #nav-search -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        修改个人信息
                        <small>
                            <i class="icon-double-angle-right"></i>
                            edit profile
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="clearfix">
                            <div class="pull-left alert alert-success no-margin">
                                    <button type="button" class="close" data-dismiss="alert">
                                        <i class="icon-remove"></i>
                                    </button>
                                    <i class="icon-edit bigger-120 blue"></i>
                                    请修改你的个人信息 ...
                            </div>
                        </div>
                        <div class="space"></div>
                        <div class="well well-sm">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            &nbsp;
                            <div class="inline middle blue bigger-110"> Edit your profile below </div>

                            &nbsp; &nbsp; &nbsp;
                            <div style="width:200px;" data-percent="editing" class="inline middle no-margin progress progress-striped active">
                                <div class="progress-bar progress-bar-success" style="width:100%"></div>
                            </div>
                        </div>
                        <form class="form-horizontal" id="updateInfo">
                            <div class="tabbable">
                                <ul class="nav nav-tabs padding-16">
                                    <li class="active">
                                        <a data-toggle="tab" href="#edit-basic">
                                            <i class="green icon-edit bigger-125"></i>
                                            Basic Info
                                        </a>
                                    </li>

                                    <li class="">
                                        <a data-toggle="tab" href="#edit-settings">
                                            <i class="purple icon-cog bigger-125"></i>
                                            Settings
                                        </a>
                                    </li>

                                    <li class="">
                                        <a data-toggle="tab" href="#edit-password">
                                            <i class="blue icon-key bigger-125"></i>
                                            Password
                                        </a>
                                    </li>
                                </ul>

                                <div class="tab-content profile-edit-tab-content">
                                    <div id="edit-basic" class="tab-pane active">
                                        <h4 class="header blue bolder smaller">General</h4>

                                        <div class="row">

                                            <div class="vspace-xs"></div>

                                            <div class="col-xs-12 col-sm-8">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label no-padding-right" for="name">昵称</label>
                                                    <div class="col-sm-8">
                                                        <input class="col-xs-12 col-sm-10" type="text" id="name" name="name" placeholder="请输入新的昵称"  autocomplete='off' />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <hr>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="birthday">生日</label>

                                            <div class="col-sm-9">
                                                <div class="input-medium">
                                                    <div class="input-group">
                                                        <input class="input-medium date-picker" id="birthday" name="birthday"  type="text" data-date-format="yyyy-MM-dd" placeholder="yyyy-MM-dd">
                                                        <span class="input-group-addon">
                                                            <i class="icon-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="space-4"></div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">性别</label>

                                            <div class="col-sm-9">
                                                <label class="inline">
                                                    <input name="sex" type="radio" value="男" class="ace">
                                                    <span class="lbl"> 男</span>
                                                </label>
                                                &nbsp;&nbsp;
                                                <label class="inline">
                                                    <input name="sex" type="radio" value="女" class="ace">
                                                    <span class="lbl"> 女</span>
                                                </label>
                                                &nbsp;&nbsp;
                                                <label class="inline">
                                                    <input name="sex" type="radio" value="未知" class="ace">
                                                    <span class="lbl"> 未知</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="space-4"></div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="profile">个性签名</label>

                                            <div class="col-sm-9">
                                                <textarea id="profile" name="profile" style="width: 400px;" ></textarea>
                                            </div>
                                        </div>

                                        <div class="space"></div>
                                        <h4 class="header blue bolder smaller">Contact</h4>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="email">邮箱</label>

                                            <div class="col-sm-9">
                                                <span class="input-icon input-icon-right">
                                                    <input type="text" id="email" name="email" placeholder="请输入你的邮箱" autocomplete='off'>
                                                    <i class="icon-envelope"></i>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="space-4"></div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="address">地址</label>

                                            <div class="col-sm-9">
                                                <span class="input-icon input-icon-right">
                                                    <input type="text" id="address" name="address" placeholder="请输入你的地址">
                                                    <i class="icon-map-marker"></i>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="space-4"></div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="phone">手机</label>

                                            <div class="col-sm-9">
                                                <span class="input-icon input-icon-right">
                                                    <input class="input-medium input-mask-phone" type="text" id="phone" name="phone">
                                                    <i class="icon-phone icon-flip-horizontal"></i>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="space"></div>
                                        <h4 class="header blue bolder smaller">Social</h4>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="qq">QQ</label>

                                            <div class="col-sm-9">
                                                <span class="input-icon">
                                                    <input type="text"  id="qq" name="qq">
                                                    <i class="icon-facebook blue"></i>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="space-4"></div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="wechat">微信</label>

                                            <div class="col-sm-9">
																	<span class="input-icon">
																		<input type="text" id="wechat" name="wechat">
																		<i class="icon-twitter light-blue"></i>
																	</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="edit-settings" class="tab-pane">
                                        <div class="space-10"></div>

                                        <div>
                                            <label class="inline">
                                                <input type="checkbox" name="form-field-checkbox" class="ace">
                                                <span class="lbl"> Make my profile public</span>
                                            </label>
                                        </div>

                                        <div class="space-8"></div>

                                        <div>
                                            <label class="inline">
                                                <input type="checkbox" name="form-field-checkbox" class="ace">
                                                <span class="lbl"> Email me new updates</span>
                                            </label>
                                        </div>

                                        <div class="space-8"></div>

                                        <div>
                                            <label class="inline">
                                                <input type="checkbox" name="form-field-checkbox" class="ace">
                                                <span class="lbl"> Keep a history of my conversations</span>
                                            </label>

                                            <label class="inline">
                                                <span class="space-2 block"></span>

                                                for
                                                <input type="text" class="input-mini" maxlength="3">
                                                days
                                            </label>
                                        </div>
                                    </div>

                                    <div id="edit-password" class="tab-pane">
                                        <div class="space-10"></div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="password">新密码</label>

                                            <div class="col-sm-6">
                                                <input type="password" id="password" name="password" autocomplete='off'>
                                            </div>
                                        </div>

                                        <div class="space-4"></div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="passwordConfirm">确认新密码</label>

                                            <div class="col-sm-6">
                                                <input type="password" id="passwordConfirm" name="passwordConfirm" autocomplete='off'>
                                            </div>
                                            <div class="col-sm-9">
                                                <span style="color: #0a8aff" id="tipSpan">两次输入密码要一致哦~</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" type="button" id="submit" >
                                        <i class="icon-ok bigger-110"></i>
                                        提交
                                    </button>

                                    &nbsp; &nbsp;
                                    <button class="btn" type="reset" id="reset">
                                        <i class="icon-undo bigger-110"></i>
                                        重置
                                    </button>
                                </div>
                            </div>
                        </form><!-- end of edit info-->
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
</div><!-- /.main-container -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='${pageContext.request.contextPath}/view/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/view/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
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

</body>
</html>

