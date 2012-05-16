<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${system_config['url']}">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${webtitle}</title>
<script type="text/javascript" src="resource/easyui/jquery-1.7.2.min.js"></script>
<link href="resource/admin/login/css/login.css" rel="stylesheet" type="text/css" />
<style>
.Errormsg{padding:0 0 0 10px; line-height:25px; color:#4c4c4c; font-size:14px;}
</style>
<script language="JavaScript">
function fleshVerify(){ 
	$('#verifyImg').attr('src', '/kaptcha.jpg?' + Math.floor(Math.random()*100) ); 
}
</script>
</head>
<body>
<div id="login">
	<div id="login_header">
		<h1 class="login_logo">
			<a href="index.php/webmaster/login"><img src="resource/admin/login/images/login_logo.gif" /></a>
		</h1>
		<div class="login_headerContent">
			<div class="navList">
				<ul>
					<li><a href="#">返回首页</a></li>
					<li><a href="#">反馈</a></li>
					<li><a href="#">帮助</a></li>
				</ul>
			</div>
			<h2 class="login_title"><img src="resource/admin/login/images/login_title.png" /></h2>
		</div>
	</div>
	<div id="login_content">
		<div class="loginForm">
			<c:if test="${message!=null }">
				<p><span class="Errormsg">${message }</span></p>
			</c:if>
			<form method="post" action="admin/webmaster/login" >
				<p>
					<label>帐号：</label>
					<input type="text" name="user_name" size="20" class="login_input" />
				</p>
				<p>
					<label>密码：</label>
					<input type="password" name="password" size="20" class="login_input" />
				</p>
				<p>
					<label>验证码：</label>
					<input class="code" name="verify" type="text" size="5" />
				</p>
				<p>
					<img id="verifyImg" src="kaptcha.jpg" style="margin-top:10px;margin-left:10px;" onClick="fleshVerify()" border="0" title="点击刷新验证码" alt="点击刷新验证码" style="cursor:pointer" align="absmiddle"/>
				</p>
				<div class="login_bar" >
					<input class="sub" type="submit" name="form_submit" value=" " />
				</div>
			</form>
		</div>
		<div class="login_banner"><img src="resource/admin/login/images/login_banner.jpg" /></div>
		<div class="login_main">
		</div>
	</div>
	<div id="login_footer">
		中国百分百商城系统
	</div>
</div>
</body>
</html>