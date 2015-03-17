<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Photography.aspx.cs" Inherits="Order_Photography" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <myControls:WebStyle id="WebStyle1" runat="server" />
      <myControls:WebScript id="WebScript1" runat="server" />
    <title></title>
    <style type="text/css">
        .web-page{ height:1000px;}
    .Photography-imgtitle{ background:url('/images/zpjd/bgm.png') center bottom no-repeat; width:1366px; height:545px; }
    .Photography-imgtype{ background:url('/images/zpjd/psfw.png') center bottom no-repeat; width:727px; height:65px; margin-left:320px; margin-top:60px; }
    .Photography-context{ margin-top:30px; margin-left:300px; width:733px; height:219px;}
    .Photography-context ul{width:733px; height:219px;}
    .Photography-context ul li{list-style:none; float:left; padding:0px; }
    .Photography-context .Photography-context-li {margin-left:50px; margin-top:70px;}
    .Photography-context .Photography-context-li .Photography-context-li-title{ color:#376d97; font-size:22px; font-weight:bold; margin-bottom:20px;}
    .Photography-context-line{ margin-top:10px;}
    </style>
</head>
<body>
     <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="Photography-imgtitle"></div>
    <div class="Photography-imgtype"></div>
     <%--数据加载开始--%>
    <div class="Photography-context">
    <ul>
    <li><img style="background:url('/images/index/index_1.jpg') center bottom no-repeat; width:332px; height:219px;" /></li>
    <li class="Photography-context-li">
    <span class="Photography-context-li-title">巴厘岛婚纱摄影</span>
        <br />
    <br />
    <span>价格：￥1200&nbsp;&nbsp;联系人：屎生&nbsp;&nbsp;电话：1380013800</span>
    </li>
    </ul>
     <div class="Photography-context-line"><hr /></div>
    </div>
              <%--数据加载结束--%>
    </div>
   <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
