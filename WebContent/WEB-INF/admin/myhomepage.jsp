<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script type="text/javascript" src="resource/admin/js/myhomepage.js"></script>
<table style="width:100%;">
	<tr>
		<td width="50%" valign="top">
		<table class="easyui-panel tb_list" title="概况"  fit="true">
					<tr>
						<td class="lefttd">销售总额</td>
						<td class="righttd" >sfs</td>
					</tr>
					<tr>
						<td class="lefttd">今年销售总额</td>
						<td class="righttd" ></td>
					</tr>
					<tr>
						<td class="lefttd">客户</td>
						<td class="righttd" ></td>
					</tr>
					<tr>
						<td class="lefttd">产品</td>
						<td class="righttd" ></td>
					</tr>
					<tr>
						<td class="lefttd">咨询</td>
						<td class="righttd" ></td>
					</tr>
					<tr>
						<td class="lefttd">评论</td>
						<td class="righttd" ></td>
					</tr>
				</table>
		</td>
		<td width="50%" valign="top">
		<table class="easyui-panel tb_list" title="订单信息"  fit="true" >
			<tbody>
			<tr>
							<td class="lefttd">总订单</td>
							<td class="righttd" >sf</td>
						</tr>
						<tr>
							<td class="lefttd">新订单</td>
							<td class="righttd" ></td>
						</tr>
						<tr>
							<td class="lefttd">未付款订单</td>
							<td class="righttd" ></td>
						</tr>
						<tr>
							<td class="lefttd">未发货订单</td>
							<td class="righttd" ></td>
						</tr>
						<tr>
							<td class="lefttd">七天未确认订单</td>
							<td class="righttd" ></td>
						</tr>
						<tr>
							<td class="lefttd">完成订单</td>
							<td class="righttd" ></td>
						</tr>
			</tbody>				
		</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<table id="orderlist" title="最新10条订单" fit="true"></table>
		</td>
	</tr>
</table>
