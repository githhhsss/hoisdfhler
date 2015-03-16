<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductItem.aspx.cs" Inherits="Shop_ProductItem" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
       a{ color:Red;}
       .web-page{ height:900px;}
       #pro_img{ width:661px; height:383px;}
       .sci-left{ margin-top:119px; float:left;}
       .sci-right{margin-top:119px; float:left; margin-left:150px;}
       #sci_name{ font-family:造字工房雅圆（非商用）常规体; font-size:37px;}
       #sci_say{font-family:造字工房雅圆（非商用）常规体; font-size:12px;}
       #sci_price{font-family:造字工房雅圆（非商用）常规体; font-size:37px;}
       #sci_stock{font-family:造字工房雅圆（非商用）常规体; font-size:37px;}
      .web-page .sci-item .sci-right ul li{list-style:none;padding:0; margin-bottom:20px;}
      .web-page .sci-item .sci-right #buy{ margin-top:150px;}
      .sci-tab{ position:absolute; height:55px; width:100%;top:553px;}
       .sci-tab ul{ width:100%;}
      .sci-tab ul li{list-style:none; float:left;padding:0; margin-left:216px;}
      .sci-tab #xq a{ font-family:造字工房雅圆（非商用）常规体; font-size:24px; color:#1ea78d;}
       .sci-tab #pj a{ font-family:造字工房雅圆（非商用）常规体; font-size:24px; color:#848484;}
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
                    <li id="buy"><a href="javascript:;">立即购买</a><a href="javascript:;">加入购物车</a></li>
                </ul>
            </div>
        </div>
        <div class="sci-tab">
            <ul>
                <li id="xq"><a href="javascript:;">商品详情</a></li>
                <li id="pj"><a href="javascript:;">累计评价<span id="scipnum" runat="server"></span></a></li>
                <li></li>
            </ul>
            <br />
            <br />
            <br />
            <hr />
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
