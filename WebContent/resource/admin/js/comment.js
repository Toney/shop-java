$(function(){
	$('#commentlist').datagrid({
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
			id:'delete',
			text:'预览',
			handler:function(){
				
			}
		},
		{
			id:'delete',
			text:'删除',
			handler:function(){
				
			}
		}
		],
		columns:[[
			{field:'title',title:'评价人',width:200},
			{field:'url',title:'评价商品',width:250},
			{field:'image',title:'评价时间',width:250}
		]],
	});
});