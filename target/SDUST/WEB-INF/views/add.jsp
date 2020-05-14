<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/5/14
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>add user page</title>
    <script src="${pageContext.request.contextPath}/view/libs/jquery-1.12.2.min.js" type="text/javascript" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/view/layer/layer.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/view/layui/layui.js"></script>
    <style type="text/css">

    </style>
</head>
<body>
<div class="layui-container">
    <blockquote class="layui-elem-quote">添加一个用户，详细信息让用户自己去改去吧！</blockquote>
    <div class="layui-col-xs12">
        <div class="grid-demo grid-demo-bg1">
            <form class="layui-form" action="/user/addUser.action">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" id="name" lay-verify="title" autocomplete="off" placeholder="请输入名称,不要超过10个字符哦" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">账  号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="id" id="id" lay-verify="required" lay-reqtext="账号是必填项，岂能为空？" placeholder="请输入账号,形同16010207XX" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密  码：</label>
                    <div class="layui-input-block">
                        <input type="text" name="password" id="password" lay-verify="required" lay-reqtext="新用户不设个密码？" placeholder="请输入密码,初次使用建议密码123123" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">分配角色：</label>
                        <div class="layui-input-inline">
                            <select name="role" id="role" lay-verify="" lay-search="">
                                <option value="">选择角色信息</option>
                                <option value="0">普通用户</option>
                                <option value="1">专家用户</option>
                                <option value="2">管理员</option>
                            </select>
                        </div>
                    </div>
                    <br><br><br><br>
                    <div class="layui-row">
                        <div class="layui-col-xs1">
                            <div id="">
                                &nbsp;
                            </div>
                        </div>
                        <div class="layui-col-xs6">
                            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即添加</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="reset" class="layui-btn layui-btn-primary" lay-submit="" lay-filter="demo2">重置信息</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                </div>
            </form>
            <div style="font-size: 15px">
                <a href="adminManage.action">点击返回</a>上一页
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function back(){
        window.location="./add.action"
    }

    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });

    function getQueryVariable(variable)
    {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
        }
        return(false);
    }
    if(getQueryVariable("error")!=false){
        layui.use("layer",function () {
            var layer = layui.layer
            layer.msg(error)
        })
    }
</script>
</html>
