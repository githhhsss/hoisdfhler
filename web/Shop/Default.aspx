<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Shop_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebScript id="WebScript1" runat="server" />
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
        /*商城标题*/
       .sc-title{ height:160px;background:url('/images/shop/sc.png') center bottom no-repeat; margin-bottom:30px;}
       
       /*定宽980px*/
       .sc-width{left:0px;right:0px;margin-left:auto; margin-right:auto;width:980px; overflow:hidden;position:relative; }
       
       /*轮播图片*/
       .slides img{ height:516px; width:1366px;}
       
       /*菜单导航*/
       .sc-meun{ height:160px;}
       .sc-meun .sc-meun-left{ float:left ;height:100%; width:460px; background:url("/images/shop/hx3.png") 247px 75px no-repeat}
       .sc-meun .sc-meun-centent{ float:left; width:446px; height:100%;}
       .sc-meun .sc-meun-right{ float:left ;height:100%; width:460px;background:url("/images/shop/hx3.png") -1000px 75px no-repeat}
       .sc-meun .active{ background:background:url("/images/shop/anbj.png") center center no-repeat}
       .sc-meun .sc-meun-centent a{line-height:46px; text-align:center; color:#082235; font-size:22px; text-decoration:none;}
       .sc-meun .sc-a-1{ display:inline-block; width:117px; height:46px; margin: 55px 0px 59px 16px; }
       .sc-meun .sc-a-2{ display:inline-block; width:117px; height:46px; margin: 55px 0px 59px 32px;}
       .sc-meun .sc-a-3{ display:inline-block; width:117px; height:46px; margin: 55px 0px 59px 32px;}
       
       /*中间固定8栏*/
       .sc-center{ margin:0px; padding:0px;}
       .sc-center ul li{ list-style:none; float:left; height:260px;}
       .sc-center ul li .sc-center-img{ width:341px; height:260px;}
       .sc-center ul li .sc-center-img1{width:342px;height:260px;}
       
       /*产品列表*/
       .sc-centent{ }
       sc-centent sc-width{ }
       .sc-centent a{ color:Black;}
       .sc-content-1-fl{ font-weight:bold; font-size:25px;}
      .sc-centent-1{ margin-top:55px;width:980px;}
       .sc-centent-2{ margin-top:28px; height:44px;width:980px;background:url('/images/shop/shoptitle.png') center bottom no-repeat;}
       .sc-centent-2 ul{ font-size:12px;}
       .sc-centent-2 ul li { list-style:none;padding:0;float:left;  margin:16px 20px 0px 20px;}
       .sc-centent-2-li{ margin-left:500px;}
       .sc-centent-3{margin-top:18px;height:44px;width:980px;background:url('/images/shop/fltitle.png') center bottom no-repeat;}
       .sc-centent-3 ul{ font-size:12px; color:#0eb493;font-weight:bold;}
       .sc-centent-3 ul li { list-style:none;padding:0;float:left; margin:16px 20px 0px 20px;}
       .sc-centent-4{margin-top:26px; width:980px;height:200px;}
       
       /*合作伙伴链接*/
       .sc-bottom{ padding-top:60px; padding-bottom:60px;}
       .sc-bottom li{ float:left; list-style:none;}
       .sc-bottom img{ width:150px; height:90px; margin-right:57px;}
       .sc-bottom .last img{ margin-right:0px;}
    </style>
     <script type="text/javascript">
         $(window).load(function () {
             $('.flexslider').flexslider({
                 animation: "slide",
                 controlsContainer: ".flex-container"
             });
         });
    </script>
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
        <div class="sc-title"></div>
        <div class="sc-ban">
            <div class="flexslider">
                <ul class="slides">
                    <li><a href="javascript:;"><img src="../Images/shop/ban.jpg" /></a></li>
                    <li><a href="javascript:;"><img src="Images/index/roll/roll_2.jpg" /></a></li>
                    <li><a href="javascript:;"><img src="Images/index/roll/roll_3.jpg" /></a></li>
                    <li><a href="javascript:;"><img src="Images/index/roll/roll_4.jpg" /></a></li>
                </ul>
            </div>
        </div>

        <div class="sc-meun">
            <div class="sc-meun-left"></div>
            <div class="sc-meun-centent">
                <a href="javascript:;" class="sc-a-1 active">热卖器材</a>
                <a href="javascript:;" class="sc-a-2">新品推荐</a>
                <a href="javascript:;" class="sc-a-3">旗舰店</a>
            </div>
            <div class="sc-meun-right"></div>
        </div>

        <div class="sc-center">
            <ul>
                <li><a href="#"><img class="sc-center-img sc-center-img1" src="../Images/shop/yt.jpg" /></a></li>
                <li><a href="#"><img class="sc-center-img" src="../Images/shop/yt.jpg" /></a></li>
                <li><a href="#"><img class="sc-center-img" src="../Images/shop/yt.jpg" /></a></li>
                <li><a href="#"><img class="sc-center-img sc-center-img1" src="../Images/shop/yt.jpg" /></a></li>
                <li><a href="#"><img class="sc-center-img sc-center-img1" src="../Images/shop/yt.jpg" /></a></li>
                <li><a href="#"><img class="sc-center-img" src="../Images/shop/yt.jpg" /></a></li>
                <li><a href="#"><img class="sc-center-img" src="../Images/shop/yt.jpg" /></a></li>
                <li><a href="#"><img class="sc-center-img sc-center-img1" src="../Images/shop/yt.jpg" /></a></li>
            </ul>
        </div>

        <div class="sc-centent sc-width">
            <div class="sc-centent-1"><span class="sc-content-1-fl">所有分类</span>&nbsp;&nbsp;&nbsp; <a href="../Default.aspx">首页</a> &gt; <a href="Default.aspx">商城</a></div>
            <div class="sc-centent-2">
                <ul>
                    <li><span>综合</span></li>
                    <li><span>销量</span></li>
                    <li><span>价格从低到高</span></li>
                    <li><span>价格从高到底</span></li>
                    <li class="sc-centent-2-li">
                        <span ><input id="scText1" type="text" /></span></li>
                </ul>
            </div>
            <div class="sc-centent-3">
                <ul>
                    <li><span>分类：</span></ li>
                    <li><span>摄像机/相机</span></ li>
                    <li><span>镜头</span></ li>
                    <li><span>辅助设备</span></ li>
                    <li><span>我的购物车</span></li>
                </ul>
            </div>
            <div class="sc-centent-4">
                <ul>
                    <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                    <li><a href="ProductItem.aspx?itemid=<%# Eval("ID") %>"><div><img src="/ProductImg/<%# Eval("ProductAddress") %>" /><span><%# Eval("ProductName")%></span><span>$<%# Eval("Price")%></span></div></a></li>
                    </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>

        <div class="sc-bottom sc-width">
            <ul class="clear">
                <li>
                    <a href="javascript:;"><img src="../Images/shop/brandyp.jpg" /></a>
                </li>
                <li>
                    <a href="javascript:;"><img src="../Images/shop/brandyp.jpg" /></a>
                </li>
                <li>
                    <a href="javascript:;"><img src="../Images/shop/brandyp.jpg" /></a>
                </li>
                <li>
                    <a href="javascript:;"><img src="../Images/shop/brandyp.jpg" /></a>
                </li>
                <li class="last">
                    <a href="javascript:;"><img src="../Images/shop/brandyp.jpg" /></a>
                </li>
            </ul>
        </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
