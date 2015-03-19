<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderItem.aspx.cs" Inherits="Admin_OrderItem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .zx-body-item{position:absolute; left:50px; top:50px;}
       .zx-body-item  table{width:700px; border: 1px solid #9a9a9a; }
       .zx-body-item  table th{background:#e7e7e7; line-height:45px;border-left: 1px solid #FFFFFF; border-right: 1px solid #FFFFFF;  }
       .zx-body-item  table td{ text-align:center; color:#1ea78d; border-bottom: 1px solid #9a9a9a;border-top: 1px solid #9a9a9a; padding:15px 5px; }
       .zx-body-item table td div{left:0px;right:0px;margin-left:auto; margin-right:auto; height:auto; width:71px; height:25px;background:url('/images/user/sl.png') center center no-repeat;position:relative;}
        
        .name a{ color:#1ea78d;}
        .name a:hover{ text-decoration:underline;}
        
        .btn a{-moz-border-radius: 5px; -webkit-border-radius: 5px;border-radius:5px; border:1px solid #CCC; display:block; height:20px; width:60px; margin:12px 20px; color:#FFF; text-align:center; line-height:20px;}
        .huise{ background:#969696;}
        .hongse{ background:#1ea78d;}
        
    </style>
    <script type="text/javascript">
        function pj(oid) {
            $("#pjoid").text(oid);
            $("#pjnr").show();
        }
        function bp() {

        }
        function pjqd() {
            if (confirm("确定评价内容吗？评价内容不能更改。")) {
                yscom.ajax({
                    url: "../Handler.ashx?cmd=Addpj",
                    data: {
                        "oid": $("#pjoid").text(),
                        "centent": $("#mycjjtxt").val()
                    },
                    success: function (data) {
                        if (data.flag == "true") {
                            alert(data.msg);
                            $("#pjnr").hide();
                            $("#pjoid").text("");
                            $("#mycjjtxt").val("");
                        } else {
                            alert(data.msg);
                        }
                    }
                });
            };
        }
    </script>
</head>
<body style=" position:relative;">
    <form id="form1" runat="server">
        <div class="zx-body-item">
            <table cellpadding=0 cellspacing=0>
            <tr><th style="border-left:0;">商品名称</th><th style="width:120px">单价</th><th style="width:100px">订单数量</th><th style="width:100px">库存</th><th style="width:100px">操作</th>
                </tr>
             <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <tr>
                    <td class="name">
                        <a target="_blank" href='../Shop/ProductItem.aspx?itemid=<%# Eval("ProductID") %>'>
                            <%# pbll.GetModel( Convert.ToInt32(Eval("ProductID")))!=null? pbll.GetModel( Convert.ToInt32(Eval("ProductID"))).ProductName :"" %>
                        </a></td>
                    <td><%# pbll.GetModel( Convert.ToInt32(Eval("ProductID")))!=null? pbll.GetModel( Convert.ToInt32(Eval("ProductID"))).Price :0 %></td>
                    <td><%# Eval("Num") %></td>
                    <td><%# pbll.GetModel(Convert.ToInt32(Eval("ProductID"))) != null ? pbll.GetModel(Convert.ToInt32(Eval("ProductID"))).Stock : 0%></td>
                    <td class="btn"><a 
                        class='<%# ((cbll.GetModel( Convert.ToInt32(Eval("ID")))!=null)||(obll.GetModel(Convert.ToInt32(Eval("OrderID")),true).State != YS_WEB.Model.YS_Enum.OrderState.已完成))?"huise":"hongse" %>' 
                        onclick='<%# ((cbll.GetModel( Convert.ToInt32(Eval("ID")))!=null)||(obll.GetModel(Convert.ToInt32(Eval("OrderID")),true).State != YS_WEB.Model.YS_Enum.OrderState.已完成))?"bp()":"pj("+ Eval("ID") +")" %>' 
                        href="javascript:;">评价</a></td>
                    </tr>
             </ItemTemplate>
            </asp:Repeater>
       </table>
       </div>
    </form>
    <div id="pjnr" style=" position:absolute; top:150px; left:150px; width:500px; height:300px; background:#FFF; display:none; border:2px solid #CCC;">
        <ul>
            <li style=" height:50px; text-align:center; line-height:50px;  font-size:18px;position:relative;">评价内容：<span id="pjoid" style=" display:none;"></span>
                <a href="javascript:;" style=" display:block; position:absolute;text-align:center; line-height:30px; height:30px; width:30px; right:20px; top:10px; background:Red; color:#FFF;-moz-border-radius: 5px; -webkit-border-radius: 5px;border-radius:5px;" 
                    onclick='$("#pjnr").hide()'>
                    ×
                </a>
            </li>
            <li><textarea class="mtxt" style=" height:200px; width:498px;line-height:20px; font-size:14px;" id="mycjjtxt" cols="20" rows="4"></textarea></li>
            <li style=" height:50px; position:relative">
                <a href="javascript:;" style=" display:block; position:absolute;text-align:center; line-height:30px; height:30px; width:60px; right:20px; top:10px; background:#1ea78d; color:#FFF;-moz-border-radius: 5px; -webkit-border-radius: 5px;border-radius:5px;" 
                    onclick="pjqd()">
                    确定
                </a>
           </li>
        </ul>
    </div>
</body>
</html>
