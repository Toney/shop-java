<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript" src="resource/admin/js/config/guide.js"></script>
</head>
<body class="body_panel easyui-layout">
	<div region="center"  border="false" class="bdcenter">
		<form method="post" id="form_config_guide" >
			<input type="hidden" name="action" value="${action }" /> <input type="hidden"
				name="order" value="${order }" />
			<table class="tab_form">
				<tr>
					<td class="edittd">名称：</td>
					<td><input type="text" class="text easyui-validatebox"
						name="name" value="${guide.name }" required="true" validType="length[1,50]" /></td>
				</tr>
				<tr>
					<td class="edittd">链接地址：</td>
					<td><input type="text" class="text easyui-validatebox"
						name="link" value="${guide.link }" required="true" validType="length[1,100]" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="south" class="btnbar" border="false">
		<a class="easyui-linkbutton" iconCls="icon-ok"
			href="javascript:void(0)" onclick="config_guide()">编辑</a> <a
			class="easyui-linkbutton" iconCls="icon-cancel"
			href="javascript:void(0)" onclick="closePWin(1)">取消</a>
	</div>
</body>
</html>