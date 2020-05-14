<%@ page language="java" contentType="text/html;charset=UTF-8"
   pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Getting Started: Serving Web Content</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        hello Celeste!
        <br>
        <form method="post" action="${pageContext.request.contextPath}/user/countByName">
            
            <button type="button" onclick="backIndex()">click back</button>
        </form>

        <a href="./backIndex" value="click"> back index </a>
    </body>
</html>
<script type="text/javascript">

</script>