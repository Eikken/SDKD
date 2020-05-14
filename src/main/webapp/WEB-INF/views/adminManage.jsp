<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/5/14
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/5/8
  Time: 16:18
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
                        <a href="adminManage.action">系统管理</a>
                    </li>
                    <li class="active">用户管理</li>
                </ul><!-- .breadcrumb -->

                <!-- #nav-search -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        用户管理
                        <small>
                            <i class="icon-double-angle-right"></i>
                            用户管理
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                    </div>
                    <table class="layui-hide" id="test" lay-filter="demo"></table><!-- TABLE CONTENT ENDS -->
                    <br>
                    <form class="layui-form" action="">
                        <div class="layui-row">
                            <div class="layui-col-xs3">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">查询按</label>
                                        <div class="layui-input-block">
                                            <select id="selects" name="colName" lay-filter="dept">
                                                <option value="0" selected="true">ID编码</option>
                                                <option value="1">性别</option>
                                                <option value="2" >用户状态</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs6">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label"></label>
                                        <div class="layui-input-block">
                                            <input id="demoReload" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="要查找的内容" class="layui-input">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs3">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item">
                                        <button class="layui-btn" data-type="reload" type="button">搜索</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- /.col -->
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
    <input type="hidden" id="pid" value="<%=session.getAttribute("pid")%>">
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
<script type="text/javascript">
    var role = document.getElementById("pid").value;

    if(role==2){
        // console.log(pid)
        document.write("<script src='${pageContext.request.contextPath}/view/js/layuiManage.js'>"+"<"+"/script>");
    }
</script>
<%--<script src="${pageContext.request.contextPath}/view/js/layuiManage.js"></script>--%>
</body>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</html>
