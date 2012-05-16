$(function(){
    $('#accordion').accordion({collapsible:false});
    $('#tabs').tabs({
    	onSelect:function(title){
    		currenttab = $('#tabs').tabs("getSelected");
    		
    	}
    });
    tab('我的主页','admin/webmaster/menu?item=myhomepage');
    menuList('system');
});