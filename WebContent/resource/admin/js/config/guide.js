$(function(){
	//导航编辑的Form,添加和修改操作 form_config_guide
	$('#form_config_guide').form({
		url:"admin/guide/config_guide_do",
		onSubmit : function() {
			if($('#form_config_guide').form("validate")){
				return true;
			}else{
				return false;
			}
		},
		success : function(data) {
			try{
				data = eval("(" + data + ")");
				if(data.type=="true"){
					//top.success(data.message);
					debugger;
					top.currenttab.$("#guidelist").datagrid('reload');
					top.hideWind(1);
				}else{
					top.error(data.message);
				}
			}catch(e){
				top.exception();
			}
			
		}
	});
});

