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
/**
 * @uses json转date
 * @param json date
 * @return date|("yyyy-MM-dd hh:mm:ss.S")
 **/
Date.prototype.format = function(fmt) {
    var o = {
        "M+" : this.getMonth() + 1, //月份
        "d+" : this.getDate(), //日
        "h+" : this.getHours(), //小时
        "m+" : this.getMinutes(), //分
        "s+" : this.getSeconds(), //秒
        "q+" : Math.floor((this.getMonth() + 3) / 3), //季度
        "S" : this.getMilliseconds()
        //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    for ( var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
                : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
$.ajax({
    url:"getProfile.action?uid="+getQueryVariable("uid"),
    dataType: "json",
    type:"get",
    contentType:"application/json;charset=utf-8",
    success:function (data) {
        if(data.str == null){
            alert("没有用户:"+getQueryVariable("uid"))
            window.history.go(-1);
        }else{
            var obj = eval('(' + data.str + ')');
            // console.log(obj.msg+"==================")            // success==================// console.log(obj.data[0].name+"  "+obj.data[0].address)
            // console.log(obj.data+"==================")//             // [object Object]==================
            $('#pname').html("<a style='font-size: 15px;color: #ff6a13' href='profile.action?uid="+getQueryVariable("uid")+"'>"+obj.data[0].name+"</a>")//允许html标签在内
            $('#paddress').text(obj.data[0].address);
            $('#page').text(getAge(new Date(obj.data[0].birthday).format("yyyy-MM-dd"))+"岁");
            $('#pbirthday').text(new Date(obj.data[0].birthday).format("yyyy-MM-dd"));
            $('#pemail').html("<a href='https://weibo.com/' target='_blank'>"+obj.data[0].email+"</a>");
            $('#pstatus').html("<span id='pstatus' style='color: #0a8aff;font-size: 15px;'>"+obj.data[0].status+"</span>");
            $('#profile').html("<input type='text' class='edit'  style='font-size: 20px;color: #46c6ff;border:none;' value='"+obj.data[0].profile+"'>");
        }
    }
})

$.ajax({
    url: "getBlog.action?uid=" + getQueryVariable("uid"),
    dataType: "json",
    type: "get",
    contentType: "application/json;charset=utf-8",
    success: function (data) {
        var jData = eval('(' + data.str + ')').data;
        for(let i=0; i<jData.length; i++){
            var jComments = jData[i].commentDTOS;
            var html1 = "<div class='profile-activity clearfix'>" +
                    "<div>" +
                    "    <i class='pull-left thumbicon icon-edit btn-pink no-hover'></i>" +
                    "    <a class='user' href='#'>"+ jData[i].userName +"</a>" +
                    "&nbsp;>>&nbsp;" +jData[i].blog_text +
                    "    <div id='accordion' class='accordion-style1 panel-group'> " +
                    "       <div class='panel panel-default'> " +
                    "           <div class='panel-heading'> " +
                    "               <h4 class='panel-title'> " +
                    "                   <a class='accordion-toggle collapsed' data-toggle='collapse' data-parent='#accordion' href='#collapse"+i+"'> " +
                    "                       <i class='bigger-110 icon-angle-right' data-icon-hide='icon-angle-down' data-icon-show='icon-angle-right'></i> " +
                    "                       &nbsp;See More " +
                    "                    </a> " +
                    "                </h4> " +
                    "            </div> " +
                    "            <div class='panel-collapse collapse' id='collapse"+i+"' style='height: 0px;'> " +
                    "            <div class='panel-body' id='comments"+i+"'> " +
                    "            </div> " +
                    "          </div> " +
                    "       </div> " +
                    "   </div>"+
                    "    <div class='time'>" +
                    "        &nbsp;&nbsp;&nbsp;<i class='icon-time bigger-110'></i>" + new Date(jData[i].blog_date).format("yyyy-MM-dd hh:mm:ss") +
                    "    </div>" +
                    "</div>" +
                    // "<div class='tools action-buttons'>" +
                    "<div class='tools' id='tools"+i+"'>" +
                    "    <a href='#' class='blue'>" +
                    "        <i class='icon-pencil bigger-125'></i>" + "编辑" +
                    "    </a>" +
                    "    <a href='#' class='red'>" +
                    "        <i class='icon-remove bigger-125'></i>" + "删除" +
                    "    </a>" +
                    "</div>" +
                    "</div>";
            $("#myBlog").append(html1)
            if( $("#sessiondata").val() != getQueryVariable("uid")){
                let demo = document.getElementById("tools"+i.toString());
                demo.className = "tool"
            }
            if(jComments.length!=0){
                for(let j = 0;j<jComments.length; j++){
                    var html2= "<p>##"+(j+1)+"楼</p>" +
                        "<div class='body'>" +
                        "(<a href='profile.js?uid="+jComments[j].user_id+"'>@"+jComments[j].userName + "</a>)&nbsp;留言&nbsp;:"+jComments[j].comment_text+
                        "</div>"
                    $("#comments"+i.toString()).append(html2)
                }
            }else{
                $("#comments"+i.toString()).append("<p>暂无评论！</p>")
            }
        }
    }
})

// console.log($("#sessiondata").val())
// console.log(getQueryVariable("uid"))
// if( $("#sessiondata").val() != getQueryVariable("uid")){
//     var d = document.getElementById("tools")
//     d.style.display = "none"
// }

// 用户状态码：pstatus
// 0=潜水user=灰色/管理员提示红色
// 1=冒泡user=淡蓝色
// 2=活跃user=蓝色
// 3=吐槽user=绿色



/**
 * @uses 根据生日计算年龄，生日的格式是：2016-09-23
 * @param string birthday
 * @return string|number
 **/
function getAge(birthday) {
    let iage = 0;
    if (birthday!=null) {
        //获取出生日期的年月日
        let year = this.getYmd(birthday,'y');
        let month = this.getYmd(birthday, 'm');
        let day = this.getYmd(birthday, 'd');

        //获取当前时间的年月日
        let myDate = new Date();
        let now_year = myDate.getFullYear();
        let now_month = myDate.getMonth()+1;
        let now_day = myDate.getDate();

        if (now_year > year) {
            iage = now_year - year - 1;
            if (now_month > month) {
                iage++;
            } else if (now_month == month) {
                if (now_day >= day) {
                    iage++;
                }
            }
        }
    }
    return iage;
}
/**
 * @uses 根据指定日期返回你年月日，日期格式是：2016-09-23
 * @param string s 日期字符串
 * @param string type 返回的 年y 月m 日d
 * @return string|number
 **/
function getYmd(s,type) {
    // var s = "2010-5-6";
    let a = s.split("-");
    if (a.length > 2) {
        let y = a[0];
        let m = a[1];
        let d = a[2];
        let returnStr = '';
        switch(type){
            case 'y':
                returnStr = y;
                break;
            case 'm':
                returnStr = m;
                break;
            case 'd':
                returnStr = d;
                break;
            default:
                returnStr = '';
                break;
        }
        return returnStr;
    }else{
        return '';
    }
}
