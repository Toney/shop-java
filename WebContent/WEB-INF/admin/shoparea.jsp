<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<script type="text/javascript" src="resource/admin/js/area.js"></script>
</head>
<body class="body_panel">
<div class="hidden">

<div  id="win_area" title="添加地区"  style="padding:5px;width:320px;height:160px;">
<table>
    <tr>
        <td>排序：</td>
        <td><input type="text" id="sort" class="easyui-numberbox" min="0" max="255" required="true" /></td>
    </tr>
    <tr>
        <td>地区名称：</td>
        <td><input type="text" id="area_name" class="easyui-validatebox" required="true" length="[0,25]" /></td>
    </tr>
</table>
</div>
</div>

<table class="tb_list">
    <tr>
        <td>
            查看下一级地区&nbsp;&nbsp;<select id="province" onchange="getArea(this.value,2)">
                <option>-省份-</option>
                <c:forEach items="${shopAreaList }" var="area">
                	<option value="${area.areaId }">${area.areaName }</option>
                </c:forEach>
            </select>&nbsp;&nbsp;<select id="citys" onchange="getArea(this.value,3)" >
                <option>-城市-</option>
            </select>&nbsp;&nbsp;<select id="county" >
                <option>-州县-</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>
            <table id="area"></table>
        </td>
    </tr>
</table>
</body>
</html>