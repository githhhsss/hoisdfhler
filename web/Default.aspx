<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <myControls:WebStyle ID="WebStyle1" runat="server" />
    <myControls:WebScript ID="WebScript1" runat="server" />
    <script type="text/javascript">
        //图片轮播（flexSlider JQ插件）
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                controlsContainer: ".flex-container"
            });
        });
    </script>
    <style type="text/css">
        .slides img{ height:683px; width:1366px;}
        .index-content{}
        .index-content .index-content-tab{}
        .index-content .index-list{}
        .tabs-pro.current0, .tabs-pro.current0:hover{ background:url("/themestx/images/newc/tab/tab1.png") no-repeat }
        .tabs-pro.current1, .tabs-pro.current1:hover{ background:url("/themestx/images/newc/tab/tab2.png") no-repeat }
        .tabs-pro.current2, .tabs-pro.current2:hover{ background:url("/themestx/images/newc/tab/tab3.png") no-repeat }
    </style>
</head>
<body>
    <myControls:WebTop ID="WebTop1" runat="server" />
    <div class="web-page">
        <div class="index-roll">
            <div class="flexslider">
                <ul class="slides">
                    <li><a href="javascript:;"><img src="Images/index/roll/roll_1.jpg" /></a></li>
                    <li><a href="javascript:;"><img src="Images/index/roll/roll_2.jpg" /></a></li>
                    <li><a href="javascript:;"><img src="Images/index/roll/roll_3.jpg" /></a></li>
                    <li><a href="javascript:;"><img src="Images/index/roll/roll_4.jpg" /></a></li>
                </ul>
            </div>
        </div>
        <div class="index-content">
            <div class="index-content-tab">
                <ul>
                    <li><a id="current0" href="javascript:;"></a></li>
	                <li><a id="current1" href="javascript:;"></a></li>
                    <li><a id="current2" href="javascript:;"></a></li>
                </ul>
            </div>
            <div class="index-list"></div>
        </div>
    </div>
    <myControls:WebFoot ID="WebFoot1" runat="server" />
</body>
</html>
