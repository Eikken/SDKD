<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/4/11
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.sdkd.*" %>
<html>
<head>
    <title>BLOG列表</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
</head>
<body>
    <div id="blogss">
        <h2>{{message}}</h2>
        <h3>帖子列表：</h3><br>
        <ul>
            <c:forEach items="${blogs}" var="blog">
                --------------------------------------------------
                <br>

                <li><b>用户:</b><span id="userName">${blog.userName}</span><br></li>
                <li><b>帖子内容：</b><span id="blogText">${blog.blog_text}</span><br></li>
                <li><b>发表时间:</b><span id="blogDate">
                        ${blog.blog_date}
                </span></li>
                <br>
                <li><b>点赞数： </b><span id="praiseCount">{{like}}</span><br></li>
                <li><div style="margin-left: 350px">
                    <a href="#" id="praise" @click="likeClick()">赞</a>
                </div></li>
            </c:forEach>
        </ul>
    <%--        <ul>--%>
<%--            <c:set var="obj" value="${blogs}"></c:set>--%>
<%--            <li v-for="(item,index) in obj">--%>
<%--                ----------------------------------------------------%>
<%--                <br>--%>
<%--                <b>用户</b><span id="userName">{{item.userName}}</span><br>--%>
<%--                <b>帖子内容：</b><span id="blogText">{{item.blog_text}}</span><br>--%>
<%--                <b>发表时间</b><span id="blogDate">--%>
<%--                {{item.blog_date}}--%>
<%--            </span>--%>
<%--                <b>点赞数： </b><span id="praiseCount">{{item.praise_count}}</span><br>--%>
<%--                <div style="margin-left: 350px">--%>
<%--                    <a href="#" id="praise" @click="likeClick(index)">赞</a>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--        </ul>--%>
    </div>

</body>
<script type="text/javascript">
    const blogss = new Vue({
        el:"#blogss",
        data:{
            message:"hello",
            obj:{},
            like:0
        },
        methods:{
          likeClick(index){
              this.praise_count+=1
          }
        }
    })
</script>
</html>
