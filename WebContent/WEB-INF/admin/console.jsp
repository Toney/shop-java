<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<script type="text/javascript" src="resource/admin/top.js"></script>
<script type="text/javascript" src="resource/admin/js/index.js"></script>
</head>
<body id="bodycontainer" class="easyui-layout">
		<div region="north" style="height:85px;overflow:hidden;" class="headerNav">
			<a class="logo"></a>
            <ul class="nav">
                <li><a>修改密码</a></li>
                <li><a>修改资料</a></li>
                <li><a href="admin/webmaster/loginout">退出</a></li>
            </ul>
            <div id="navMenu">
				<ul>
					<li><a id="nav_goods" href="javascript:menuList('goods')"><span>商品</span></a></li>
					<li><a id="nav_memeber" href="javascript:menuList('member')"><span>会员</span></a></li>
					<li><a id="nav_order" href="javascript:menuList('order')"><span>订单</span></a></li>
					<li><a id="nav_market" href="javascript:menuList('market')"><span>营销</span></a></li>
					<li><a id="nav_stat" href="javascript:menuList('stat')"><span>统计</span></a></li>
					<li><a id="nav_system" href="javascript:menuList('system')"  class="selected" ><span>系统</span></a></li>
                    <li><a id="nav_tool" href="javascript:menuList('tool')"><span>工具</span></a></li>
				</ul>
			</div>
		</div>
		<div region="south" style="height:30px;background:#efefef;text-align: center;padding-top:5px;">
		中国百分百商城系统
		</div>
		<div region="west" split="true" style="width:150px;overflow:hidden;">
			<div id="accordion" fit="true" border="false">
			</div>
		</div>
		<div region="center" style="overflow:hidden;">
			<div id="tabs" fit="true" border="false" >
			</div>
		</div>
</body>
</html>