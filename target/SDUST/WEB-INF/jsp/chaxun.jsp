<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户名查询</title>
    <script src="libs/jquery-1.12.2.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="layui.layui.js" type="text/javascript" charset="UTF-8">
    </script>
    <script src="layer/layer.js" type="text/javascript">
    </script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div  class="layui-container" id="formaction">
    <form action="./countByName" method="post" class="formcenter" accept-charset="UTF-8">
        <div class="layui-row" id="chaxun" >
            <div class="layui-col-md4" id="name" style="color: red;font-size: 20px;">
                输入用户名：
                <br>                <br>

                <input type="text" name="username" required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" style="width: 250px;">
                <br>                <br>

                <button type="submit" class="layui-btn layui-col-md4 layui-col-md-offset4">提交</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>

