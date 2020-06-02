function getQueryVariable(variable)
{
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}
$(function () {
    var msg = getQueryVariable("msg");
    console
    if(msg==-1){
        $("#msg").html("<i class='icon-warning-sign'></i> 用户名或密码错误<br>游客登录请点击Twitter！")
        $("#msg").attr("class","header red lighter bigger");
    }
})