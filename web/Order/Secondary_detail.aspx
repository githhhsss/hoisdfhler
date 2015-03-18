<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Secondary_detail.aspx.cs" Inherits="Order_Secondary__detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <myControls:WebStyle id="WebStyle1" runat="server" />
      <myControls:WebScript id="WebScript1" runat="server" />
    <title></title>
    <style type="text/css">
    .web-page{ height:1700px; background-color:#d4d4d4; position:relative;}
    .Secondary_detail-imgtitle{ top:70px; left:450px; height:103px;width:450px; position:absolute;background:url('/images/shop/bj_title.png') center bottom no-repeat; z-index:1000; line-height:103px; text-align:center; font-size:42px; color:White; font-weight:bold;}
    .Secondary_detail-whitebox{ background-color:White; width:1196px; position:absolute;top:91px;left:85px; height:1500px;}
    .Secondary_detail-whitebox-left{ width:460px; height:460px; background:url('/images/img2.png') center bottom no-repeat; position:absolute;top:202px; left:120px; }
    .Secondary_detail-whitebox-right{ position:absolute;top:212px; left:685px;}
    .Secondary_detail-name{ width:100%; font-size:37px;font-family:造字工房雅圆（非商用）常规体; font-weight:bold; margin-bottom:30px; }
    .Secondary_detail-name-detailed{ }
    .Secondary_detail-name-detailed ul li{list-style:none;  padding:0 0 0 0; margin-bottom:38px; font-size:37px;}
    .Secondary_detail-name-detailed .Secondary_detail-name-detailed-leftspan{ color:#aeaeae;}
    .Secondary_detail-name-detailed .Secondary_detail-name-detailed-rightspan{ color:Black;}
    .Secondary_detail-xq{ position:absolute; top:788px; left:110px; margin-right:110px;font-family:造字工房雅圆（非商用）常规体; color:#4fb3a0; font-size:37px;}
    .Secondary_detail-line{position:absolute;top:833px; margin-left:50px;}
    .Secondary_detail-line hr{ width:966px; height:2px;}
    .Secondary_detail-context{ position:absolute;top:863px; left:110px; }
    </style>
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="Secondary_detail-imgtitle">二手器材</div>
    <div class="Secondary_detail-whitebox">
    <div class="Secondary_detail-whitebox-left"><img /></div>
    <div class="Secondary_detail-whitebox-right">
    <div class="Secondary_detail-name"  id="zptxt1" runat="server">Iphone6（9成新）</div>
    <div class="Secondary_detail-name-detailed">
    <ul>
    <li><span class="Secondary_detail-name-detailed-leftspan">价&nbsp;格：￥</span><span class="Secondary_detail-name-detailed-rightspan" id="zptxt2" runat="server">1200</span></li>
     <li><span class="Secondary_detail-name-detailed-leftspan">成&nbsp;色：</span><span class="Secondary_detail-name-detailed-rightspan" id="zptxt3" runat="server">9成新</span></li>
      <li><span class="Secondary_detail-name-detailed-leftspan">区&nbsp;域：</span><span class="Secondary_detail-name-detailed-rightspan"  id="zptxt4" runat="server">广州</span></li>
    <li><span class="Secondary_detail-name-detailed-leftspan">联系人：</span><span class="Secondary_detail-name-detailed-rightspan" id="zptxt5" runat="server">屎生</span></li>
    <li><span class="Secondary_detail-name-detailed-leftspan">电&nbsp;话：</span><span class="Secondary_detail-name-detailed-rightspan" id="zptxt6" runat="server">1380013800</span></li>
    </ul>
    </div>
    </div>
    <div class="Secondary_detail-xq">商品详情</div>
    <div class="Secondary_detail-line"><hr /></div>
    <div class="Secondary_detail-context" id="zptxt7" runat="server" style=" text-align:left; line-height:50px; font-size:18px;"></div>
    </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
