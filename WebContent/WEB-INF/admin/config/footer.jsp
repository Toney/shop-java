<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<script charset="utf-8" src="resource/plugin/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="resource/plugin/kindeditor/lang/zh_CN.js"></script>
<style>
#msg_tr{display:none;}
</style>
<script>
var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="site_footer_code"]', {
		resizeType : 1,
		allowPreviewEmoticons : true,
		allowImageUpload : true,
		allowFileManager : true,
		items:editoritem_more,
		uploadJson:'file/upload',
		fileManagerJson:'file/filemanager',
		imgLocation:"resource/upload/images/config/"
	});
});
function config_footer_submit(){
	var param = {site_footer_code:editor.html()};
	$.get("admin/config/config_footer_do",param,function(data){
		if(data.type == "true"){
			$("#message").html("底部信息修改成功！");
		}else{
			$("#message").html(msg_ex);
		}
		$("#msg_tr").show();
	},'json');
}
</script>
</head>
<body class="body_panel easyui-layout">
<form method="post" id="form_config_footer" >
<table class="tab_form">
	<tr>
		<td>
		<textarea name="site_footer_code" id="site_footer_code"  style="width:100%;visibility:hidden;height:350px;">
			${system_config['site_footer_code']}
		</textarea>
		</td>
	</tr>
	<tr>
		<td><a href="javascript:config_footer_submit()" class="easyui-linkbutton" >保存站点底部信息</a></td>
	</tr>
	<tr id="msg_tr">
		<td><div id="message" class="success"></div></td>
	</tr>
</table>
</form>
</body>
</html>