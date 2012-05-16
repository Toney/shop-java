$(function(){
	$('#freightcompanylist').datagrid({
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
			id:'add',
			text:'添加物流公司',
			iconCls:'icon-add',
			handler:function(){
				
			}
		},
		{
			id:'delete',
			text:'删除',
			handler:function(){
				
			}
		},
		{
			id:'recyclebin',
			text:'回收站',
			handler:function(){
				
			}
		}
		],
		columns:[[
			{field:'title',title:'物流名称',width:200},
			{field:'url',title:'URL网址',width:250}
		]],
	});
});