﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZiXunManager.aspx.cs" Inherits="User_Default" %>

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
    
    .my-right{float:left; width:930px;margin-bottom:35px;}
    .u-right{margin-top:85px;margin-bottom:35px; background:#fff;}
    .my-right .u-right .orderTitle{ height:70px; width:100%; background:#ebebeb; border-bottom:1px solid #DDDDDD;}
    .my-right .u-right .orderTitle a{ display:block; float:left; height:69px; line-height:69px; width:180px;border-right:1px solid #DDDDDD; text-align:center; font-size:23px;text-decoration:none; color:#000000;}
    .my-right .u-right .orderTitle .sel{border-top:5px solid #1ea78d; height:65px; background:#FFF; line-height:60px;}
    
    .my-right .u-right .data-edit{ height:710px;}
    .my-right .u-right .data-edit ul li{ list-style:none;}
    
    .right-form{ margin-top:40px; margin-left:50px;}
    .right-form ul li .form-title{ display:inline-block;width:80px; height:30px; color:#123654; line-height:30px; text-align:right; font-size:14px; margin-bottom:10px;}
    .right-form ul li .form-txt{height:30px;line-height:30px; font-size:14px; width:500px; }
    .right-form ul li .form-readonly{ background:#e9e9e9;}
    
    .right-form ul li .btn{ display:block ;background:url("../Images/btnbj.png") no-repeat center center; width:150px; height:40px;background-size:cover; font-size:18px; text-align:center; line-height:40px; margin-left:432px;}
    
    
    /*列表数据*/
     .right-form ul li span{  float:left;display:block; margin:0; padding:0 ;text-align:center; line-height:30px ;height:30px; border:1px solid #CCC;overflow:hidden;text-overflow:ellipsis;-o-text-overflow: ellipsis;white-space:nowrap;width:100%;}
    .right-form .u-th-1{ width:40px; color:#1ea78d;line-height:40px ;height:40px; font-size:16px;}
    .right-form .u-th-2{ width:400px; color:#1ea78d;line-height:40px ;height:40px; font-size:16px;}
    .right-form .u-th-3{width:80px;color:#1ea78d;line-height:40px ;height:40px;font-size:16px;}
    .right-form .u-th-4{width:80px;color:#1ea78d;line-height:40px ;height:40px;font-size:16px;}
    .right-form .u-th-5{width:80px;color:#1ea78d;line-height:40px ;height:40px;font-size:16px;}
    .right-form .u-th-6{width:100px;color:#1ea78d;line-height:40px ;height:40px;font-size:16px;}
    .right-form .u-th-7{width:100px;color:#1ea78d;line-height:40px ;height:40px;font-size:16px;}
    .right-form .u-th-do{width:210px;color:#1ea78d;line-height:40px ;height:40px;font-size:16px;}
    
    .right-form .odd { background:#F9F9F9;}
    
    .right-form .u-td-1{width:40px;}
    .right-form .u-td-2{width:400px;}
    .right-form .u-td-3{width:80px;}
    .right-form .u-td-4{width:80px;}
    .right-form .u-td-5{width:80px;}
    .right-form .u-td-6{width:100px;}
    .right-form .u-td-7{width:100px;}
    .right-form .u-td-do{width:210px;}
    .right-form .u-td-do a{ display:block; float:left; margin-left:3px;margin-top:3px ;background:url("../Images/btnbj.png") no-repeat center center; width:66px; height:24px;background-size:cover; font-size:12px; text-align:center; line-height:24px;}
    
    </style>
    <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
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
                <li><a href="FWProductManager.aspx">摄影服务</a></li>
                <li><a href="OrderManager.aspx">订单管理</a></li>
                <li><a href="ZhaoPinManager.aspx">招聘信息</a></li>
                <li><a href="ZiXunManager.aspx" class="active">资讯文章</a></li>
                </ul>
            </div>
        </div>
        <div class="my-right">
            <div class="u-right">

            <div class="orderTitle">
                <a class="sel" href="ZiXunManager.aspx">资讯文章</a> 
                <a href="ZiXunAdd.aspx">添加资讯</a> 
                <a target="_blank" href="ZiXunQuery.aspx">查看资讯</a>
                <a href="ZiXunUpdate.aspx">修改资讯</a>
            </div>

            <!--信息-->
           <div class="data-edit">
                <form id="form1" runat="server">
                <div class="right-form">
                    <ul>
                        <li>
                            <span class="u-th-1">序号</span>
                            <span class="u-th-2">标题</span>
                            <span class="u-th-3">关键字</span>
                            <span class="u-th-7">录入时间</span>
                            <span  class="u-th-do">操作</span>
                        </li>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                            <li>
                                <span class="u-td-1 <%# (Container.ItemIndex % 2 == 0) ? "odd" : "edd" %>"><%# Container.ItemIndex+1 %></span>
                                <span class="u-td-2 <%# (Container.ItemIndex % 2 == 0) ? "odd" : "edd" %>"><%# Eval("ProductName")%></span>
                                <span class="u-td-3 <%# (Container.ItemIndex % 2 == 0) ? "odd" : "edd" %>"><%# Eval("ProductKey")%></span>
                                <span class="u-td-7 <%# (Container.ItemIndex % 2 == 0) ? "odd" : "edd" %>"><%# Convert.ToDateTime(Eval("InputTime")).ToString("yyyy-MM-dd hh:mm")%></span>
                                <span  class="u-td-do <%# (Container.ItemIndex % 2 == 0) ? "odd" : "edd" %>">
                                    <a href="ZiXunUpdate.aspx?itemid=<%# Eval("ID")%>">查看</a>
                                    <a href="ZiXunUpdate.aspx?itemid=<%# Eval("ID")%>">编辑</a>
                                    <a href="javascript:;" onclick='deletePro(<%# Eval("ID")%>)'>删除</a></span>
                            </li>
                            </ItemTemplate>
                        </asp:Repeater>
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
        $(function () {
            $("#ChangeMyInformation").click(function () {
                if (confirm("确定要修改信息吗？")) {
                    yscom.ajax({
                        url: "Action/Handler.ashx?cmd=ChangeMyInformation",
                        data: {
                            "username": $("#mynametxt").val(),
                            "readname": $("#myreadnametxt").val(),
                            "address": $("#myaddresstxt").val(),
                            "e_mail": $("#myemailtxt").val()
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
        function deletePro(pid) {
            if (confirm("确定要删除信息吗?")) {
                yscom.ajax({
                    url: "Action/Handler.ashx?cmd=DeletePro",
                    data: {
                        "ID": pid
                    },
                    success: function (data) {
                        if (data.flag == "true") {
                            alert(data.msg);
                            window.location = 'ZiXunManager.aspx';
                        } else {
                            alert(data.msg);
                        }
                    }
                });
            }
        }
    </script>
</body>
</html>
