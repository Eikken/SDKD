<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/4/28
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>500</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/view/libs/jquery-1.12.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/view/layer/layer.js" type="text/javascript">
    </script>
    <style type="text/css">
        #return{
            position: absolute;
            top: 50%;
            left: 70%;
        }
        #label{
            position: absolute;
            left: 32%;
            bottom:100px;
            font-size: 20px;
        }
    </style>
</head>
<body>
<h1 id="head_text" style="text-align: center;">500 Internal Service Error!</h1>
<br>
<div>
    <h2>Cause by:</h2>
    <p style="color: red; font-size: 20px;"><%= session.getAttribute("tips") %></p>
    <a href="/user/login.action" class="layui-icon layui-icon-return" style="font-size: 25px; color: #000000;" id="return">back</a>
</div>

<p id="label">WebServe By Celeste timeAt:<%= new Date()%> </p>
</body>
</html>
