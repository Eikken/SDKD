<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>登录页面</title>
	<meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文" />
	<meta name="description" content="站长素材提供Bootstrap模版,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- basic styles -->

	<link href="${pageContext.request.contextPath}/view/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/font-awesome.min.css" />
	<script src="${pageContext.request.contextPath}/view/libs/jquery-1.12.2.min.js" type="text/javascript" charset="UTF-8">
	</script>
	<script src="${pageContext.request.contextPath}/view/layer/layer.js" type="text/javascript">
	</script>
	<script src="${pageContext.request.contextPath}/view/js/login.js" type="text/javascript">
	</script>
	<script src="${pageContext.request.contextPath}/view/layui/layui.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/layui/css/layui.css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/font-awesome-ie7.min.css" />
	<![endif]-->

	<!-- page specific plugin styles -->

	<!-- fonts -->

	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

	<!-- ace styles -->

	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace-rtl.min.css" />

	<!--[if lte IE 8]>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/ace-ie.min.css" />
	<![endif]-->

	<!-- inline styles related to this page -->

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

	<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/view/assets/js/html5shiv.js"></script>
	<script src="${pageContext.request.contextPath}/view/assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body class="login-layout">
<div class="main-container">
	<div class="main-content">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="login-container">
					<div class="center">
						<h1>
							<i class="icon-leaf green"></i>
							<span class="red">Ace</span>
							<span class="white">Application</span>
						</h1>
						<h4 class="blue">&copy; 进出口纺织原料质量安全风险监测系统</h4>
					</div>

					<div class="space-6"></div>

					<div class="position-relative">
						<div id="login-box" class="login-box visible widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header blue lighter bigger" id="msg">
										<i class="icon-coffee green"></i>
										请输入登录信息，或者直接点击Twitter使用游客模式
									</h4>

									<div class="space-6"></div>

									<form id="loginForm" action="/user/loginCheck.action">
										<fieldset>
											<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" id="userName" name="userName" placeholder="Username" />
															<i class="icon-user"></i>
														</span>
											</label>

											<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" id="password" name="password" placeholder="Password" />
															<i class="icon-lock"></i>
														</span>
											</label>

											<div class="space"></div>

											<div class="clearfix">
												<label class="inline">
													<input type="checkbox" class="ace" />
													<span class="lbl"> Remember Me</span>
												</label>

												<button type="submit" class="width-35 pull-right btn btn-sm btn-primary" onclick="loginCheck()">
													<i class="icon-key"></i>
													Login
												</button>
											</div>

											<div class="space-4"></div>
										</fieldset>
									</form>

									<div class="social-or-login center">
										<span class="bigger-110">Or Login Using</span>
									</div>

									<div class="social-login center">
										<a class="btn btn-info" href="blog/findAll.action" >
											<i class="icon-facebook"></i>
										</a>

										<a class="btn btn-info" href="testquestion.action">
											<i class="icon-google"></i>
										</a>

										<a class="btn btn-danger" href="SendBlog.action?msg=1">
											<i class="icon-twitter"></i>
										</a>游客登录
									</div>
								</div><!-- /widget-main -->

								<div class="toolbar clearfix">
									<div>
										<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
											<i class="icon-arrow-left"></i>
											I forgot my password
										</a>
									</div>

									<div>
										<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">
											I want to register
											<i class="icon-arrow-right"></i>
										</a>
									</div>
								</div>
							</div><!-- /widget-body -->
						</div><!-- /login-box -->

						<div id="forgot-box" class="forgot-box widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header red lighter bigger">
										<i class="icon-key"></i>
										Retrieve Password
									</h4>

									<div class="space-6"></div>
									<p>
										Enter your email and to receive instructions
									</p>

									<form>
										<fieldset>
											<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
											</label>

											<div class="clearfix">
												<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
													<i class="icon-lightbulb"></i>
													Send Me!
												</button>
											</div>
										</fieldset>
									</form>
								</div><!-- /widget-main -->

								<div class="toolbar center">
									<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
										Back to login
										<i class="icon-arrow-right"></i>
									</a>
								</div>
							</div><!-- /widget-body -->
						</div><!-- /forgot-box -->

						<div id="signup-box" class="signup-box widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header green lighter bigger">
										<i class="icon-group blue"></i>
										New User Registration
									</h4>

									<div class="space-6"></div>
									<p> Enter your details to begin: </p>

									<form>
										<fieldset>
											<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
											</label>

											<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" />
															<i class="icon-user"></i>
														</span>
											</label>

											<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" />
															<i class="icon-lock"></i>
														</span>
											</label>

											<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Repeat password" />
															<i class="icon-retweet"></i>
														</span>
											</label>

											<label class="block">
												<input type="checkbox" class="ace" />
												<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
											</label>

											<div class="space-24"></div>

											<div class="clearfix">
												<button type="reset" class="width-30 pull-left btn btn-sm">
													<i class="icon-refresh"></i>
													Reset
												</button>

												<button type="button" class="width-65 pull-right btn btn-sm btn-success">
													Register
													<i class="icon-arrow-right icon-on-right"></i>
												</button>
											</div>
										</fieldset>
									</form>
								</div>

								<div class="toolbar center">
									<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
										<i class="icon-arrow-left"></i>
										Back to login
									</a>
								</div>
							</div><!-- /widget-body -->
						</div><!-- /signup-box -->
					</div><!-- /position-relative -->
				</div>
			</div><!-- /.col -->
		</div><!-- /.row -->
	</div>
	<div >
		<% if(session.getAttribute("user")!=null){ %>t
			<h5 style="color: #ff6a13">No User:<%= session.getAttribute("user")%></h5>
		<% } %>
	</div>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script> --> <!-- 文档加载过慢 -->

<!-- <![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
	window.jQuery || document.write("<script src='${pageContext.request.contextPath}/view/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
	window.jQuery || document.write("<script src='${pageContext.request.contextPath}/view/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/view/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
	function show_box(id) {
		jQuery('.widget-box.visible').removeClass('visible');
		jQuery('#'+id).addClass('visible');
	}
</script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
<script type="text/javascript">
	function loginCheck() {
		// $.post({
		// 	url:"./loginCheck.action",
		// 	data:{
		// 		"userName":$("#userName").val(),
		// 		"password":$("#password").val()
		// 	},
		// 	dataType:"text",
		// 	success:function (xhr,data) {
		// 		var str = xhr.responseText;
		// 		console.log("success responseText: "+str+"\n success data info: "+ data.responseText);
		// 		alert(data)
		// 		// window.location.href = data.result;
		// 	},
		// 	error:function (xhr, textStatus, errorThrown) {
		//
		// 		alert("状态码："+xhr.status+"\n状态:"+xhr.readyState+"\n错误信息:"+xhr.statusText +"\n返回响应信息："+xhr.responseText +"\n请求状态:"+textStatus);
		// 		alert(errorThrown);
		// 	}
		// });
	}
</script>
</html>