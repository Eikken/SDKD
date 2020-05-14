layui.use('laydate', function(){
    var laydate = layui.laydate;
    //执行一个laydate实例
    laydate.render({
        elem: '#birthday' //指定元素
    });
});

$(function () {
    $(":button").click(function () {
        var formObject = {};
        var formArray =$("#updateInfo").serializeArray();
        $.each(formArray,function(i,item){
            formObject[item.name] = item.value;
        });

        if($("#passwordConfirm").val()==""){
            $.ajax({
                type:"post",
                dataType: "json",
                url:"updateUser.action",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(formObject),
                success: function (data) {
                    var jData = eval("("+data.str+")")
                    if (jData.code == 1) {
                        window.parent.location.reload();
                    }else {
                        console.log(jData.msg)
                    }
                }
            })
        }else{
            $.ajax({
                type:"post",
                dataType: "json",
                url:"updatePassword.action",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(formObject),
                success: function (data) {
                    var jData = eval("("+data.str+")")
                    if (jData.code == 1) {
                        window.parent.location.reload();
                    }else {
                        console.log(jData.msg)
                    }
                }
            })
        }

        // console.log(newName)
    })

    $("#passwordConfirm").blur(function () {
        let pwd2 = $("#passwordConfirm").val();
        let pwd1 = $("#password").val();
        if(pwd1!=pwd2){
            $(":button").attr({"disabled":"disabled"});
            $("#tipSpan").text("两次输入密码不一致！");
            $("#tipSpan").css("color","red");
        }else {
            $(":button").removeAttr('disabled');
            $("#tipSpan").text("密码正确！");
            $("#tipSpan").css("color","green");
        }
    })
})


