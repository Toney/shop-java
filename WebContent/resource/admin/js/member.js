$(function(){
	$('#memberlist').datagrid({
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
			text:'添加会员',
			iconCls:'icon-add',
			handler:function(){
				
			}
		},
		{
			id:'delete',
			text:'编辑',
			handler:function(){
				
			}
		},
		{
			id:'delete',
			text:'批量编辑',
			handler:function(){
				
			}
		},
		{
			id:'recyclebin',
			text:'回收站',
			handler:function(){
				
			}
		},
		{
			id:'recyclebin',
			text:'筛选',
			handler:function(){
				
			}
		},{
			id:'recyclebin',
			text:'预付款管理',
			handler:function(){
				
			}
		}
		],
		columns:[[
			{field:'title',title:'用户名',width:200},
			{field:'url',title:'会员等级',width:250},
			{field:'image',title:'姓名',width:250},
			{field:'image',title:'性别',width:250},
			{field:'image',title:'Email',width:100},
			{field:'image',title:'余额',width:100},
			{field:'image',title:'积分',width:100},
			{field:'image',title:'注册日期',width:100},
			{field:'image',title:'手机',width:100}
		]],
	});
});