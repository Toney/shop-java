<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<ul class="easyui-tree" animate="true" lines="true" >
	<li><span>后台首页</span>
		<ul>
			<li><a href="javascript:tab('我的主页','admin/webmaster/menu?item=myhomepage');">后台首页</a></li>
		</ul></li>
	<li><span>网站管理</span>
		<ul>
			<li><a href="javascript:tab('网站设置','admin/config/index')">网站设置</a></li>
			<li>主题设置</li>
		</ul></li>
	<li><span>支付管理</span>
		<ul>
			<li>支付方式</li>
		</ul></li>
	<li><span>多平台登入</span>
		<ul>
			<li><a href="javascript:tab('主题设置','admin/oauth/list')">平台列表</a></li>
		</ul></li>
	<li><span>配送管理</span>
		<ul>
			<li><a
				href="/iwebshop/index.php?controller=system&amp;action=delivery">配送方式</a></li>
			<li><a
				href="/iwebshop/index.php?controller=system&amp;action=area">地区管理</a></li>
			<li><a
				href="/iwebshop/index.php?controller=system&amp;action=freight_list">物流公司</a></li>
			<li><a
				href="/iwebshop/index.php?controller=system&amp;action=express">快递跟踪</a></li>
		</ul></li>
		<li><span>权限管理</span><ul><li><a href="/iwebshop/index.php?controller=system&amp;action=admin_list">管理员</a></li><li><a href="/iwebshop/index.php?controller=system&amp;action=role_list">角色</a></li><li><a href="/iwebshop/index.php?controller=system&amp;action=right_list">权限资源</a></li></ul></li>
		<li><span>系统升级</span><ul><li><a href="/iwebshop/index.php?controller=system&amp;action=upgrade_1">系统升级</a></li></ul></li>
</ul>