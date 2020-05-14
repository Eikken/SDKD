function afterEditSubmit(xhr, postdata) {
	$("#editmodgrid-table").jqmHide();
	var id = $("#grid-table").jqGrid('getGridParam', 'selrow');
	jQuery("#grid-table").jqGrid('setRowData', id, postdata);
	$("#grid-table").trigger("reloadGrid");//操作完成后刷新表单
}

function afterNewSubmit(xhr, postdata) {
	$("#editmodgrid-table").jqmHide();
	var id = $("#grid-table").jqGrid('getGridParam', 'selrow');
	jQuery("#grid-table").jqGrid('addRowData', postdata.Id, postdata);
	return [true, 'successfule!', false];
}
//这个方法需要变化
function afterDeleteSubmit(xhr, postdata) {
	$("#delmodgrid-table").jqmHide();//关闭删除弹出框
	var selectedRowIds = $("#grid-table").jqGrid("getGridParam", "selarrrow");
    var len = selectedRowIds.length;
    for (var i = 0; i < len ; i++) {
        $("#grid-table").jqGrid("delRowData", selectedRowIds[0]);
    }
    $("#grid-table").trigger("reloadGrid");//操作完成后刷新表单			
}
var colNames = [' ']
var colModel = [
                {
                	name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
					formatter:'actions', 
					formatoptions:{ 
						keys:true,
						delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
						editformbutton:true, 
						editOptions:{
							recreateForm: true, 
							beforeShowForm:beforeEditCallback,
							afterSubmit: afterEditSubmit,
						}
					}
				}
              ]
var defaultOptions = {
		url:'', //获取数据源
		datatype: 'json',
		mtype:'post',
		height: 250,
		colNames: colNames,
		colModel: colModel, 
		jsonReader: {
			 root:'data',//传递的json数据
			 repeatitems: false,//允许json数据乱序
			 page: 'page', // json中代表当前页码的数据
			 total: 'total', // json中代表页码总数的数据
			 records: 'records', // json中代表数据行总数的数据 
			 id:'id',
		},
		//向后台交互时，所设置的参数名称对应的值，这些值是必须在struts的action中传递的。
	    prmNames : {
		    sort: 'sidx', // 表示用于排序的列名的参数名称  
		    order: 'sord', // 表示采用的排序方式的参数名称  
		    nd:'nd', // 表示已经发送请求的次数的参数名称  
		    id:'id', // 表示当在编辑数据模块中发送数据时，使用的id的名称  
		    oper:'oper',    // operation参数名称
		    editoper:'edit', // 当在edit模式中提交数据时，操作的名称  
		    addoper:'add', // 当在add模式中提交数据时，操作的名称  
		    deloper:'del', // 当在delete模式中提交数据时，操作的名称  
		    //subgridid:'id', // 当点击以载入数据到子表时，传递的数据名称  
		    npage: null,   
           page:'pageSize',    // 表示请求页码的参数名称
           rows:'rows',    // 表示请求行数的参数名称
           search:'search', // 表示是否是搜索请求的参数名称
           totalrows:'total' // 表示需从Server得到总共多少行数据的参数名称，参见jqGrid选项中的rowTotal
        },
		viewrecords : true,
		rowNum:10,
		rowList:[10,20,30],
		pager : '',
		altRows: true,
		//toppager: true,
		
		multiselect: true,
		//multikey: 'ctrlKey',
        multiboxonly: true,

		loadComplete : function() {
			var table = this;
			setTimeout(function(){
				styleCheckbox(table);
				
				updateActionIcons(table);
				updatePagerIcons(table);
				enableTooltips(table);
			}, 0);
		},

		editurl: '',//nothing is saved
		caption: '',
		autowidth: true
}


function showPager(grid_selector,pager_selector,addFlag){
	jQuery(grid_selector).jqGrid(
		'navGrid',
		pager_selector,
		{ 	//navbar options
			edit: true,
			editicon : 'icon-pencil blue',
			add: addFlag,
			addicon : 'icon-plus-sign purple',
			del: true,
			delicon : 'icon-trash red',
			search: true,
			searchicon : 'icon-search orange',
			refresh: true,
			refreshicon : 'icon-refresh green',
			view: true,
			viewicon : 'icon-zoom-in grey',
		},
		{
			//edit record form
			//closeAfterEdit: true,
			//width:600,
			recreateForm: true,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			},
			afterSubmit: afterEditSubmit,
		},
		{
			//new record form
			closeAfterAdd: true,
			recreateForm: true,
			viewPagerButtons: false,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			},
			afterSubmit: afterNewSubmit,
		},
		{
			//delete record form
			recreateForm: true,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				if(form.data('styled')) return false;
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_delete_form(form);
				form.data('styled', true);
			},
			afterSubmit : afterDeleteSubmit,
		},
		{
			//search form
			recreateForm: true,
			afterShowSearch: function(e){
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				style_search_form(form);
			},
			afterRedraw: function(){
				style_search_filters($(this));
			},
			multipleSearch: true,
			/**
			multipleGroup:true,
			showQuery: true
			*/
		},
		{
			//view record form
			recreateForm: true,
			beforeShowForm: function(e){
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
			}
		}
	)
}

//switch element when editing inline
function aceSwitch( cellvalue, options, cell ) {
	setTimeout(function(){
		$(cell) .find('input[type=checkbox]')
				.wrap('<label class="inline" />')
			.addClass('ace ace-switch ace-switch-5')
			.after('<span class="lbl"></span>');
	}, 0);
}
//enable datepicker
function pickDate( cellvalue, options, cell ) {
	setTimeout(function(){
		$(cell) .find('input[type=text]')
				.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
	}, 0);
}

var dates = [];

function style_edit_form(form) {
	for (var i=0; i<dates.length; i++) {
		form.find('input[name='+dates[i]+']').datepicker({format:'yyyy-mm-dd',autoclose:true}).end();
    }

	//update buttons classes
	var buttons = form.next().find('.EditButton .fm-button');
	buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
	buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
	buttons.eq(1).prepend('<i class="icon-remove"></i>')
	
	buttons = form.next().find('.navButton a');
	buttons.find('.ui-icon').remove();
	buttons.eq(0).append('<i class="icon-chevron-left"></i>');
	buttons.eq(1).append('<i class="icon-chevron-right"></i>');		
}

function style_delete_form(form) {
	var buttons = form.next().find('.EditButton .fm-button');
	buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
	buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
	buttons.eq(1).prepend('<i class="icon-remove"></i>')
}

function style_search_filters(form) {
	form.find('.delete-rule').val('X');
	form.find('.add-rule').addClass('btn btn-xs btn-primary');
	form.find('.add-group').addClass('btn btn-xs btn-success');
	form.find('.delete-group').addClass('btn btn-xs btn-danger');
}
function style_search_form(form) {
	var dialog = form.closest('.ui-jqdialog');
	var buttons = dialog.find('.EditTable')
	buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
	buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
	buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
}

function beforeDeleteCallback(e) {
	var form = $(e[0]);
	if(form.data('styled')) return false;
	
	form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
	style_delete_form(form);
	
	form.data('styled', true);
}

function beforeEditCallback(e) {
	var form = $(e[0]);
	form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
	style_edit_form(form);
}

function styleCheckbox(table) {
}

function updateActionIcons(table) {
}

//replace icons with FontAwesome icons like above
function updatePagerIcons(table) {
	var replacement = 
	{
		'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
		'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
		'ui-icon-seek-next' : 'icon-angle-right bigger-140',
		'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
	};
	$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
		var icon = $(this);
		var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
		
		if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
	})
}

function enableTooltips(table) {
	$('.navtable .ui-pg-button').tooltip({container:'body'});
	$(table).find('.ui-pg-div').tooltip({container:'body'});
}
