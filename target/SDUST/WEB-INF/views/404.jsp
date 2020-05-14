<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/4/28
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404</title>
    <script src="${pageContext.request.contextPath}/view/libs/jquery-1.12.2.min.js" type="text/javascript" charset="UTF-8">
    </script>
    <script src="${pageContext.request.contextPath}/view/layer/layer.js" type="text/javascript">
    </script>
    <script src="${pageContext.request.contextPath}/view/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/layui/css/layui.css">
    <style type="text/css">
        #return{
            position: absolute;
            top: 70%;
            left: 60%;
        }
    </style>
</head>
<body>
<h1 style="text-align: center;">404 Not Found</h1>
<br>
<div style="text-align: center;">
    <h4>Cause by:</h4>
    <p><%= session.getAttribute("tips") %></p>
    <a href="/user/login.action" class="layui-icon layui-icon-face-return" style="font-size: 50px; color: #000000;" id="return"></a>
</div>

<p style="text-align: center;">WebServe By Celeste timeAt:<%= new Date()%></p>
</body>
</html>
