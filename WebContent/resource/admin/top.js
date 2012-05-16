function wind(options) {
	$('#'+options.id).window(
			{
				title : options.title,
				width : options.width === undefined ? "auto" : options.width,
				height : options.height === undefined ? "auto" : options.height,
				modal : options.modal === undefined ? true : options.modal,
				minimizable : options.minimizable === undefined ? false : options.minimizable,
				maximizable : options.maximizable === undefined ? false : options.maximizable,
				shadow : false,
				cache : false,
				closed : false,
				collapsible : false,
				resizable : false,
				draggable:false,
				loadingMessage : '正在加载数据，请稍等片刻......'
			});
	
}
function hideWind(id){
	$('#'+id).window('close');
}
