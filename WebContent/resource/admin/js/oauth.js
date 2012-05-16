$(function(){
	$('#oauthlist').datagrid({
		url:'',
		fit:'true',
		nowrap: false,
		striped: true,
		collapsible:false,
		idField:'order',
        singleSelect:true,
        rownumbers:true,
        toolbar:[
		{
			id:'update',
			text:'修改',
			iconCls:'icon-edit',
			handler:function(){
				
				var selected = $('#guidelist').datagrid('getSelected');
				if(selected){
					
				}else{
					message("请选择一行记录！");
				}
				
			}
		}
		],
		columns:[[
			{field:'title',title:'图标',width:200},
			{field:'url',title:'名称',width:250},
			{field:'image',title:'描述',width:250},
			{field:'image',title:'开启状态',width:250}
		]],
	});
});