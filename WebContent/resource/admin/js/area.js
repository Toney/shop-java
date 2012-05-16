var parent_id = 0;
var currentdeep = 1;
var lastIndex;
$(function(){
    $('#area').datagrid({
		nowrap: false,
		striped: true,
		collapsible:true,
		idField:'areaId',
        singleSelect:true,
		columns:[[
			{field:'areaSort',title:'排序',width:100,editor:{type:'numberbox',options:{min:0,max:255,required:true}}},
			{field:'areaName',title:'地区名称',width:400,editor:{type:'validatebox',options:{required:true,validType:"length[1,10]"}}}
		]],
		rownumbers:true,
		toolbar:[{
			text:'添加',
			iconCls:'icon-add',
			handler:function(){
                addArea();
			}
		},'-',{
			text:'保存',
			iconCls:'icon-save',
			handler:function(){
				$('#area').datagrid('endEdit', lastIndex);
				var lastchange = $('#area').datagrid('getChanges');
				if(lastchange.length!=0){
					updateArea(lastIndex,lastchange[0]);
				}
			}
		},'-',{
			text:'删除',
			iconCls:'icon-remove',
			handler:function(){
                deleteArea();
			}
		}],
		onDblClickRow:function(rowIndex,rowdata){
			$('#area').datagrid('rejectChanges');
			$('#area').datagrid('beginEdit', rowIndex);
			lastIndex = rowIndex;
		},
		onClickRow:function(rowIndex,rowdata){
			//得到修改的行
			$('#area').datagrid('endEdit', lastIndex);
			var lastchange = $('#area').datagrid('getChanges');
			if(lastchange.length!=0){
				updateArea(lastIndex,lastchange[0]);
			}
        }
	});
    
    
    var province = $("#province").val();
    if(typeof(province)!='number'){
        $('#area').datagrid("options").url = 'admin/shoparea/getAreas';
        $('#area').datagrid("options").queryParams = {pid:0,deep:1};
        $('#area').datagrid("reload");
    }
});
function getArea(pid,deep){
	
    //设置select
    if(deep == 2 ){
        if(pid=='-省份-'){
            pid = 0;
            deep = 1;
        }else{
            //设置城市
            setCity(pid);
        }
    }else if(deep == 3){
        if(pid=='-城市-'){
            var province = $("#province").val();
            if(province!="-省份-"){
                //设置城市
                setCity(province);
                //州县清空
                $("#county").html('<option>-州县-</option>');
            }
        }else{
            //设置州县
            setCounty(pid);
        }
    }
    
	if(pid==0&&deep==1){
		//刷新城市列表
	    $.post('admin/shoparea/getAreaByParentId',{areaParentId:pid},function(data){
	        g_select('province',data,{key:'areaId',value:'areaName'},'<option>-省份-</option>');
	    },'json');
	}
    
    parent_id = pid;
    currentdeep = deep;
    
    $('#area').datagrid("options").url = 'admin/shoparea/getAreas';
    $('#area').datagrid("options").queryParams = {pid:pid,deep:deep};
    $('#area').datagrid("reload");
    
    
}
function setCity(pid){
    $.post('admin/shoparea/getAreaByParentId',{areaParentId:pid},function(data){
        g_select('citys',data,{key:'areaId',value:'areaName'},'<option>-城市-</option>');
    },'json');
}
function setCounty(pid){
    $.post('admin/shoparea/getAreaByParentId',{areaParentId:pid},function(data){
        g_select('county',data,{key:'areaId',value:'areaName'},'<option>-州县-</option>');
    },'json');
}
function addArea(){
    $('#win_area').dialog({
        modal:true,
    	buttons:[{
    		text:'确定',
    		handler:function(){
    		  if($("#sort").validatebox('isValid')&&$("#area_name").validatebox('isValid')){
    		      //提交数据，刷新GRID
                  var param = {
                	areaName:$("#area_name").val(),
                	areaParentId:parent_id,
                	areaDeep:currentdeep,
                	areaSort:$("#sort").val()
                  };
                  
                  $.post('admin/shoparea/addArea',param,function(message){
                    if(message.type == 'false'){
                        $.messager.alert('提示',message.message);
                    }
                    
                    getArea(parent_id,currentdeep);
                    $('#win_area').dialog("close");
                    
                  },'json');
                  
    		  }
    		}
    	},{
    		text:'取消',
    		handler:function(){
    	       $('#win_area').dialog('close');
    		}
    	}],
        onClose:function(){
            $(".validatebox-tip").hide();
            $("#area_name").val("")
            $("#sort").val("")
        }
    });  
}
function updateArea(rowindex,rowdata){
    $("#area_name").val(rowdata.areaName)
    $("#sort").val(rowdata.areaSort)
    
    var param = {
    	areaId:rowdata.areaId,
        areaName:rowdata.areaName,
        areaParentId:parent_id,
        areaDeep:currentdeep,
        areaSort:rowdata.areaSort
      };
      
      $.post('admin/shoparea/updateArea',param,function(message){
        if(message.type == 'false'){
            $.messager.alert('提示',message.message);
        }
        $('#area').datagrid('acceptChanges');
        getArea(parent_id,currentdeep);
      },'json');
}
//删除地区
function deleteArea(){
	var select = $('#area').datagrid("getSelected");
	var areaId = select.areaId;
	$.post('admin/shoparea/deleteArea',{areaId:areaId},function(message){
		if(message.type == 'false'){
			$.messager.alert('提示',message.message);
		}else{
			$('#area').datagrid("reload");
		}
	},'json');
}