<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyCar.aspx.cs" Inherits="User_MyOrder" %>

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
       .zx-body  table td{ text-align:center; color:Red; border-bottom: 1px solid #9a9a9a;border-top: 1px solid #9a9a9a;; padding:15px 5px; }
       .zx-body table td div{left:0px;right:0px;margin-left:auto; margin-right:auto; height:auto; width:71px; height:25px;background:url('/images/user/sl.png') center center no-repeat;position:relative;}
       .zx-body table td div input{ position:absolute ; left:5px; top:0px; width:49px; height:25px; text-align:center; line-height:25px; ; border:none; background:none;}
       .zx-body table td div a{ display:block; position:absolute;}
       .zx-body table td div .add{ width:14px; height:11px; left:56px; top:1px;}
       .zx-body table td div .sub{ width:14px; height:11px; left:56px; top:14px;}
       
       .sci_divA{ margin-left:880px; margin-top:100px ;color:#FFF ;display:block;line-height:39px; float:left; text-align:center; width:174px; height:39px; background:url('/images/shop/btnbj.png') center bottom no-repeat;}
    </style>
     <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
       <div class="zx-title"></div>
       <div class="zx-body">
       <table cellpadding=0 cellspacing=0>
            <tr><th style="border-left:0;width:205px">商品名称</th><th style="width:120px">数量</th><th style="width:100px">单价</th><th style="width:100px">总价</th>
                <th style="border-right:0;width:120px">操作</th></tr>
             <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr><td><%# Eval("ProductName")%></td>
                    <td>
                        <div>
                            <input id="Text1" class="number-<%# Eval("ProductID")%>" type="text" value='<%# Eval("Number")%>' />
                            <a href="javascript:;" rel='<%# Eval("ProductID")%>'  class="add"></a>
                            <a href="javascript:;" rel='<%# Eval("ProductID")%>'  class="sub"></a>
                        </div>
                    </td>
                    <td><%# Convert.ToDecimal(Eval("Price")).ToString("f2")%></td>
                    <td class="sPrice-<%# Eval("ProductID")%>"><%# (Convert.ToDecimal(Eval("Price")) * Convert.ToInt32( Eval("Number"))).ToString("f2")%></td>
                    <td><a class="deletecar" rel='<%# Eval("ProductID")%>' href="javascript:;">删除</a></td></tr>
             </ItemTemplate>
            </asp:Repeater>
       </table>
       </div>
       <div class="btn"> <a class="sci_divA" href="Order.aspx">立即购买</a> </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
    <script type="text/javascript">
        $(function () {
            $(".add").click(function () {
                var itemid = $(this).attr("rel");
                if (itemid > 0) {
                    yscom.ajax({
                        url: "Action/Handler.ashx?cmd=CarAdd",
                        data: {
                            "itemid": itemid,
                            "num": Number($(".number-" + itemid).val()) + Number(1)
                        },
                        success: function (data) {
                            if (data.flag == "true") {
                                $(".number-" + itemid).val(data.num);
                                $(".sPrice-" + itemid).html(data.snum);
                            } else {
                                alert(data.msg);
                            }
                        }
                    });
                }
                else {
                    alert("找不到产品信息");
                }
            });
            $(".sub").click(function () {
                var itemid = $(this).attr("rel");
                if (itemid > 0) {
                    yscom.ajax({
                        url: "Action/Handler.ashx?cmd=CarAdd",
                        data: {
                            "itemid": itemid,
                            "num": Number($(".number-" + itemid).val()) - Number(1)
                        },
                        success: function (data) {
                            if (data.flag == "true") {
                                $(".number-" + itemid).val(data.num);
                                $(".sPrice-" + itemid).html(data.snum);
                            } else {
                                alert(data.msg);
                            }
                        }
                    });
                }
                else {
                    alert("找不到产品信息");
                }
            });

            /*加入购物车*/
            $(".deletecar").click(function () {
                var itemid = $(this).attr("rel");
                if (itemid > 0) {
                    if (confirm("确定要删除购物车产品吗？")) {
                        yscom.ajax({
                            url: "Action/Handler.ashx?cmd=CarDelete",
                            data: {
                                "itemid": itemid
                            },
                            success: function (data) {
                                if (data.flag == "true") {
                                    alert(data.msg);
                                    window.location = 'MyCar.aspx';
                                } else {
                                    alert(data.msg);
                                }
                            }
                        });
                    }
                }
                else {
                    alert("找不到产品信息");
                }
            });
        })
    </script>
</body>
</html>
