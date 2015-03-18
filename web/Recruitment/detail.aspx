<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="Recruitment_detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<myControls:WebStyle id="WebStyle1" runat="server" />
      <myControls:WebScript id="WebScript1" runat="server" />
      <style type="text/css">
     .web-page{ background-color:#d3d3d3; height:1000px; position:relative;margin:0px auto;padding:0px;}
     .web-page .detail-top{position:absolute; height:103px;top:70px;left:220px; width:450px;background:url('/images/shop/bj_title.png') center bottom no-repeat; z-index:1000; line-height:103px; text-align:center; font-size:42px; color:White; font-weight:bold;}
     .web-page .detail-left{position:absolute;background-color:White; height:850px;top:91px;left:30px; width:872px;}
     .web-page .detail-left-context{ width:100%; height:172px; margin-top:115px; margin-left:42px;}
     .web-page .detail-left ul{}
     .web-page .detail-left ul li{list-style:none;padding:0px; margin-top:35px;}
     .web-page .detail-left .detail-left-left-span{ font-size:16px; font-weight:bold;}
     .web-page .detail-left .detail-left-right-span{ font-size:22px; font-weight:bold;}
     .web-page .detail-left .detail-left-time{ margin-left:650px;}
     .web-page .detail-left .detail-left-description{ margin-top:60px; width:100%;}
     .web-page .detail-left .detail-left-title{width:100%; margin:0 0 0 42px; padding:0 0 0 0; font-size:16px; font-weight:bold;}
     .web-page .detail-left .detail-left-description-context{font-size:16px;padding:0 0 0 0;margin:40px 0 0 42px; line-height:32px; }
     .web-page .detail-right{position:absolute; background-color:#e3e3e5; height:700px; width:405px; top:91px; left:920px;}
     .web-page .detail-right .detail-right-title{ color:#6686b7; font-size:23px; margin:20px 0 0 25px;font-weight:bold;}
     .web-page .detail-right .detail-right-context{ margin:37px 25px 0 25px;font-weight:bold;font-size:16px;line-height:32px;}
      </style>
    <title></title>
</head>
<body>
     <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="detail-top" id="zptxt0" runat="server">影视摄影师</div>
    <div class="detail-left">
    <div class="detail-left-context">
        <ul>
    <li><span class="detail-left-left-span">招聘公司：</span><span class="detail-left-right-span" id="zptxt1" runat="server"></span></li>
    <li><span class="detail-left-left-span">工作地点：</span><span class="detail-left-right-span" id="zptxt2" runat="server"></span></li>
    <li><span class="detail-left-left-span">薪资范围：</span><span class="detail-left-right-span" id="zptxt3" runat="server"></span></li>
    <li class="detail-left-time"><span class="detail-left-left-span"  id="zptxt4" runat="server"></span></li>
    </ul>
    </div>
    <div class="detail-left-description"  id="zptxt5" runat="server">

    </div>
    </div>
    <div class="detail-right">
    <div class="detail-right-title" id="zptxt6" runat="server"></div>
    <div class="detail-right-context" id="zptxt7" runat="server">
   
    </div>
    </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
