$(function(){
	$('#usergrouplist').datagrid({
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
			text:'添加用户组',
			iconCls:'icon-add',
			handler:function(){
				
			}
		},
		{
			id:'add',
			text:'编辑',
			iconCls:'icon-add',
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
			{field:'title',title:'会员组',width:200},
			{field:'url',title:'折扣率',width:250},
			{field:'image',title:'最小经验',width:250},
			{field:'image',title:'最大经验',width:250}
		]],
	});
});