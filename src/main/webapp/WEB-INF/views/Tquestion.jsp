<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>进出口纺织原料质量安全风险监测系统</title>
    <meta name="keywords" content="进出口纺织原料质量安全风险监测系统" />
    <meta name="description" content="进出口纺织原料质量安全风险监测系统" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
</head>

<body>
    <div class="navbar navbar-default" id="navbar">
        <script type="text/javascript">
            try{ace.settings.check('navbar' , 'fixed')}catch(e){}
        </script>

        <%@ include file="base/header.jsp"%>
    </div>
    <div class="main-container" id="main-container">
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

                <%@ include file="base/menu.jsp"%>

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
                            <a href="#">主页</a>
                        </li>
                        <li class="active">沟通系统</li>
                    </ul><!-- .breadcrumb -->
                </div>

                <div class="page-content">
                    <div class="page-header">
                        <h1>
                            沟通系统
                            <small>
                                <i class="icon-double-angle-right"></i>
                                问题反馈
                            </small>
                        </h1>
                    </div><!-- /.page-header -->

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-sm-6" style="width:100%">
                                    <div class="widget-box ">
                                        <div class="widget-header">
                                            <h4 class="lighter smaller">
                                                <i class="icon-comment blue"></i>
                                                问题反馈
                                            </h4>
                                        </div>

                                        <div class="widget-body">
                                            <div class="widget-main no-padding">
                                                <div class="dialogs">

                                                </div><!-- /widget-main -->
                                                <form>
                                                    <div class="form-actions">
                                                        <div class="input-group">
                                                            <input placeholder="输入要发布的问题 ..." type="text" class="form-control" name="content" id="content"/>
                                                            <span class="input-group-btn">
																<button class="btn btn-sm btn-info no-radius" type="button" onclick="askQuestion()">
																	<i class="icon-share-alt"></i>
																	发布
																</button>
															</span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div><!-- /widget-body -->
                                        </div><!-- /widget-box -->
                                    </div><!-- /span -->
                                </div><!-- /row -->

                                <!-- PAGE CONTENT ENDS -->
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.page-content -->
                </div><!-- /.main-content -->

                <div id="consoleDlg"></div>

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
                            <span>&nbsp; 选择皮肤</span>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                            <label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                            <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                            <label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                            <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                            <label class="lbl" for="ace-settings-add-container">
                                切换窄屏
                                <b></b>
                            </label>
                        </div>
                    </div>
                </div><!-- /#ace-settings-container -->
            </div><!-- /.main-container-inner -->

            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="icon-double-angle-up icon-only bigger-110"></i>
            </a>
        </div><!-- /.main-container -->
    </div>
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
    <script type="text/javascript">
        jQuery(function($) {
            // 配置模态对话框
            $("#consoleDlg").dialog({
                autoOpen : false, // 是否自动弹出窗口
                modal : true, // 设置为模态对话框
                resizable : true,
                height : 250,
                position : "center", // 窗口显示的位置
                width : 480
            });

            $.ajax({
                url: "blog/load",
                datatype:"json",
                type:'get',
                success:function(data) {
                    var qds = data.blogDTOList;
                    if(data!=null){
                        console.log("data.blogDTOList not null");
                        console.log(typeof (qds));
                    }else{
                        console.log("data.blogDTOList is null!");
                    }
                    var html = '';
                    for(var i=0; i<qds.length; i++){
                        var far = qds[i];
                        console.log(far.userName)
                        html += '<div class="itemdiv dialogdiv">'
                            +'<div class="user">'
                            +'<img alt="Alexa\'s Avatar" src="${pageContext.request.contextPath}/view/assets/avatars/avatar1.png" />'
                            +'</div>'
                            +'<div class="body">'
                            //+'<div class="time">'
                            //+'<i class="icon-time"></i>'
                            //+'<span class="green">4分钟前</span>'
                            //+'</div>'
                            +'<div class="name">'
                            +'<a href="#">'+far.userName+'</a>'
                            +'</div>'
                            +'<div class="text">'+far.blog_text+'</div>'
                            +'<div class="date">'+far.blog_date+'</div>'
                            +'<div class="tools" style="display:block">'
                            +'<a href="javascript:void(0)" class="btn btn-minier btn-info" onclick="answerQuestion('+far.blog_id+')">回复</a>'
                            +'</div>'
                            +'</div>';
                        for(var j=0; j<far.sonQD.length; j++){
                            var son = far.sonQD[j];
                            html += '<div class="user" style="padding-left:40px;padding-top: 5px">'
                                + '<img alt="Alexa\'s Avatar" src="${pageContext.request.contextPath}/view/assets/avatars/avatar.png" />'
                                + '</div>'
                                + '<div class="body" style="margin-left:90px">'
                                //+ '<div class="time">'
                                //+ '<i class="icon-time"></i>'
                                //+ '<span class="green">5分钟前</span>'
                                //+ '</div>'
                                + '<div class="name">'
                                + '<a href="#">'+son.tuser.loginName+'</a>'
                                + '</div>'
                                + '<div class="text">' + son.content + '</div>'
                                //+ '<div class="tools" style="display:block">'
                                //+ '<a href="#" class="btn btn-minier btn-info">'
                                //+ '回复'
                                ///+ '</a>'
                                //+ '</div>'
                                + '</div>'
                        }
                        html += '</div>';
                    }
                    $('.dialogs').html(html);
                }
            });
        });

        setTimeout(function(){
            var fc = '#<%=request.getParameter("fcode") %>'
            var sc = '#<%=request.getParameter("scode") %>'
            $(fc).addClass("active open");
            $(sc).addClass("active");
        },500);
    </script>
</body>

</html>

