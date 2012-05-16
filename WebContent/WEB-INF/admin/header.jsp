<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${system_config['url']}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${webtitle}</title>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/cupertino/easyui.css">
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="resource/admin/css.css">
<link rel="stylesheet" type="text/css" href="resource/admin/easyui_update.css">
<script type="text/javascript" src="resource/easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="resource/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resource/easyui/locale/easyui-lang-zh_CN.js"></script>
<link href="resource/plugin/loadmask/jquery.loadmask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resource/plugin/loadmask/jquery.loadmask.min.js"></script>
<script type="text/javascript" src="resource/admin/global.js"></script>
