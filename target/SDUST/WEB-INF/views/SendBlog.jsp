<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/4/23
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
        <title>发帖子页</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />

        <meta name="keywords" content="进出口纺织原料质量安全风险监测系统" />
        <meta name="description" content="进出口纺织原料质量安全风险监测系统" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%--        layui 四大件 --%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/layui/css/layui.css" />
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/view/libs/jquery-1.12.2.min.js" charset="UTF-8"></script>
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
            .icon {
                width: 1em; height: 1em;
                vertical-align: -0.15em;
                fill: currentColor;
                overflow: hidden;
            }

            .icon-like{
                color: orange;
            }
            div.tools{
                margin-left: 30%;
                display: inline;
                font-size: 25px;
            }
            .likeSpan{
                font-size: 1em;height: 1em;
                vertical-align: -0.15em;
                color: orange;
            }
            .likeLabel{
                color: orange;
                font-size: 1em;height: 1em;
                outline:none;
                border: none;
                background-color: transparent;
            }
        </style>
</head>
<body onload="onload()">
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

<%--                                <%@ include file="base/menu.jsp"%>--%>

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
                                                                                                <p id="AjaxBlog"></p>
<%--                                                                                                <ul id="blog">--%>
<%--                                                                                                </ul>--%>
                                                                                        </h4>
                                                                                </div>
                                                                                <div class="page-control" style="">
                                                                                        <button type="button" class="layui-btn" id="prePage">
                                                                                                <svg class="icon" aria-hidden="true">
                                                                                                        <use xlink:href="#icon-fanye"></use>
                                                                                                </svg>上一页
                                                                                        </button>

                                                                                        <button type="button" class="layui-btn" id="nextPage">
                                                                                                <svg class="icon" aria-hidden="true">
                                                                                                        <use xlink:href="#icon-fanye1"></use>
                                                                                                </svg>下一页
                                                                                        </button>
                                                                                </div>
                                                                                <div class="widget-body">
                                                                                        <div class="widget-main no-padding">
                                                                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: auto;">
                                                                                                <div class="dialogs" id="blog" style="overflow: hidden; width: auto; height: auto;">

                                                                                                </div><!-- /widget-main -->
                                                                                                <div class="slimScrollBar ui-draggable" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 250.696px;"></div>
                                                                                                <div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                                                            </div>
                                                                                                <form>
                                                                                                        <div class="form-actions">
                                                                                                                <div class="input-group">
                                                                                                                        <input placeholder="输入要发布的帖子 ..." type="text" class="form-control" name="content" id="content"/>
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
                <input id="uid" type="hidden" value="<%= request.getAttribute("uid")%>">
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
</body>
<script src="${pageContext.request.contextPath}/view/js/beifenBlog.js"></script>
<%--<script type="text/javascript">--%>
<%--        $("#consoleDlg").dialog({--%>
<%--            autoOpen : false, // 是否自动弹出窗口--%>
<%--            modal : true, // 设置为模态对话框--%>
<%--            resizable : true,--%>
<%--            height : 200,--%>
<%--            position : "center", // 窗口显示的位置--%>
<%--            width : 400,--%>
<%--        });--%>

<%--        // window.onload = onload();--%>
<%--        // 对Date的扩展，将 Date 转化为指定格式的String--%>
<%--        // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，--%>
<%--        // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)--%>
<%--        // 例子：--%>
<%--        // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423--%>
<%--        // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18--%>
<%--        Date.prototype.format = function(fmt) {--%>
<%--                var o = {--%>
<%--                        "M+" : this.getMonth() + 1, //月份--%>
<%--                        "d+" : this.getDate(), //日--%>
<%--                        "h+" : this.getHours(), //小时--%>
<%--                        "m+" : this.getMinutes(), //分--%>
<%--                        "s+" : this.getSeconds(), //秒--%>
<%--                        "q+" : Math.floor((this.getMonth() + 3) / 3), //季度--%>
<%--                        "S" : this.getMilliseconds()--%>
<%--                        //毫秒--%>
<%--                };--%>
<%--                if (/(y+)/.test(fmt))--%>
<%--                        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")--%>
<%--                                .substr(4 - RegExp.$1.length));--%>
<%--                for ( var k in o)--%>
<%--                        if (new RegExp("(" + k + ")").test(fmt))--%>
<%--                                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])--%>
<%--                                        : (("00" + o[k]).substr(("" + o[k]).length)));--%>
<%--                return fmt;--%>
<%--        }--%>

<%--        function onload() {--%>
<%--                $.ajax({--%>
<%--                        url: "./blog/load.action",--%>
<%--                        dataType:"json",--%>
<%--                        type:'get',--%>
<%--                        beforeSend:function(){--%>
<%--                                $("#AjaxBlog").html("<h3>加载中<i class='iconfont icon-jiazai'></i></h3><br>");--%>
<%--                                $("#btnAjax").attr({ disabled: "disabled" });--%>
<%--                        },--%>
<%--                        success:function(data) {--%>
<%--                                document.getElementById("AjaxBlog").style.display="none";--%>
<%--                                var jData = eval(data.str);--%>
<%--                                var likeList = eval(data.likeList);--%>
<%--                                var uid = $("#uid").val();--%>
<%--                                let flag = false;--%>
<%--                                $("#blog").html("<h5>数据如下：</h5><br>");--%>

<%--                                for(let i=0; i<jData.length; i++){--%>
<%--                                        for(let n=0;n<likeList.length;n++){--%>
<%--                                            if(jData[i].blog_id==likeList[n].blog_id && uid ==likeList[n].user_id){--%>
<%--                                                flag = true;--%>
<%--                                                break;--%>
<%--                                            }--%>
<%--                                            // 获取到登录用户在likeList中点赞了该帖子，flag=true--%>
<%--                                        }--%>
<%--                                        var jComments = jData[i].commentDTOS;--%>
<%--                                        var str1 = "                ----------------------------------------------------------------------------------------------------\n" +--%>
<%--                                                "                ----------------------------------------------------------------------------------------------------\n" +--%>
<%--                                                "                <br>" +--%>
<%--                                                "                <div class='itemdiv dialogdiv blogText'><b>用户:</b><span id='userName'>" +jData[i].userName + "</span><br>" +--%>
<%--                                                "                <b>帖子内容：</b><span id="+"blogText"+i.toString()+">" + jData[i].blog_text + "</span><br>" +--%>
<%--                                                "                <b>帖子日期：</b><span id='blogDate'>" + new Date(jData[i].blog_date).format("yyyy-MM-dd hh:mm:ss") + "</span><br>" +--%>
<%--                                                "                <div class='tools' >" + "<button class='btn btn-app btn-danger btn-xs'><i class='icon-trash smaller-30'></i></button>" + "&nbsp;&nbsp;&nbsp;" ;--%>
<%--                                        if(flag){--%>
<%--                                            str1 +=  "                <a class='btn btn-minier btn-info' style='color:orange;' href='javascript:void(0)' onclick='replyBlog("+jData[i].blog_id+")'><i class='iconfont icon-pinglun'></i></a>" + "&nbsp;&nbsp;&nbsp;" +--%>
<%--                                                "                <button class='btn likeLabel' ><i class='iconfont icon-like'></i></button><span class='likeSpan' id='blogLike"+jData[i].blog_id.toString()+"'>已赞!" + jData[i].praise_countS+"</span>" +--%>
<%--                                                "                </div></div>";--%>
<%--                                        }   else {--%>
<%--                                            str1 += "                <a class='btn btn-minier btn-info' style='color:orange;' href='javascript:void(0)' onclick='replyBlog("+jData[i].blog_id+")'><i class='iconfont icon-pinglun'></i></a>" + "&nbsp;&nbsp;&nbsp;" +--%>
<%--                                            "                <button class='likeLabel' onclick='likeBlog("+ jData[i].blog_id +");this.disabled=true'><i class='iconfont icon-like'></i></button><span class='likeSpan' id='blogLike"+jData[i].blog_id.toString()+"'>"+jData[i].praise_count+"</span>" +--%>
<%--                                            "                </div></div>";--%>
<%--                                        }--%>

<%--                                        $("#blog").append(str1);--%>
<%--                                        $("#blog").append("<b>评论区</b> <br>");--%>
<%--                                        for(let j=0; j<jComments.length; j++) {--%>
<%--                                            var space = "&nbsp;";--%>
<%--                                            let str2 = "<div class='itemdiv dialogdiv'><p>" + space + jComments[j].userName +":" + jComments[j].comment_text + "</p>" +--%>
<%--                                                space + "留言于:" + new Date(jComments[j].comment_date).format("yyyy-MM-dd hh:mm:ss") + "<div class='tools' >" +--%>
<%--                                                "<a class='btn btn-minier btn-info' style='color:orange;' href='javascript:void(0)' onclick='replyComment(" + jComments[j].comment_id + ")'><i class='iconfont icon-pinglun'></i></a>" + "&nbsp;&nbsp;&nbsp;" +--%>
<%--                                                "<button class='likeLabel' onclick='likeComment(" + jComments[j].comment_id + ");this.disabled=true'><i class='iconfont icon-like'></i></button><span class='likeSpan' id='commentLike"+jComments[j].comment_id.toString()+"'>"+jComments[j].praise_count+"</span></div></div><br>";--%>
<%--                                            $("#blog").append(str2);--%>
<%--                                            loadChild(jComments[j], space + space);--%>
<%--                                        }--%>
<%--                                        if(jData[i].is_expert==1){--%>
<%--                                                var d = document.getElementById("blogText"+i.toString());--%>
<%--                                                d.style.color = "#FF0000";--%>
<%--                                                d.style.fontSize = "20px";--%>
<%--                                        }--%>
<%--                                }--%>
<%--                        }--%>
<%--                });--%>
<%--        }--%>

<%--        function  loadChild(child,space) {--%>
<%--                if(child.child!=null){--%>
<%--                        for(let h=0;h<child.child.length;h++){--%>
<%--                                let str3 = "<div class='itemdiv dialogdiv'><p>"+space+">>"+child.child[h].userName+" &nbsp;回复@"+child.userName+":"+child.child[h].comment_text+"</p>"--%>
<%--                                        +space+"留言于:"+ new Date(child.child[h].comment_date).format("yyyy-MM-dd hh:mm:ss") +--%>
<%--                                    "<div class='tools' ><a class='btn btn-minier btn-info' style='color:orange;' href='javascript:void(0)' onclick='replyComment(" + child.child[h].comment_id +")'><i class='iconfont icon-pinglun'></i></a>" + "&nbsp;&nbsp;&nbsp;" +--%>
<%--                                        "<button class='likeLabel' onclick='likeComment(" + child.child[h].comment_id + ");this.disabled=true'><i class='iconfont icon-like'></i></button><span class='likeSpan' id='commentLike"+child.child[h].comment_id.toString()+"'>"+child.child[h].praise_count+"</span></div></div><br>";--%>
<%--                                $("#blog").append(str3);--%>
<%--                                loadChild(child.child[h],space+space);--%>
<%--                        }--%>
<%--                }--%>
<%--        }--%>
<%--        // document.getElementById("commentPraise"+e.toString()).className='layui-icon-heart-fill';--%>
<%--        function askQuestion() {--%>
<%--                var content = $('#content').val();--%>
<%--                $.ajax({--%>
<%--                   url:"./blog/save.action?content="+content,--%>
<%--                   dataType: "json",--%>
<%--                   type:"get",--%>
<%--                   success:function (data) {--%>
<%--                       window.parent.location.reload();--%>
<%--                   }--%>
<%--                });--%>
<%--        }--%>

<%--        function replyComment(comment_id) {--%>
<%--            var consoleDlg = $("#consoleDlg");--%>
<%--            consoleDlg.html("");--%>
<%--            var a1 = "<iframe src='./comment/answer.action?fatherId="+comment_id+"&blogId=0' +scrolling='no' frameborder='0'></iframe>";--%>
<%--            consoleDlg.append(a1);--%>
<%--            consoleDlg.dialog("option", "title", "回复问题").dialog("open");--%>
<%--        }--%>

<%--        function likeComment(comment_id) {--%>
<%--            var likeCount = parseInt(document.getElementById("commentLike"+comment_id.toString()).innerText) + 1;--%>
<%--            document.getElementById("commentLike"+comment_id.toString()).innerText ="已赞!" + likeCount;--%>
<%--            $.ajax({--%>
<%--                url: "./like/likeComment.action?commentId="+comment_id,--%>
<%--                datatype:"json",--%>
<%--                type:'get',--%>
<%--                success:function(data) {--%>
<%--                    alert(eval(data.str));--%>
<%--                    // window.parent.$("#consoleDlg").dialog("close");--%>
<%--                    // window.parent.location.reload();--%>
<%--                }--%>
<%--            })--%>
<%--        }--%>

<%--        function replyBlog(blog_id) {--%>
<%--            var consoleDlg = $("#consoleDlg");--%>
<%--            consoleDlg.html("");--%>
<%--            var a1 = "<iframe src='./comment/answer.action?blogId="+blog_id+"&fatherId="+null+"' scrolling='no' frameborder='0'></iframe>";--%>
<%--            consoleDlg.append(a1);--%>
<%--            consoleDlg.dialog("option", "title", "回复问题").dialog("open");--%>
<%--        }--%>

<%--        function likeBlog(blog_id) {--%>
<%--            var likeCount = parseInt(document.getElementById("blogLike"+blog_id.toString()).innerText) + 1;--%>
<%--            document.getElementById("blogLike"+blog_id.toString()).innerText ="已赞!"+likeCount;--%>
<%--            $.ajax({--%>
<%--                url: "./like/likeBlog.action?blogId="+blog_id,--%>
<%--                datatype:"json",--%>
<%--                type:'get',--%>
<%--                success:function(data) {--%>
<%--                    alert(eval(data.str).toString());--%>
<%--                    // window.parent.$("#consoleDlg").dialog("close");--%>
<%--                    // window.parent.location.reload();--%>
<%--                }--%>
<%--            })--%>
<%--        }--%>
<%--</script>--%>
</html>
