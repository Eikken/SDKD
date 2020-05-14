<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script src='${pageContext.request.contextPath}/view/assets/js/jquery-2.0.3.min.js'></script>
<script type="text/javascript">
$.ajax({
	url: "../function/list?roleId=1",
	datatype:"json",
	type:'get',
	success:function(data) {
		var html = '';
		var functions = data.functions;
		for(var i=0; i<functions.length; i++){
			var farther = functions[i];
			//if(i==0){
			//	html += '<li id="'+farther.code+'" class="active open">';
			//}else{
				html += '<li id="'+farther.code+'">';
			//}
			html += '<a href="#" class="dropdown-toggle">'
				+ '<i class="icon-desktop"></i>'
				+ '<span class="menu-text">' + farther.name +'</span>'
				+ '<b class="arrow icon-angle-down"></b>'
				+ '</a>'
				+ '<ul class="submenu">';
			for(var j=0; j<farther.sonTree.length; j++){		
				var son = farther.sonTree[j];
				//if(j==0){
				//	html += '<li id="'+son.code+'" class="active">'
				//}else{
					html += '<li id="'+son.code+'">'
				//}
				html +=  '<a href="javascript:menuSelect(\''+son.url+'\',\''+farther.code+'\',\''+son.code+'\')">'
					+ '<i class="icon-double-angle-right"></i>'
					+ son.name
					+ '</a>'
					+ '</li>';
			}
			html += '</ul>'
		}
		html += '</li>';
		$('#fmUL').append(html);
	}	
})
function menuSelect(url,fcode,scode){
	window.location.href = url+'?fcode='+fcode+'&scode='+scode;
}
</script>
<ul id="fmUL" class="nav nav-list">
	 <li class="active">
		<a href="#">
			<i class="icon-dashboard"></i>
			<span class="menu-text"> 控制台 </span>
		</a>
	</li>

	<!--<li id="data">
		<a href="#" class="dropdown-toggle">
			<i class="icon-desktop"></i>
			<span class="menu-text"> 数据采集 </span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li class="active">
				<a href="fetchData.jsp">
					<i class="icon-double-angle-right"></i>
					数据抓取
				</a>
			</li>

			<li>
				<a href="#">
					<i class="icon-double-angle-right"></i>
					数据预处理
				</a>
			</li>

			<li>
				<a href="dropzone.jsp">
					<i class="icon-double-angle-right"></i>
					数据上传
				</a>
			</li>
		</ul>
	</li>	

	<li id="statistics">
		<a href="#" class="dropdown-toggle">
			<i class="icon-list"></i>
			<span class="menu-text">统计分析</span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu" id="dataStatistics">
			<li>
				<a href="statistics.jsp">
					<i class="icon-double-angle-right"></i>
					查询统计
				</a>
			</li>

			<li>
				<a href="#">
					<i class="icon-double-angle-right"></i>
					数据分析
				</a>
			</li>
		</ul>
	</li>

	<li id="danger">
		<a href="#" class="dropdown-toggle">
			<i class="icon-edit"></i>
			<span class="menu-text">风险评估</span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li>
				<a href="reviewConfigration.jsp">
					<i class="icon-double-angle-right"></i>
					评审设置
				</a>
			</li>

			<li>
				<a href="reviewStatus.jsp">
					<i class="icon-double-angle-right"></i>
					评审进度
				</a>
			</li>

			<li>
				<a href="reviewing.jsp">
					<i class="icon-double-angle-right"></i>
					专家审核
				</a>
			</li>
		</ul>
	</li>

	<li id="conmunication">
		<a href="#" class="dropdown-toggle">
			<i class="icon-list-alt"></i>
			<span class="menu-text">沟通系统</span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li>
				<a href="question.jsp">
					<i class="icon-double-angle-right"></i>
					问题反馈
				</a>
			</li>

			<li>
				<a href="#">
					<i class="icon-double-angle-right"></i>
					沟通
				</a>
			</li>
		</ul>
	</li>
	
	<li id="system">
		<a href="#" class="dropdown-toggle">
			<i class="icon-calendar"></i>
			<span class="menu-text">系统管理</span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li>
				<a href="newsManagement.jsp">
					<i class="icon-double-angle-right"></i>
					新闻管理
				</a>
			</li>

			<li>
				<a href="menuManagement.jsp">
					<i class="icon-double-angle-right"></i>
					菜单管理
				</a>
			</li>

			<li>
				<a href="roleManagement.jsp">
					<i class="icon-double-angle-right"></i>
					角色权限管理
				</a>
			</li>
			
			<li>
				<a href="userManagement.jsp">
					<i class="icon-double-angle-right"></i>
					用户管理
				</a>
			</li>
			
			<li>
				<a href="riskLevel.jsp">
					<i class="icon-double-angle-right"></i>
					危险等级管理
				</a>
			</li>
			
			<li>
				<a href="keyWord.jsp">
					<i class="icon-double-angle-right"></i>
					关键词管理
				</a>
			</li>
			
			<li>
				<a href="webInfo.jsp">
					<i class="icon-double-angle-right"></i>
					爬取网站管理
				</a>
			</li>
			
			<li>
				<a href="crawlerRule.jsp">
					<i class="icon-double-angle-right"></i>
					爬取规则管理
				</a>
			</li>
		</ul>
	</li>
	 -->
</ul><!-- /.nav-list -->