$(function(){
	$('#orderlist').datagrid({
		url:'admin/order/getByCreateTime',
		fit:'true',
		nowrap: false,
		striped: true,
		collapsible:true,
		idField:'areaId',
        singleSelect:true,
        rownumbers:true,
		columns:[[
			{field:'orderNo',title:'订单号',width:200},
			{field:'acceptName',title:'收货人',width:200},
			{field:'payStatus',title:'支付状态',width:150},
			{field:'orderAmount',title:'金额',width:100},
			{field:'createTime',title:'下单时间',width:200}
		]],
	});
});
