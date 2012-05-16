$(function(){
	$('#goodslist').datagrid({
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
			text:'添加商品',
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
			id:'delete',
			text:'上架',
			handler:function(){
				
			}
		},
		{
			id:'delete',
			text:'下架',
			handler:function(){
				
			}
		},{
			id:'delete',
			text:'导入',
			handler:function(){
				
			}
		},{
			id:'delete',
			text:'导出',
			handler:function(){
				
			}
		},{
			id:'delete',
			text:'回收站',
			handler:function(){
				
			}
		}
		],
		columns:[[
			{field:'title',title:'商品名称',width:200},
			{field:'url',title:'分类',width:250},
			{field:'image',title:'销售价',width:250},
			{field:'image',title:'库存',width:250},
			{field:'image',title:'上架',width:250},
			{field:'image',title:'市场价',width:250},
			{field:'image',title:'品牌',width:250},
			{field:'image',title:'重量',width:250},
			{field:'image',title:'排序',width:250}
		]],
	});
});