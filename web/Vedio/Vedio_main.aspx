<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Vedio_main.aspx.cs" Inherits="Vedio_Vedio_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <myControls:WebStyle id="WebStyle1" runat="server" />
        <style type="text/css">
       .web-page{ height:768px;}
       .zx-title{ height:160px;background:url('/images/Vedio/title.png') center bottom no-repeat}
       /*.zx-wz{  margin:30px;height:50px;;background:url('/images/Consultation/wz.png') center center no-repeat}*/
       .zx-body{ left:0px;right:0px;margin-left:auto; margin-right:auto;width:865px; overflow:hidden;position:relative; }
       .zx-body ul li{ float:left; padding:25px; width:235px; list-style:none; padding-bottom:0px;}
       .zx-body ul div{ text-align:center;}
       .zx-body ul a{ margin:0 0 0 0 ;width:264px; height:176px; display:inline-block;}
    </style>
     <myControls:WebScript id="WebScript1" runat="server" />
    <title></title>
</head>
<body>
<myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
       <div class="zx-title"></div>
       <div class="zx-wz"></div>
       <div class="zx-body">
            <ul>
                <li><div><a href="/Vedio/Vedio_List.aspx?itemid=1" style="background:url('/images/Vedio/1.jpg') center center no-repeat"></a></div></li>
                <li><div><a href="/Vedio/Vedio_List.aspx?itemid=2" style="background:url('/images/Vedio/2.jpg') center center no-repeat"></a></div></li>
                <li><div><a href="/Vedio/Vedio_List.aspx?itemid=3" style="background:url('/images/Vedio/3.jpg') center center no-repeat"></a></div></li>
            </ul>
       </div>
              <div class="zx-body">
            <ul>
                <li><div><a href="/Vedio/Vedio_List.aspx?itemid=4" style="background:url('/images/Vedio/4.jpg') center center no-repeat"></a></div></li>
                <li><div><a href="/Vedio/Vedio_List.aspx?itemid=5" style="background:url('/images/Vedio/5.jpg') center center no-repeat"></a></div></li>
                <li><div><a href="/Vedio/Vedio_List.aspx?itemid=6" style="background:url('/images/Vedio/6.jpg') center center no-repeat"></a></div></li>
            </ul>
       </div>
              <div class="zx-body">
            <ul>
                <li><div><a href="/Vedio/Vedio_List.aspx?itemid=7" style="background:url('/images/Vedio/7.jpg') center center no-repeat"></a></div></li>
                <li><div><a href="/Vedio/Vedio_List.aspx?itemid=8" style="background:url('/images/Vedio/8.jpg') center center no-repeat"></a></div></li>
                <li><div><a href="/Vedio/Vedio_List.aspx?itemid=9" style="background:url('/images/Vedio/9.jpg') center center no-repeat"></a></div></li>
            </ul>
       </div>
    </div>
        <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
