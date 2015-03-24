<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderManager.aspx.cs" Inherits="User_Default" %>

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
    
    .my-right .u-right .data-edit{ height:auto;}
    .my-right .u-right .data-edit ul li{ list-style:none;}
    
    .right-form{ margin-top:40px; margin-left:50px;}
    .right-form ul li .form-title{ display:inline-block;width:80px; height:30px; color:#123654; line-height:30px; text-align:right; font-size:14px; margin-bottom:10px;}
    .right-form ul li .form-txt{height:30px;line-height:30px; font-size:14px; width:500px; }
    .right-form ul li .form-readonly{ background:#e9e9e9;}
    
    .right-form ul li .btn{ display:block ;background:url("../Images/btnbj.png") no-repeat center center; width:150px; height:40px;background-size:cover; font-size:18px; text-align:center; line-height:40px; margin-left:432px;}
    
     .zx-body a{ color:#1ea78d;}
    .zx-body  table{width:830px; border: 1px solid #9a9a9a;}
       .zx-body  table th{background:#e7e7e7; line-height:45px;border-left: 1px solid #FFFFFF; border-right: 1px solid #FFFFFF;  }
       .zx-body  table td{ text-align:center; color:#1ea78d; border-bottom: 1px solid #9a9a9a;border-top: 1px solid #9a9a9a; padding:15px 5px; }
       .zx-body table td div{left:0px;right:0px;margin-left:auto; margin-right:auto; height:auto; width:71px; height:25px;background:url('/images/user/sl.png') center center no-repeat;position:relative;}
       .zx-body table td div input{ position:absolute ; left:5px; top:0px; width:49px; height:25px; text-align:center; line-height:25px; ; border:none; background:none;}
       .zx-body table td div a{ display:block; position:absolute; }
    
    
    .zx-body  table .red td {color:red;}
    .zx-body  table .red td a{color:Red;}
    
        
    
    </style>
    <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />

    <div class="web-page">
        <div class="my-left">
            <div class="my-left-top">
                <ul>
                    <li><img class="headimg" src="~/User/UserPic/u_face.jpg" id="headImg" runat="server" /></li>
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
                <li><a href="WebImgManager.aspx">网站图片</a></li>
                <li><a href="ProductManager.aspx">商品管理</a></li>
                <li><a href="FWProductManager.aspx">摄影服务</a></li>
                <li><a href="OrderManager.aspx" class="active">订单管理</a></li>
                <li><a href="ZhaoPinManager.aspx">招聘信息</a></li>
                <li><a href="ZiXunManager.aspx">资讯文章</a></li>
                </ul>
            </div>
        </div>
        <div class="my-right">
            <div class="u-right">

            <div class="orderTitle">
                <a class="sel" href="OrderManager.aspx">订单列表</a> 
                <a href="OrderManagerD.aspx">待发货订单</a> 
            </div>

            <!--信息-->
            <div class="data-edit">
                <form id="form1" runat="server">
                <div class="right-form">
                    <div class="zx-body">
       <table cellpadding=0 cellspacing=0>
            <tr><th style="border-left:0;width:205px">下单时间</th><th style="width:120px">收货人</th><th style="width:100px">订单金额</th><th style="width:100px">订单状态</th>
                <th> 操作</th></tr>
             <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr class='<%# Convert.ToInt32(Eval("State")) == 2 ?"red":""%>'><td><%# Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd HH:mm")%></td>
                    <td><%# Eval("DeliveryName")%></td>
                    <td><%# Convert.ToDecimal( Eval("Price")).ToString("f2")%></td>
                    <td><%# (YS_WEB.Model.YS_Enum.OrderState)Eval("State")%></td>
                    <td><a onclick="query(<%# Eval("ID")%>)" href="javascript:;">查看</a> / <a onclick="fh(<%# Eval("ID")%>)" href="javascript:;">发货</a></td></tr>
             </ItemTemplate>
            </asp:Repeater>
       </table>
       </div>
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
        function query(oid) {
            $('#orderItem').show();
            yscom.ajax({
                url: "OrderItem.aspx?oid=" + oid,
                dataType: "html",
                data: {},
                success: function (data) {
                    $("#orderItemhtml").html(data);
                }
            });
        }
        function fh(oid) {
            if (confirm("确定发货？")) {
                yscom.ajax({
                    url: "Action/Handler.ashx?cmd=FH",
                    data: {
                        "oid": oid
                    },
                    success: function (data) {
                        if (data.flag == "true") {
                            alert(data.msg);
                            window.location = 'OrderManager.aspx';
                        }
                        else {
                            alert(data.msg);
                        }
                    }
                });
            }

        }
    </script>

    <div id="orderItem" style=" display:none;z-index:100; position:fixed; left:0px;right:0px;top:100px;margin-left:auto; margin-right:auto; height:600px;width:800px; overflow:auto; background:#FFF; border:5px solid #1ea78d;">
        <div style=" height:40px; border-bottom: 1px solid #CCC; text-align:center; line-height:40px; background:#eee;"> 订单明细
            <a onclick="$('#orderItem').hide();$('#orderItemhtml').html('')" href="javascript:;" style=" display:block ; position:absolute; right:5px; top:5px;height:30px; width:30px; background:red; color:#FFF; font-size:30px; text-align:center; line-height:30px; font-weight:bold;">×</a>
        </div>
        <div id="orderItemhtml">
        
        </div>
    </div>
</body>
</html>
