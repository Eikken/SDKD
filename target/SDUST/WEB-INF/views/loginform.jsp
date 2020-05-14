<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/4/11
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta content="IE=11.0000"
          http-equiv="X-UA-Compatible">
    <META charset="UTF-8">
    <title>loginForm</title>
    <LINK href="${basePath}/css/normalize.css" rel="stylesheet">
    <script src="${basePath}/libs/jquery-1.12.2.min.js" type="text/javascript" charset="UTF-8">
    </script>
    <script src="${basePath}/layer/layer.js" type="text/javascript">
    </script>
    <link rel="stylesheet" href="${basePath}/layui/css/layui.css">
    <STYLE type="text/css">
        .btn { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
        .btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
        .btn-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
        .btn:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
        .btn-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
        .btn-primary.active { color: rgba(255, 255, 255, 0.75); }
        .btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
        .btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
        .btn-block { width: 100%; display:block; }

        * { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

        html { width: 100%; height:100%; overflow:hidden; }

        body {
            width: 100%;
            height:100%;
            font-family: 'Open Sans', sans-serif;
            background-color: #D3D4D3;
            background-size:cover;
            background-position:center;

        }
        .login {
            position: absolute;
            top: 69%;
            left: 60%;
            margin: -150px 0 0 -150px;
            width:377px;
            height:420px;
            transform:translate(-50%,-50%);
            background:rgba(255,255,240, 127);
            /*box-sizing:border_box;*/
            padding:80px 40px;
            border-radius: 10px;
        }
        .login h1 { color: #FFB800; text-shadow: 0 0 10px rgba(0,255,233,0.3); letter-spacing:1px; text-align:center;height:100px;margin-top:0px}
        #wechaticon{
            position: absolute;
            left: 30%;
            bottom: 3%;
        }
        #phoneicon{
            position: absolute;
            right: 30%;
            bottom:3%;
        }
        #tips{
            color: #ff5500;
        }
        input {
            width: 100%;
            margin-bottom: 10px;
            background: #fffece;
            border: none;
            outline: none;
            padding: 10px;
            font-size: 13px;
            color: #909090;
            /*text-shadow: 1px 1px 1px rgba(99, 99, 99, 76);*/
            border: 1px solid rgba(0,0,0,0.3);
            border-radius: 4px;
            box-shadow: inset 0 -5px 45px rgba(245,245,245,0.2), 0 1px 1px rgba(255,255,255,0.2);
            -webkit-transition: box-shadow .5s ease;
            -moz-transition: box-shadow .5s ease;
            -o-transition: box-shadow .5s ease;
            -ms-transition: box-shadow .5s ease;
            transition: box-shadow .5s ease;
        }
        input:focus { box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); }
    </STYLE>
</head>
<body>
"request.getContextPath()的值是   "<%=request.getContextPath()%>"<br/>
"pageContext.request.contextPath的值是"${pageContext.request.contextPath}"<br/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
展示basepath<%=basePath %>
<DIV class="login">
    <H1>进出口纺织原料质量安全风险检测系统</H1>
    <FORM>
        <INPUT name="userName" id="userName" required="required" type="text" placeholder="请输入用户名" value="">
        <INPUT name="password" id="password" required="required" type="password" placeholder="请输入密码" value="">
        <BUTTON class="btn btn-primary btn-block btn-large" onclick="login()">登录</BUTTON>
        <br>
        <div id="tips" style="text-align:center">选择微信或者手机号便捷登录</div>
        <a class="layui-icon layui-icon-login-wechat layui-anim layui-anim-scale " href="defaultlogin.html" id="wechaticon" style="font-size: 40px; color: #00d000;"></a>
        <a class="layui-icon layui-icon-cellphone layui-anim layui-anim-scale " href="index.html" id="phoneicon" style="font-size: 40px; color: #a63700;" ></a>
    </FORM>

</DIV>

</body>
</html>
