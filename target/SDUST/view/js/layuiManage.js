
layui.use(['laydate','laypage', 'layer','table'], function(){
    var laydate = layui.laydate //日期
        ,laypage = layui.laypage //分页
        ,layer = layui.layer //弹层
        ,table = layui.table //表格

    //第一个实例

    // var myColNames = [' ', '账号', '姓名', '性别', '电话','e-mail', '地址', '分配角色', '发帖数', '用户状态','操作'];
    table.render({
        elem: '#test'
        ,height: 420
        ,url: 'layLoad.action' //数据接口
        ,title: '用户表'
        ,page: true//开启分页
        ,id:"testTable"
        ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
        ,totalRow: false//开启合计行
        ,method:"post"
        ,cols: [[ //表头
            {type: 'checkbox', fixed: 'left'}
            ,{field: 'id', title: '账号', width:115, sort: true, fixed: 'left'}
            ,{field: 'name', title: '用户名',width:150,event: 'setName'}//, edit: 'text'}
            ,{field: 'sex', title: '性别',width:80,  sort: true}//, edit: 'text'}
            ,{field: 'phone', title: '电话', width:150, sort: true}//, edit: 'text'}
            ,{field: 'email', title: 'e-mail',width:150, sort: true}//, edit: 'text'}
            ,{field: 'address', title: '地址',width:100}//, edit: 'text'}
            ,{field: 'isExpert', title: '分配角色',width:100,event: 'setRole'}
            ,{field: 'count', title: '发帖数',width:90, sort: true}
            ,{field: 'status', title: '用户状态',width:105, sort: true,event: 'setState'}
            ,{fixed: 'right',width:165, align:'center', toolbar: '#barDemo'}
        ]]
    });

    //监听头工具栏事件
    table.on('toolbar(demo)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id)
            ,data = checkStatus.data; //获取选中的数据
        switch(obj.event){
            case 'add':
                window.location="./add.action"
                break;
            case 'update':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else if(data.length > 1){
                    layer.msg('只能同时编辑一个');
                } else {
                    layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                }
                break;
            case 'delete':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else {
                    layer.msg('删除');
                }
                break;
        };
    });

    //监听行工具事件
    table.on('tool(demo)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            ,layEvent = obj.event; //获得 lay-event 对应的值
        if(layEvent === 'detail'){
            layer.msg('查看'+data.id+'行');
        } else if(layEvent === 'del'){
            layer.confirm('删除此用户?', function(index){
                $.ajax({
                    type:"post",
                    dataType: "json",
                    url:"./user/delete.action",
                    contentType: "application/json; charset=utf-8",
                    data:JSON.stringify(data),
                    // data: JSON.stringify(formObject),
                    success: function (data) {
                        var jData = eval(data)
                        if (jData.code == 1) {
                            obj.del(); //删除对应行（tr）的DOM结构
                            //关闭弹框
                            layer.close(index);
                            layer.msg("删除成功", {icon: 6});
                        }else {
                            layer.msg("删除失败", {icon: 5});
                        }
                    }
                })
                layer.close(index);
                //向服务端发送删除指令
            });
        } else if(layEvent === 'edit'){
            layer.msg("编辑行单元");
        }else if(layEvent === 'setName'){
            layer.prompt({
                formType: 2
                ,id: (new Date()).valueOf()//设定一个id，防止重复弹出 时间戳
                ,title: '修改 ID 为 ['+ data.id +'] 的用户昵称'
                ,value: data.name
            }, function(value, index){
                layer.close(index);
                $.ajax({
                    type: "get",
                    dataType: "json",
                    url: "./user/editName.action?uid="+data.id+"&value="+value,
                    success: function (data) {
                        var jData = eval(data)
                        if (jData.code == 1) {
                            //同步更新表格和缓存对应的值
                            obj.update({
                                name: value
                            });
                            layer.close(index);
                            layer.msg("修改昵称成功", {icon: 6});
                        }else {
                            layer.msg("修改昵称失败", {icon: 5});
                        }
                    }
                })
            });
        }else if(layEvent === 'setState'){
            layer.prompt({
                formType: 2
                ,id: (new Date()).valueOf()//设定一个id，防止重复弹出 时间戳
                ,title: '修改 ID 为 ['+ data.id +'] 的状态信息'
                ,value: data.state
            }, function(value, index){
                layer.close(index);
                $.ajax({
                    type: "get",
                    dataType: "json",
                    url: "./user/editState.action?uid="+data.id+"&value="+value,
                    success: function (data) {
                        var jData = eval(data)
                        if (jData.code == 1) {
                            //同步更新表格和缓存对应的值
                            obj.update({
                                state: value
                            });
                            layer.close(index);
                            layer.msg("修改状态成功", {icon: 6});
                        }else {
                            layer.msg("修改状态失败", {icon: 5});
                        }
                    }
                })
            });
        }else if(layEvent === 'setRole'){
            layer.prompt({
                formType: 2
                ,id: (new Date()).valueOf()//设定一个id，防止重复弹出 时间戳
                ,title: '修改 ID 为 ['+ data.id +'] 的角色'
                ,value: data.isExpert
            }, function(value, index){
                layer.close(index);
                $.ajax({
                    type: "get",
                    dataType: "json",
                    url: "./user/editRole.action?uid="+data.id+"&value="+value,
                    success: function (data) {
                        var jData = eval(data)
                        if (jData.code == 1) {
                            //同步更新表格和缓存对应的值
                            obj.update({
                                isExpert: value
                            });
                            layer.close(index);
                            layer.msg("修改角色成功", {icon: 6});
                        }else {
                            layer.msg("修改角色失败", {icon: 5});
                        }
                    }
                })
            });
        }

    });

    var $ = layui.$, active = {
        reload: function () {
            var demoReload = $('#demoReload').val();//获取输入框的值
            var  selects = $('#selects').val();//获取输入框的值
            //alert(demoReload+selects);
            //执行重载
            table.reload('testTable', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: { valu: demoReload,domain:selects}//这里传参  向后台
                , url: './user/findBy.action'//后台做模糊搜索接口路径
                , method: 'post'
            });
        }
    };
    $('.layui-form-item .layui-btn').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    laypage.render({
        elem: 'pageDemo' //分页容器的id
        ,count: 100 //总页数
        ,skin: '#1E9FFF' //自定义选中色值
        //,skip: true //开启跳页
        ,jump: function(obj, first){
            if(!first){
                layer.msg('第'+ obj.curr +'页', {offset: 'b'});
            }
        }
    });
});


function a() {
    $(".layui-laypage-btn").click();
}