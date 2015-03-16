<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductItem.aspx.cs" Inherits="Shop_ProductItem" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
       a{ color:Red;}
    </style>
     <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
        <div class="sci-item">
            <div class="sci-left">
                <img id="pro_img" runat="server" />
            </div>
            <div class="sci-right">
                <ul>
                    <li><span id="sci_name" runat="server"></span></li>
                    <li><span id="sci_say" runat="server"></span></li>
                    <li><span id="sci_price" runat="server"></span></li>
                    <li><span id="sci_stock" runat="server"></span></li>
                    <li><a href="javascript:;">立即购买</a><a href="javascript:;">加入购物车</a></li>
                </ul>
            </div>
        </div>
        <div class="sci-tab">
            <ul>
                <li><a href="javascript:;">商品详情</a></li>
                <li><a href="javascript:;">累计评价<span id="scipnum" runat="server"></span></a></li>
                <li></li>
            </ul>
        </div>
        <div class="sci-centent">
            <div class="sci-centent_1">
                <div id="sci_Description" runat="server"></div>
            </div>

            <div class="sci-centent-Comment">
                <div id="sci-Comment">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="CommentMan"><span><%# Eval("UserName")%></span></div>
                            <div class="CommentContent"><%# Eval("Content")%></div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
