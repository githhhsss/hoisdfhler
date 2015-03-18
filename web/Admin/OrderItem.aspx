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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="zx-body-item">
            <table cellpadding=0 cellspacing=0>
            <tr><th style="border-left:0;">商品名称</th><th style="width:120px">单价</th><th style="width:100px">订单数量</th><th style="width:100px">库存</th>
                </tr>
             <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <tr>
                    <td><%# pbll.GetModel( Convert.ToInt32(Eval("ProductID")))!=null? pbll.GetModel( Convert.ToInt32(Eval("ProductID"))).ProductName :"" %></td>
                    <td><%# pbll.GetModel( Convert.ToInt32(Eval("ProductID")))!=null? pbll.GetModel( Convert.ToInt32(Eval("ProductID"))).Price :0 %></td>
                    <td><%# Eval("Num") %></td>
                    <td><%# pbll.GetModel(Convert.ToInt32(Eval("ProductID"))) != null ? pbll.GetModel(Convert.ToInt32(Eval("ProductID"))).Stock : 0%></td>
                    </tr>
             </ItemTemplate>
            </asp:Repeater>
       </table>
       </div>
    </form>
</body>
</html>
