$("#consoleDlg").dialog({
        autoOpen : false, // 是否自动弹出窗口
        modal : true, // 设置为模态对话框
        resizable : true,
        height : 200,
        position : "center", // 窗口显示的位置
        width : 500,
    });

// window.onload = onload();
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
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

function onload() {
    // $.ajax({
    //     url: "./blog/loadPage.action",
    //     dataType:"json",
    //     type:'get',
    //     success:function(data){
    //         var obj = eval('(' + data+ ')');
    //         layui.use(['laypage', 'layer'], function() {
    //             var laypage = layui.laypage
    //                 , layer = layui.layer;
    //
    //             //总页数低于页码总数
    //             laypage.render({
    //                 elem: 'demo0'
    //                 , count: obj.count //数据总数
    //             });
    //         })
    //     }
    // })
    $.ajax({
        url: "./blog/load.action",
        dataType:"json",
        type:'get',
        beforeSend:function(){
            $("#AjaxBlog").html("<h3>加载中<i class='iconfont icon-jiazai'></i></h3><br>");
            $("#btnAjax").attr({ disabled: "disabled" });
        },
        success:function(data) {
            document.getElementById("AjaxBlog").style.display="none";
            var jData = eval(data.str);
            var likeList = eval(data.likeList);
            var uid = $("#uid").val();
            let flag = false;
            $("#blog").html("<h5>数据如下：</h5><br>");

            for(let i=0; i<jData.length; i++){
                for(let n=0;n<likeList.length;n++){
                    if(jData[i].blog_id==likeList[n].blog_id && uid ==likeList[n].user_id){
                        flag = true;
                        break;
                    }
                    // 获取到登录用户在likeList中点赞了该帖子，flag=true
                }
                var jComments = jData[i].commentDTOS;
                var str1 = "==================================================================================" +
                    "=====================================================================================" +
                    " <div class='itemdiv dialogdiv blogText'>" +
                    "<div class='user'>" +
                    "<img alt='胡歌' src=\"../view/assets/avatars/huge.jpg\"/>" +
                    "</div>" +
                    "<div class='body'>" +
                    "<div class='time'>" +
                    "<i class='icon-time'></i> " + "<span class='grey'>"+ new Date(jData[i].blog_date).format("yyyy-MM-dd hh:mm:ss") +"</span>"+
                    "</div>"+
                    "<div class='name'>" +
                    "<a href='javascript:void(0);' id='userInfo' onclick='jump2user("+jData[i].user_id+")'>"+ jData[i].userName +" </a>" +
                    "</div> " +
                    "<div class='text' id="+"blogText"+i.toString()+" style='font-size: 20px;'>"+jData[i].blog_text+"</div>"+
                    "<div class='tools'>" +
                    "<a href='#' class='btn btn-minier btn-info'> <i class='icon-only icon-share-alt'></i> </a>" +"&nbsp;&nbsp;"+
                    "<a class='btn btn-minier btn-info' href='javascript:void(0)' onclick='deleteB("+jData[i].blog_id+")'><i class='icon-only icon-trash'></i></a>" +"&nbsp;&nbsp;"+
                    "<a class='btn btn-minier btn-info' style='color:orange;' href='javascript:void(0)' onclick='replyBlog("+jData[i].blog_id+")'><i class='icon-only icon-comments-alt'></i></a>" +"&nbsp;&nbsp;"+
                    "<button class='likeLabel' onclick='likeBlog("+ jData[i].blog_id +");this.disabled=true'><i class='icon-only icon-heart-empty'></i></button>" +
                    "<span class='likeSpan' id='blogLike"+jData[i].blog_id.toString()+"'>"+jData[i].praise_count+"</span>"+
                    "</div></div>";

                $("#blog").append(str1);
                $("#blog").append("<b>评论区</b> <br>");
                if(jComments.length==0){
                    let str2 = "<div class='user'  style='padding-top: 5px; padding-left: 40px;'>" +
                        "<p>暂无评论！</p>" +
                        "</div>";
                    $("#blog").append(str2);
                }
                let floor = 1;
                for(let j=0; j<jComments.length; j++) {
                    var space = 40;
                    let str2 ="<div class='user'  style='padding-top: 5px; padding-left: 40px;'>" +
                        "<p>##"+(floor++)+"楼</p>" +
                        "</div>" +
                        "<div class='body' style='margin-left: 40px;'>" +
                        "<div class='text'>" +
                        "<a href='javascript:void(0);' id='userInfo' onclick='jump2user("+jComments[j].user_id+")'>"+ jComments[j].userName +" </a>&nbsp;留言:&nbsp;"+jComments[j].comment_text +
                        "<div class='time'>" +
                        "<i class='icon-time'></i> " + "<span class='grey'>留言于"+ new Date(jComments[j].comment_date).format("yyyy-MM-dd hh:mm:ss") +"</span>"+
                        "</div>"+
                        "<div class='tools' style='display:inline;'>" +
                        "<a href='#' class='btn btn-minier btn-info'> <i class='icon-only icon-share-alt'></i> </a>" +"&nbsp;&nbsp;"+
                        "<a class='btn btn-minier btn-info' href='javascript:void(0)' onclick='deleteC("+jComments[j].comment_id+")'><i class='icon-only icon-trash'></i></a>" +"&nbsp;&nbsp;"+
                        "<a class='btn btn-minier btn-info' style='color:orange;' href='javascript:void(0)' onclick='replyComment(" + jComments[j].comment_id + ")'><i class='icon-only icon-comments-alt'></i></a>" +"&nbsp;&nbsp;"+
                        "<button class='likeLabel icon-heart-empty' onclick='likeComment(" + jComments[j].comment_id + ");this.disabled=true'></button>" +
                        "<span class='likeSpan' id='commentLike"+jComments[j].comment_id.toString()+"'>"+jComments[j].praise_count+"</span>"+
                        "</div>"+"</div> " +
                        "</div>";
                    $("#blog").append(str2);
                    loadChild(jComments[j], space+20);
                }
                if(jData[i].is_expert==1){
                    var d = document.getElementById("blogText"+i.toString());
                    d.style.color = "#FF0000";
                    // d.style.fontSize = "20px";iconfont icon-pinglun
                }
            }
        }
    });
}

function  loadChild(child,space) {
    if(child.child!=null){
        for(let h=0;h<child.child.length;h++){
            let str3 =
                "<div class='body' style='margin-left: " +space+ "px;'>" +
                "<div class='text'>" +
                ">><a href='javascript:void(0);' id='userInfo' onclick='jump2user("+child.child[h].user_id+")'>"+ child.child[h].userName +" </a>"+ "回复" + "<a href='javascript:void(0);' id='userInfo' onclick='jump2user("+child.child[h].user_id+")'>@"+ child.userName +" </a> &nbsp;:&nbsp; "+ child.child[h].comment_text +
                "<div class='time'>" +
                "<i class='icon-time'></i> " + "<span class='grey'>留言于"+ new Date(child.child[h].comment_date).format("yyyy-MM-dd hh:mm:ss") +"</span>"+
                "</div>"+
                "<div class='tools' style='display:inline;'>" +
                "<a href='#' class='btn btn-minier btn-info'> <i class='icon-only icon-share-alt'></i> </a>" + "&nbsp;&nbsp;"+
                "<a class='btn btn-minier btn-info' href='javascript:void(0)' onclick='deleteC("+child.child[h].comment_id+")'><i class='icon-only icon-trash'></i></a>" + "&nbsp;&nbsp;"+
                "<a class='btn btn-minier btn-info' style='color:orange;' href='javascript:void(0)' onclick='replyComment(" + child.child[h].comment_id + ")'><i class='icon-only icon-comments-alt'></i></a>" + "&nbsp;&nbsp;"+
                "<button class='likeLabel icon-heart-empty' onclick='likeComment(" + child.child[h].comment_id + ");this.disabled=true'></button>" +
                "<span class='likeSpan' id='commentLike"+child.child[h].comment_id.toString()+"'>"+child.child[h].praise_count+"</span>"+
                "</div>"+"</div> " +
                "</div>";
            $("#blog").append(str3);
            loadChild(child.child[h],space+space);
        }
    }
}
// document.getElementById("commentPraise"+e.toString()).className='layui-icon-heart-fill';
function askQuestion() {
    var content = $('#content').val();
    $.ajax({
        url:"./blog/save.action?content="+content,
        dataType: "json",
        type:"get",
        success:function (data) {
            window.parent.location.reload();
        }
    });
}

function replyComment(comment_id) {
    var consoleDlg = $("#consoleDlg");
    consoleDlg.html("");
    var a1 = "<iframe src='./comment/answer.action?fatherId="+comment_id+"&blogId=0' +scrolling='no' frameborder='0'></iframe>";
    consoleDlg.append(a1);
    consoleDlg.dialog("option", "title", "回复问题").dialog("open");
}

function jump2user(uid) {
    window.location.href="profile.action?uid="+uid;
}

function likeComment(comment_id) {
    $.ajax({
        url: "./like/likeComment.action?commentId="+comment_id,
        datatype:"json",
        type:'get',
        success:function(data) {
            var jobj=eval(data.str);
            document.getElementById("commentLike"+comment_id.toString()).innerText ="已赞!" +jobj[0].praise_count;
        }
    })
}

function replyBlog(blog_id) {
    var consoleDlg = $("#consoleDlg");
    consoleDlg.html("");
    var a1 = "<iframe src='./comment/answer.action?blogId="+blog_id+"&fatherId="+null+"' scrolling='no' frameborder='0'></iframe>";
    consoleDlg.append(a1);
    consoleDlg.dialog("option", "title", "回复问题").dialog("open");
}

function likeBlog(blog_id) {
    $.ajax({
        url: "./like/likeBlog.action?blogId="+blog_id,
        datatype:"json",
        type:'get',
        success:function(data) {
            var jobj = eval(data.str)
            document.getElementById("blogLike"+blog_id.toString()).innerText ="已赞!"+jobj[0].praise_count;
        }
    })
}

function deleteB(blog_id) {
    layui.use("layer",function () {
        var layer = layui.layer
        layer.msg('是否删除帖子？', {
            time: 0 //不自动关闭
            ,btn: [' 删除 ', ' 取消 ']
            ,yes: function(index){
                layer.close(index);
                $.ajax({
                    url: "./blog/deleteBlog.action?blogId="+blog_id,
                    datatype:"json",
                    type:'get',
                    success:function(data) {
                        var jData = eval('(' + data.str + ')');
                        if(jData.code==1){
                            layer.msg(jData.msg, {icon: 1});
                            window.parent.location.reload();
                        }else{
                            layer.msg(jData.msg, {icon: 2});
                        }
                    }
                })
            }
        });
    })
    // layer.confirm('是否删除帖子？', {
    //     btn: ['删除','取消']  //按钮
    // }, function(){
    //     $.ajax({
    //         url: "./blog/deleteBlog.action?blogId="+blog_id,
    //         datatype:"json",
    //         type:'get',
    //         success:function(data) {
    //             var jData = eval('(' + data.str + ')');
    //             if(jData.code==1){
    //                 layer.msg(jData.msg, {icon: 1});
    //                 window.parent.location.reload();
    //             }else{
    //                 layer.msg(jData.msg, {icon: 2});
    //             }
    //         }
    //     })
    // });

}

function deleteC(comment_id) {
    layui.use("layer",function () {
        var layer = layui.layer
        layer.confirm('是否删除评论？', {
            btn: ['删除','取消'] //按钮
        }, function(){
            $.ajax({
                url: "./comment/deleteComment.action?commentId="+comment_id,
                datatype:"json",
                type:'get',
                success:function(data) {
                    var jData = eval('(' + data.str + ')');
                    if(jData.code==1){
                        layer.msg(jData.msg, {icon: 1});
                        window.parent.location.reload();
                    }else{
                        layer.msg(jData.msg, {icon: 2});
                    }
                }
            })
        });
    })
}
