<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Secondary.aspx.cs" Inherits="Order_Secondary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <myControls:WebStyle id="WebStyle1" runat="server" />
      <myControls:WebScript id="WebScript1" runat="server" />
    <title></title>
    <style type="text/css">
        .web-page{ height:1000px;}
    .Secondary-imgtitle{ background:url('/images/zpjd/bgm.png') center bottom no-repeat; width:1366px; height:545px; }
    .Secondary-imgtype{ background:url('/images/zpjd/esqc.png') center bottom no-repeat; width:727px; height:65px; margin-left:320px; margin-top:60px; }
    .Secondary-context{ margin-top:30px; margin-left:300px; width:733px; height:219px;}
    .Secondary-context ul{width:733px; height:219px;}
    .Secondary-context ul li{list-style:none; float:left; padding:0px; }
    .Secondary-context .Secondary-context-li {margin-left:50px; margin-top:70px;}
    .Secondary-context .Secondary-context-li .Secondary-context-li-title{ color:#376d97; font-size:22px; font-weight:bold; margin-bottom:20px;}
    .Secondary-context-line{ margin-top:10px;}
    </style>
</head>
<body>
     <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="Secondary-imgtitle"></div>
    <div class="Secondary-imgtype"></div>
     <%--数据加载开始--%>
    <div class="Secondary-context">
    <ul>
    <li><img style="background:url('/images/index/index_1.jpg') center bottom no-repeat; width:332px; height:219px;" /></li>
    <li class="Secondary-context-li">
    <span class="Secondary-context-li-title">Iphone6（九成新）</span>
    <br />
    <br />
    <span>价格：￥5800&nbsp;&nbsp;成色：9成新&nbsp;&nbsp;区域：广州</span>
    <br />
    <br />
    <span>联系人：屎生&nbsp;&nbsp;电话：1380013800</span>
    </li>
    </ul>
     <div class="Secondary-context-line"><hr /></div>
    </div>
              <%--数据加载结束--%>
    </div>
   <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
