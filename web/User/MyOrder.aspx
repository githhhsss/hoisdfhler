<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="User_MyOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
       a{ color:Red;}
       .web-page{ min-height:726px; padding-bottom:50px;}
       .zx-title{ height:200px;background:url('/images/user/wddd.png') center bottom no-repeat}
       .zx-body{ left:0px;right:0px;margin-left:auto; margin-right:auto;width:762px; position:relative; margin-top:50px; }
       
       
       .zx-body  table{width:760px; border: 1px solid #9a9a9a;}
       .zx-body  table th{background:#e7e7e7; line-height:45px;border-left: 1px solid #FFFFFF; border-right: 1px solid #FFFFFF;  }
       .zx-body  table td{ text-align:center; color:#1ea78d; border-bottom: 1px solid #9a9a9a;border-top: 1px solid #9a9a9a;; padding:15px 5px; }
       .zx-body table td div{left:0px;right:0px;margin-left:auto; margin-right:auto; height:auto; width:71px; height:25px;background:url('/images/user/sl.png') center center no-repeat;position:relative;}
       .zx-body table td div input{ position:absolute ; left:5px; top:0px; width:49px; height:25px; text-align:center; line-height:25px; ; border:none; background:none;}
       .zx-body table td div a{ display:block; position:absolute;}
       .zx-body table td div .add{ width:14px; height:11px; left:56px; top:1px;}
       .zx-body table td div .sub{ width:14px; height:11px; left:56px; top:14px;}
       
        .zx-body  table .red td {color:red;}
    .zx-body  table .red td a{color:Red;}
       
    </style>
     <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
       <div class="zx-title"></div>
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
                    <td><a onclick="query(<%# Eval("ID")%>)" href="javascript:;">查看</a> / <a onclick="sh(<%# Eval("ID")%>)" href="javascript:;">收货</a></td></tr>
             </ItemTemplate>
            </asp:Repeater>
       </table>
       </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
    <script type="text/javascript">
        function query(oid) {
            $('#orderItem').show();
            yscom.ajax({
                url: "/Admin/OrderItem.aspx?oid=" + oid,
                dataType: "html",
                data: {},
                success: function (data) {
                    $("#orderItemhtml").html(data);
                }
            });
        }
        function sh(oid) {
            if (confirm("确定收货？")) {
                yscom.ajax({
                    url: "/Admin/Action/Handler.ashx?cmd=SH",
                    data: {
                        "oid": oid
                    },
                    success: function (data) {
                        if (data.flag == "true") {
                            alert(data.msg);
                            window.location = 'MyOrder.aspx';
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
