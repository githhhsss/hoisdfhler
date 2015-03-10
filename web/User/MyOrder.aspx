<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="User_MyOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
       .web-page{ min-height:726px; padding-bottom:50px;}
       .zx-title{ height:200px;background:url('/images/user/wddd.png') center bottom no-repeat}
       .zx-body{ left:0px;right:0px;margin-left:auto; margin-right:auto;width:762px; position:relative; margin-top:50px; }
       
      /* .zx-body .td-1{ width:205px; display:block;}
       .zx-body .td-2{ width:120px; display:block;}
       .zx-body .td-3{ width:100px; display:block;}
       .zx-body .td-4{ width:100px; display:block;}
       .zx-body .td-5{ width:115px; display:block;}
       .zx-body .td-6{ width:120px; display:block;}
       

      
       
       .zx-body .tb-th{ width:760px; border: 1px solid #9a9a9a;  background:#e7e7e7; line-height:45px;}
       
       
       .zx-body .tb-tr{ width:760px; border: 1px solid #9a9a9a; }*/
       
       .zx-body  table{width:760px; border: 1px solid #9a9a9a;}
       .zx-body  table th{background:#e7e7e7; line-height:45px;border-left: 1px solid #FFFFFF; border-right: 1px solid #FFFFFF;  }
       .zx-body  table td{ text-align:center; color:Red; border-bottom: 1px solid #9a9a9a;border-top: 1px solid #9a9a9a;; padding:15px 5px; }
       .zx-body table td div{left:0px;right:0px;margin-left:auto; margin-right:auto; height:auto; width:71px; height:25px;background:url('/images/user/sl.png') center center no-repeat;position:relative;}
       .zx-body table td div input{ position:absolute ; left:5px; top:0px; width:49px; height:25px; text-align:center; line-height:25px; ; border:none; background:none;}
       .zx-body table td div a{ display:block; position:absolute;}
       .zx-body table td div .add{ width:14px; height:11px; left:56px; top:1px;}
       .zx-body table td div .sub{ width:14px; height:11px; left:56px; top:14px;}
       
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
                <th style="width:115px">订单状态</th><th style="border-right:0;width:120px">操作</th></tr>
             <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr><td><%# Eval("") %></td>
                    <td>
                        <div>
                            <input id="Text1" type="text" />
                            <a href="javascript:;" class="add"></a>
                            <a href="javascript:;" class="sub"></a>
                        </div>
                    </td>
                    <td>单价</td>
                    <td>总价</td>
                    <td>订单状态</td>
                    <td>查看/删除</td></tr>
             </ItemTemplate>
            </asp:Repeater>
       </table>
            <%--<div class="tb-th">
                <div class="td td-1">商品名称</div>
                <div class="td td-2">数量</div>
                <div class="td td-3">单价</div>
                <div class="td td-4">总价</div>
                <div class="td td-5">订单状态</div>
                <div class="td td-6">操作</div>
            </div>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="tb-tr">
                        <div class="td td-1">商品名称</div>
                        <div class="td td-2">数量</div>
                        <div class="td td-3">单价</div>
                        <div class="td td-4">总价</div>
                        <div class="td td-5">订单状态</div>
                        <div class="td td-6">操作</div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>--%>
       </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
