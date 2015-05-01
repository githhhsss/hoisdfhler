<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Information_main.aspx.cs" Inherits="Information_Information_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <myControls:WebStyle id="WebStyle1" runat="server" />
        <style type="text/css">
       .web-page{ height:726px;background:url('/images/Information/Information_main.png') center bottom no-repeat}
       .zx-title{ height:160px;background:url('/images/Information/hydt.png') center bottom no-repeat}
       /*.zx-wz{  margin:30px;height:50px;;background:url('/images/Consultation/wz.png') center center no-repeat}*/
       .zx-body{ left:0px;right:0px;margin-left:auto; margin-right:auto;width:795px; overflow:hidden;position:relative; }
       .zx-body ul li{ float:left; padding:15px; width:235px; list-style:none;}
       .zx-body ul div{ text-align:center;}
       .zx-body ul img{width:246px; height:273px; }
       .zx-body ul a{ margin-top:20px;;width:153px; height:44px; display:inline-block;}
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
                <li><div><img src="../Images/Information/yt.jpg" /></div><div><a href="/Information/Information_DYDSJ.aspx" style="background:url('/images/Information/dydsj.png') center center no-repeat;width:200px;"></a></div></li>
                <li><div><img src="../Images/Information/2.jpg" /></div><div><a href="/Information/Information_QC.aspx" style="background:url('/images/Information/qc.png') center center no-repeat"></a></div></li>
                <li><div><img src="../Images/Information/3.jpg" /></div><div><a href="/Information/Information_DY.aspx" style="background:url('/images/Information/zz.png') center center no-repeat"></a></div></li>
            </ul>
       </div>
    </div>
        <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
