var gData = [
    {id:"1601020729",name:"柳暗花明又一村",sex:"女",phone:"17863946029",email:"123@sina.com",address:"中国山东省青岛市",role:"普通用户",count:"3",state:"活跃",option:"使用中"}
];


var myColNames = [' ', '账号', '姓名', '性别', '电话','e-mail', '地址', '分配角色', '发帖数', '用户状态','操作'];
var myColModels = [
        {name:'number',index:'number', width:80, fixed:true, sortable:false, resize:false,},
        {name:'id',index:'id', width:50,align:'center',  sorttype:"int", editable: true},
        {name:'name',index:'name',width:60,align:'center', editable:true, sorttype:"text"},//unformat: pickDate,unformat: aceSwitch{value:"-1:管理员;0:普通用户;1:专家用户"}
        {name:'sex',index:'sex', width:30,align:'center', editable: true,edittype:"select",editoptions:{value:"1:男;2:女"}},
        {name:'phone',index:'phone', width:60,align:'center',editable: true},
        {name:'email',index:'email', width:60, align:'center',editable: true},
        {name:'address',index:'address', width:80,align:'center', editable: true,edittype:"textarea",editoptions:{rows:"1",cols:"25"}},
        {name:'isExpert',index:'isExpert', width:50,align:'center', editable: true,edittype:"select",editoptions:{value:"-1:管理员;0:普通用户;1:专家用户"}},
        {name:'count',index:'count',width:30,align:'center',editable: false},
        {name:'status',index:'status',width:40,align:'center',editable: true,edittype:"select",editoptions:{value:"0:潜水;1:冒泡;2:活跃;3:传说;4:已封禁"}},
        {name:'option',index:'option',width:30,align:'center',editable: true,edittype:"checkbox",editoptions:{value:"No:Yes"},unformat: aceSwitch}
    ];

jQuery(function ($) {
    //操作完成后刷新表单 $("#grid-table").trigger("reloadGrid");
    var grid_selector = "#grid-table";
    var pager_selector = "#grid-pager";
    jQuery(grid_selector).jqGrid({
        //direction:"rtl"
        url:"load.action",
        datatype:"json",//数据来源，本地数据（local，json,jsonp,xml等）
        height:400,
        mType:'post',
        colNames:myColNames,
        colModel:myColModels,
        viewRecords:true,
        rowNum:5,
        rowList :[ 10, 20, 30 ],//应该是来自数据库的分页
        sortable : true,
        pager : pager_selector,
        altRows:true,
        multiSelect: true,
        multiBoxOnly: true,
        sortName:"number",//默认的排序列名
        sortOrder:'asc',//默认的排序方式（asc升序，desc降序）
        autowidth: true, //自动宽
        editurl: "edit.action",//nothing is saved
        caption: "用户管理",
        jsonReader : {
            root : "rows",
            page: "page",
            total: "total",
            records : "records",
            repeatitems : false
        },
        // loadComplete:function () {
        //     var table = this;
        //     setTimeout(function () {
        //         styleCheckbox(table);
        //         updateActionIcons(table);
        //         updatePagerIcons(table);
        //         enableTooltips(table);
        //     }, 0);
        // },
    }).navGrid(pager_selector, {edit : false,add : false,del : false});
    // function pickDate( cellvalue, options, cell ) {
    //     setTimeout(function(){
    //         $(cell) .find('input[type=text]')
    //             .datepicker({format:'yyyy-mm-dd' , autoclose:true});
    //     }, 0);
    // } //动态日期表格添加

    //navButtons
    jQuery(grid_selector).jqGrid('navGrid',pager_selector,{
            edit:true,
            editicon: 'icon-pencil blue',
            add:true,
            addicon:'icon-plus-sign purple',
            del:true,
            delicon:'icon-trash red',
            search:true,
            searchicon: 'icon-search orange',
            refresh:true,
            refreshicon: 'icon-refresh green',
            view:true,
            viewicon:'icon-zoom-in grey',
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

    //it causes some flicker when reloading or navigating grid
    //it may be possible to have some custom formatter to do this as the grid is being created to prevent this
    //or go back to default browser checkbox styles for the grid
    function styleCheckbox(table) {
        /**
         $(table).find('input:checkbox').addClass('ace')
         .wrap('<label />')
         .after('<span class="lbl align-top" />')


         $('.ui-jqgrid-labels th[id*="_cb"]:first-child')
         .find('input.cbox[type=checkbox]').addClass('ace')
         .wrap('<label />').after('<span class="lbl align-top" />');
         */
    }

    //unlike navButtons icons, action icons in rows seem to be hard-coded
    //you can change them like this in here if you want
    function updateActionIcons(table) {
        /**
         var replacement =
         {
						'ui-icon-pencil' : 'icon-pencil blue',
						'ui-icon-trash' : 'icon-trash red',
						'ui-icon-disk' : 'icon-ok green',
						'ui-icon-cancel' : 'icon-remove red'
					};
         $(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
         */
    }

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


});