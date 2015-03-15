<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Release.aspx.cs" Inherits="Shop_Release" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <myControls:WebScript ID="WebScript1" runat="server" />
    <myControls:WebStyle ID="WebStyle1" runat="server" />
    <style type="text/css">
        .web-page
        {
            top:55px;
            width: 1365px;
            height:726px;
            background: url(/images/user/bgm.gif) no-repeat;
        }
        #div1
        {
            position: absolute;
            top: 330px;
            left: 603px;
            font-family: 造字工房雅圆（非商用）常规体;
            font-size: 32px;
        }
        #div2
        {
            position: absolute;
            top: 380px;
            left: 608px;
        }
        .web-page .fh{ position:absolute; display:block; left:30px;top:15px; width:106px; height:46px; background:url("/images/user/fh.gif") left top no-repeat;}
    </style>
</head>
<body>
    <myControls:WebTop ID="WebTop1" runat="server" />
    <div class="web-page">
        <div id="div1">
            修 改 成 功 ！
        </div>
        <div id="div2">
            <a href="javascript:;" class="fh" onmouseover="this.style.backgroundImage='url(/images/user/fh.gif)'"
                onmouseout="this.style.backgroundImage='url(/images/user/fh.gif)'"></a>
        </div>
    </div>
    <myControls:WebFoot ID="WebFoot1" runat="server" />
</body>
</html>
