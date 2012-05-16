$(function(){
	$('#deliverylist').datagrid({
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
			text:'添加配送方式',
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
			{field:'title',title:'配送方式',width:200},
			{field:'url',title:'状态',width:250},
			{field:'image',title:'物流报价',width:250},
			{field:'image',title:'货到付款',width:250},
			{field:'image',title:'排序',width:250}
		]],
	});
});