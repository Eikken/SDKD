<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/4/21
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajax测试 BlogList</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/view/libs/jquery-1.12.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/layui/layui.js"></script>
</head>
<body>

    <div >
        <button type="button" id="btnAjax" class="layui-btn">点击加载Ajax</button>
        <h3 >ajax帖子列表：</h3><br>
        <p id="AjaxBlog"></p>
        <ul id="blog">
        </ul>
    </div>
</body>
<script type="text/javascript">
    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.format = function(fmt) {
        var o = {
            "M+" : this.getMonth() + 1, //月份
            "d+" : this.getDate(), //日
            "h+" : this.getHours(), //小时
            "m+" : this.getMinutes(), //分
            "s+" : this.getSeconds(), //秒
            "q+" : Math.floor((this.getMonth() + 3) / 3), //季度
            "S" : this.getMilliseconds()
            //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
        for ( var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
                    : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    jQuery(function($) {
        $("#btnAjax").click(function () {
            $.ajax({
                url: "./blog/load.action",
                dataType:"json",
                type:'get',
                beforeSend:function(){
                    $("#AjaxBlog").html("<h3>加载中……</h3><br>");
                    $("#btnAjax").attr({ disabled: "disabled" });
                },
                success:function(data) {
                    document.getElementById("AjaxBlog").style.display="none";
                    var jData = eval(data.str);
                    $("#blog").html("<h3>数据如下：</h3><br>");
                    for(let i=0; i<jData.length; i++){
                        var str1 = "                --------------------------------------------------\n" +
                            "                <br>" +
                            "                <li><b>用户:</b><span id='userName'>" +jData[i].userName + "</span><br></li>" +
                            "                <li><b>帖子内容：</b><span id="+"blogText"+i.toString()+">" + jData[i].blog_text + "</span><br></li>" +
                            "                <li><b>帖子日期：</b><span id='blogDate'>" + new Date(jData[i].blog_date).format("yyyy-MM-dd hh:mm:ss") + "</span><br></li>" +
                            "                <li><b>点赞数： </b><span id='praiseCount'>" + jData[i].praise_count + "</span><br></li>" +
                            "                <li><div style='margin-left: 350px'>" +
                            "                    <a href=\"#\" id=\"praise\" style='color: yellowgreen'>赞</a>" +
                            "                </div></li>";
                        $("#blog").append(str1);
                        if(jData[i].is_expert==1){
                            var d = document.getElementById("blogText"+i.toString());
                            d.style.color = "#FF0000";
                        }
                    }
                }
            });
        });
    });
    // (function(){
   //      $('#btnAjax').click(function(){
   //          $.ajax({
   //              type: "post",
   //              url: "./blog/load.action",
   //              dataType: "json",
   //              success: function(data){
   //                 console.log(data);
   //              }
   //          });
   //      });
   //  });

</script>
<script type="text/javascript">

</script>
</html>
<%--for(let i=0; i<data.data.length; i++){--%>
<%--var str = "                --------------------------------------------------\n" +--%>
<%--"                <br>" +--%>
<%--"                <li><b>用户:</b><span id=\"userName\">" + data.data[i].userName + "</span><br></li>" +--%>
<%--"                <li><b>帖子内容：</b><span id=\"blogText\">" + data.data[i].blog_text + "</span><br></li>";--%>
<%--$("#blog").append(str);--%>
<%--}--%>
<%--$.each(data.blog,function (index,item) {--%>
<%--$("#blog").html($(("#blog").html()+--%>
<%--"<ul>"+ "<li><b>用户:</b><span id=\"userName\">"+item.userName+"</span><br></li>"+--%>
<%--"<li><b>帖子内容：</b><span id=\"blogText\">"+item.blog_text+"</span><br></li>"+--%>
<%--"<li><b>发表时间:</b><span id=\"blogDate\">"+item.blog_date+"</span></li>"+--%>
<%--"<br><li><b>点赞数： </b><span id=\"praiseCount\">" +item.praise_count+"</span><br></li>"+--%>
<%--"<li><div style=\"margin-left: 350px\"><a href=\"#\" id=\"praise\" @click=\"likeClick()\">赞</a>"+--%>
<%--"</div></li>"+--%>
<%--"</ul>"));--%>