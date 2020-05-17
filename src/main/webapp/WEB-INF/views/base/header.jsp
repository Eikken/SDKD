<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="navbar-container" id="navbar-container">
	<div class="navbar-header pull-left">
		<a href="testSendBlog.action" class="navbar-brand">
			<small>
				<i class="icon-leaf"></i>
				进出口纺织原料质量安全风险监测系统
			</small>
		</a><!-- /.brand -->
	</div><!-- /.navbar-header -->

	<div class="navbar-header pull-right" role="navigation">
		<ul class="nav ace-nav">
			<li class="light-blue">
				<a data-toggle="dropdown" href="./admin.action" class="dropdown-toggle">
					<%
						Object obj = session.getAttribute("USER");
						if (obj != null){
					%>
					<img class="nav-user-photo" src="${pageContext.request.contextPath}/view/assets/avatars/huge.jpg" alt="SDUST" />
					<%} %>
					<span class="user-info" id="userSpan">
						<small>欢迎<%=session.getAttribute("currentRole") %>：<br><%=session.getAttribute("currentName") %></small>
					</span>
<%--					<%=session.getAttribute("currentRole") %>--%>
					<i class="icon-caret-down"></i>
				</a>

				<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
					<li>
						<a href="./profile.action?uid=<%=session.getAttribute("uid") %>">
							<i class="icon-user"></i>
							个人信息
						</a>
					</li>
					<li>
						<a href="./admin.action">
							<i class="icon-cog"></i>
							后台管理
						</a>
					</li>
					<li>
						<a href="javascript:logout()">
							<i class="icon-off"></i>
							注销
						</a>
					</li>
				</ul>
			</li>
		</ul><!-- /.ace-nav -->
	</div><!-- /.navbar-header -->
</div><!-- /.container -->
<script>
	function logout(){
		$.ajax({
			url: "./loginout.action",
			datatype:"json",
			type:'get',
			success:function(data) {
				alert('注销成功');
				window.location.href = './login.action';
			}
		});
	}
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
	$(function () {
		var msg = getQueryVariable("msg");
		console
		if(msg==1){
			$("#userSpan").html("<small>游客登录模式<br>发言请先登录！</small>")
			// $("#msg").attr("class","header red lighter bigger");
		}
	})
</script>