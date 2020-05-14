<%--
  Created by IntelliJ IDEA.
  User: Celeste
  Date: 2020/5/3
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>进出口纺织原料质量安全风险监测系统</title>
    <meta name="keywords" content="进出口纺织原料质量安全风险监测系统" />
    <meta name="description" content="进出口纺织原料质量安全风险监测系统" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="${pageContext.request.contextPath}/view/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/font-awesome.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace-skins.min.css" />

    <script src="${pageContext.request.contextPath}/view/assets/js/ace-extra.min.js"></script>
</head>

<body>
<div class="main-container" id="main-container">
    <div class="form-actions">
        <div class="input-group">
            <input placeholder="输入您的回答 ..." type="text" class="form-control" name="content" id="content"/>
            <span class="input-group-btn">
                <button class="btn btn-sm btn-info no-radius" type="button" onclick="answerQuestion()">
                    <i class="icon-share-alt"></i>
                    发布
                </button>
            </span>
        </div>
    </div>
</div><!-- /.main-container -->
<input type="hidden" id="fatherId" value="<%=request.getParameter("fatherId") %>">
<input type="hidden" id="blogId" value="<%=request.getParameter("blogId") %>">
<%--<input type="hidden" id="parentId" value="<%=request.getParameter("parentId") %>">--%>
<script type="text/javascript">
    function answerQuestion(){
        var blogId = $('#blogId').val();
        var fatherId = $('#fatherId').val();
        var content = $('#content').val();
        if(blogId==0){
            $.ajax({
                url: "./replyComment.action?fatherId="+fatherId+"&content="+content,
                datatype:"json",
                type:'get',
                success:function(data) {
                    window.parent.$("#consoleDlg").dialog("close");
                    window.parent.location.reload();
                }
            })
        }else{
            $.ajax({
                url: "./replyBlog.action?blogId="+blogId+"&content="+content,
                datatype:"json",
                type:'get',
                success:function(data) {
                    window.parent.$("#consoleDlg").dialog("close");
                    window.parent.location.reload();
                }
            })
        }

    }
</script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${pageContext.request.contextPath}/view/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/view/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="${pageContext.request.contextPath}/view/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/view/assets/js/typeahead-bs2.min.js"></script>

<script src="${pageContext.request.contextPath}/view/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/view/assets/js/ace.min.js"></script>
</body>
</html>
