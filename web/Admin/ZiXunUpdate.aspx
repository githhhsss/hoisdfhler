<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZiXunUpdate.aspx.cs" Inherits="User_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
    .my-left{ float:left; width:400px;}
    .my-left-top{ margin-left:30px; margin-top:85px; border:1px solid #ccc; width:312px; background:#FFF}
    .my-left-top .headimg{ margin-left:30px; margin-top:30px; width:255px; height:255px;}
    .my-left-top ul li { list-style:none;}
    .my-left-top ul li .myName{ position:relative; font-size:15px; font-family:造字工房雅圆（非商用）常规体; line-height:20px; font-weight:bold; margin-left:30px; margin-top:5px; margin-bottom:10px;}
    .my-left-top ul li .myName .myName-name{font-size:20px;}
    .my-left-top .my-mun{border-top:1px solid #ccc;font-family:造字工房雅圆（非商用）常规体;line-height:50px;font-size:13px;margin-top:5px; margin:0 30px; color:#aaaaaa;}
    .my-left-top .my-mun span{ color:#1ea78d;font-size:25px; margin-right:10px;}
    
    .my-left-bottom{ margin-left:30px; margin-top:40px; margin-bottom:35px; border:1px solid #ccc; width:312px; background:#FFF}
    .my-left-bottom ul li { list-style:none;}
    .my-left-bottom ul li a{  display:block;color:#000; height:35px; width:255px;margin:0 30px; line-height:35px; font-size:16px;border-top:1px solid #ccc; text-decoration:none;}
    .my-left-bottom ul li a:hover{color:#666666;text-decoration:underline;}
    .my-left-bottom ul li .set-top{border-top:none;}
    .my-left-bottom .active{ color:Red;}
    
    .my-right{float:left; width:930px;}
    .u-right{margin-top:85px;margin-bottom:35px; background:#fff;}
    .my-right .u-right .orderTitle{ height:70px; width:100%; background:#ebebeb; border-bottom:1px solid #DDDDDD;}
    .my-right .u-right .orderTitle a{ display:block; float:left; height:69px; line-height:69px; width:180px;border-right:1px solid #DDDDDD; text-align:center; font-size:23px;text-decoration:none; color:#000000;}
    .my-right .u-right .orderTitle .sel{border-top:5px solid #1ea78d; height:65px; background:#FFF; line-height:60px;}
    
    .my-right .u-right .data-edit{ height:1000px;}
    .my-right .u-right .data-edit ul li{ list-style:none;}
    
    .right-form{ margin-top:40px; margin-left:50px;}
    .right-form ul li .form-title{ display:inline-block;width:80px; height:30px; color:#123654; line-height:30px; text-align:right; font-size:14px; margin-bottom:10px;}
    .right-form ul li .form-txt{height:30px;line-height:30px; font-size:14px; width:500px; }
    .right-form ul li .form-mtxt{height:120px;line-height:20px; font-size:14px; width:500px; }
    .right-form ul li .form-div{height:600px;width:500px;}
    .right-form ul li .form-readonly{ background:#e9e9e9;}
    
    .right-form ul li .btn{ display:block ;background:url("../Images/btnbj.png") no-repeat center center; width:150px; height:40px;background-size:cover; font-size:18px; text-align:center; line-height:40px; margin-left:432px;}
    
    .right-form  .form-say{height:40px;line-height:40px; font-size:14px; color:#1ea78d;}
    
    </style>
    <myControls:WebScript id="WebScript1" runat="server" />
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
   <script type="text/javascript">
       function setBaidu() {
           UE.getEditor('editor').setContent("<%= GetEditor()%>");
       }
        </script>
</head>
<body onload="setBaidu()">
    <myControls:WebTop id="WebTop1" runat="server" />

    <div class="web-page">
        <div class="my-left">
            <div class="my-left-top">
                <ul>
                    <li><img class="headimg" src="/User/UserPic/u_face.jpg" id="headImg" runat="server" /></li>
                    <li>
                        <div class="myName">
                            <span class="myName-name" id="name" runat="server"></span>
                            <br />
                            <span id="readName" runat="server"></span>/<span id="city" runat="server"></span>
                            <div></div>
                        </div>
                    </li>
                    <li><div class="my-mun"><span id="renqi" runat="server"></span> 人气</div></li>
                    <li><div class="my-mun"><span id="jifen" runat="server"></span> 积分</div></li>
                    <li><div class="my-mun"><span id="fensi" runat="server"></span> 粉丝 / <span id="guanzhu" runat="server"></span> 关注</div></li>
                </ul>
            </div>
            <div class="my-left-bottom">
                <ul>
                <li><a href="Default.aspx" class="set-top">个人设置</a></li>
                <li><a href="UserManager.aspx">用户管理</a></li>
                <li><a href="ProductManager.aspx">商品管理</a></li>
                <li><a href="OrderManager.aspx">订单管理</a></li>
                <li><a href="ZhaoPinManager.aspx">招聘信息</a></li>
                <li><a href="ZiXunManager.aspx" class="active">资讯文章</a></li>
                </ul>
            </div>
        </div>
        <div class="my-right">
            <div class="u-right">

            <div class="orderTitle">
                <a href="ZiXunManager.aspx">资讯文章</a> 
                <a href="ZiXunAdd.aspx">添加资讯</a> 
                <a target="_blank" href="ZiXunQuery.aspx">查看资讯</a>
                <a class="sel" href="ZiXunUpdate.aspx">修改资讯</a>
            </div>

            <!--信息-->
           <div class="data-edit">
                <form id="form1" runat="server">
                <div class="right-form">
                    <ul>
                        <li><span class="form-say">产品基本信息</span></li>
                        <li><span class="form-title">标题：</span><input class="form-txt" id="ptxt1" type="text" runat="server" /></li>
                       
                        <li><span class="form-title">关键字：</span><input class="form-txt" id="ptxt4" runat="server" type="text" /></li>
                       <li><span class="form-say">内容</span>
                              <script id="editor" type="text/plain" style="width:830px; height:500px;" ></script>
                       </li>
                       <li><span style=" display:inline-block;height:5px;"></span></li>
                        <li><a id="editPro" class="btn" href="javascript:;">确认修改</a></li>
                    </ul>
                </div>
                </form>
            </div>
        </div>
        <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>

    <mycontrols:webFoot id="WebFoot1" runat="server"/>
    <script type="text/javascript">
        //-----百度编辑器-----------------------------------------
        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('editor');
    </script>
    <script type="text/javascript">
        $(function () {
            $("#editPro").click(function () {
                if (confirm("确定要添加信息吗？")) {
                    yscom.ajax({
                        url: "Action/Handler.ashx?cmd=EditPro",
                        data: {
                            "pid":yscom.getParams("itemid"),
                            "txt1": $("#ptxt1").val(),
                            "txt4": $("#ptxt4").val(),
                            "txt6": UE.getEditor('editor').getContent()
                        },
                        success: function (data) {
                            if (data.flag == "true") {
                                alert(data.msg);
                            } else {
                                alert(data.msg);
                            }
                        }
                    });
                };
            });
        })
    </script>
</body>
</html>
