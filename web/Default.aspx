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
        $(function () {
            $(".index-content-tab").addClass("current0");
            $("#index-list-1").show();
            $("#current0").hover(function () {
                $(".index-content-tab").removeClass("current0");
                $(".index-content-tab").removeClass("current1");
                $(".index-content-tab").removeClass("current2");
                $(".index-content-tab").addClass("current0");
                $("#index-list-2").hide();
                $("#index-list-3").hide();
                $("#index-list-1").show();
            });
            $("#current1").hover(function () {
                $(".index-content-tab").removeClass("current0");
                $(".index-content-tab").removeClass("current1");
                $(".index-content-tab").removeClass("current2");
                $(".index-content-tab").addClass("current1");
                $("#index-list-1").hide();
                $("#index-list-3").hide();
                $("#index-list-2").show();
            });
            $("#current2").hover(function () {
                $(".index-content-tab").removeClass("current0");
                $(".index-content-tab").removeClass("current1");
                $(".index-content-tab").removeClass("current2");
                $(".index-content-tab").addClass("current2");
                $("#index-list-2").hide();
                $("#index-list-1").hide();
                $("#index-list-3").show();
            });

           
            UpdateIndex1();
            UpdateIndex2();
            UpdateIndex3();
        })

        function UpdateIndex1() {
            yscom.ajax({
                url: "Handler.ashx?cmd=UpdateIndex1",
                data: {},
                success: function (data) {
                    if (data.flag == "true") {
                        $("#index-list-1-centent").html(data.msg);
                    } 
                }
            });
        }
        function UpdateIndex2() {
            yscom.ajax({
                url: "Handler.ashx?cmd=UpdateIndex2",
                data: {},
                success: function (data) {
                    if (data.flag == "true") {
                        $("#index-list-2-centent").html(data.msg);
                    } 
                }
            });
        }
        function UpdateIndex3() {
            yscom.ajax({
                url: "Handler.ashx?cmd=UpdateIndex3",
                data: {},
                success: function (data) {
                    if (data.flag == "true") {
                        $("#index-list-3-centent").html(data.msg);
                    } 
                }
            });
        }
    </script>
    <style type="text/css">
        /*轮播图片*/
        .slides img{ height:683px; width:1366px;}
        /*导航*/
        .index-content .index-content-tab{ width:100%; height:54px; margin-top:50px; text-align:center;padding-bottom:30px;}
        .current0{background: url('/Images/index/meun_1.png') center top no-repeat;}
        .current1{background: url('/Images/index/meun_2.png') center top no-repeat;}
        .current2{background: url('/Images/index/meun_3.png') center top no-repeat;}
        .index-tab-noneleft{ float:left; width:440px; display:inline-block; height:1px;}
        .index-content .index-content-tab ul{ float:left;}
        .index-content .index-content-tab ul li{ float:left; list-style:none;}
        .index-content .index-content-tab a{ width:120px; height:40px; padding:0 25px;}
        /*导航按钮*/
        #current0{ display:inline-block;}
        #current1{ display:inline-block;}
        #current2{ display:inline-block;}
        /*列表内容*/
        .index-list{ width:740px; height:250px; margin-left:auto; margin-right:auto; position:relative;}
        .index-list .index-list-tottom{ position:absolute; bottom:0px; width:100%; height:30px;background: url('/Images/index/bottom_1.png') center center no-repeat;}
        
        /*列表图片*/
        .index-list-img{ height:219px; width:332px;}
        .index-list-img img{ height:219px; width:332px;}
        /*列表文字*/
        .index-list-text{ padding-left:100px; width:308px; padding-top:35px;}
        .index-list-text h2{ font-family:宋体; font-weight:bold; font-size:20px;}
        .index-list-text h3{ font-family:宋体; font-weight:bold; font-size:12px; color:#59c3aa; margin-top:10px;  margin-bottom:20px;}
        .index-list-text h3 a{color:#59c3aa;}
        .index-list-text h3 a:hover{text-decoration: none;}
        .index-list-text span{color:#062033; font-family:Myriad Pro; line-height:}
        #index-list-1,#index-list-2,#index-list-3{ display:none; padding-bottom:50px;}
         #index-list-1 a,#index-list-2 a,#index-list-3 a{  color:#666;}
        #index-list-1 a:hover,#index-list-2 a:hover,#index-list-3 a:hover{ text-decoration:underline;}
        
        .Recruitment-title
        {
            margin-left: 343px;
            margin-top: 33px;
            height: 38px;
        }
        .Recruitment-title ul
        {
            height: 25px;
        }
        .Recruitment-title ul li
        {
            list-style: none;
            float: left;
            padding: 0px;
            font-family: 造字工房雅圆（非商用）常规体;
            height: 25px;
        }
        .Recruitment-title .Recruitment-title-name
        {
            color: #376d97;
            font-size: 22px;
            font-weight: bold;
        }
        .Recruitment-title .Recruitment-title-city
        {
            font-size: 16px;
            font-weight: bold;
            margin-top: 5px;
        }
        .Recruitment-title .Recruitment-title-Salary
        {
            font-size: 16px;
            margin-top: 5px;
        }
        .Recruitment-context
        {
            margin-left: 343px;
            margin-top: 20px;
            height: 165px;
        }
        .Recruitment-context ul
        {
            height: 25px;
        }
        .Recruitment-context ul li
        {
            list-style: none;
            padding: 0px;
            font-family: 造字工房雅圆（非商用）常规体;
            height: 25px;
        }
        .Recruitment-context .Recruitment-context-time
        {
            margin-top: 10px;
        }
        
    </style>
</head>
<body>
    <myControls:WebTop ID="WebTop1" runat="server" />
    <div class="web-page">
        <div class="index-roll">
            <div class="flexslider">
                <ul class="slides">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li><a href='<%# Eval("WebUrl") %>'><img src='../ProductImg/webImg/<%# Eval("WebImg") %>' /></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
        <div class="index-content">
            <div class="index-content-tab">
                <div class="index-tab-noneleft"></div>
                <ul>
                    <li><a id="current0" href="javascript:;"><%--最新资讯--%></a></li>
	                <li><a id="current1" href="javascript:;"><%--行业动态--%></a></li>
                    <li><a id="current2" href="javascript:;"><%--推荐视频--%></a></li>
                </ul>
            </div>
            <div class="clear"></div>
            <%--最新资讯--%>
            <div id ="index-list-1" style = " position:relative;">
            <a href="javascript:;"  onclick="UpdateIndex1()" style =" position:absolute; left:1100px;">换一批</a>
            <div id="index-list-1-centent">
            <%--<div class="index-list">
                <div class="index-list-img fl">
                    <img src="Images/index/index_2.jpg" alt="" />
                </div>
                <div class="index-list-text fl">
                    <h2>幽默讽刺短片《我妈妈的摩托车》</h2>
                    <h3><a href="#">创意</a> <a href="#">励志</a> <a href="#">MV</a> <a href="#">科幻/奇幻</a><span class="index-list-text-time"></span></h3>
                    <span>短片《My mom’s motorcycle》（我妈妈的摩托车）作为My Rode Reel  短片比赛的参赛作品，以幽默的手法讲述了一个男孩的妈妈如何成为他摩托车主人的故事短片取材于导演Douglas Ga . . .</span>
                    <div class="index-list-text-bottom"></div>
                </div>
                <div class="index-list-tottom clear"></div>
            </div>--%>
            </div>
            </div>
            <%--行业动态--%>
            <div id ="index-list-2" style = " position:relative;">
            <a href="javascript:;" onclick="UpdateIndex2()" style =" position:absolute; left:1100px;">换一批</a>
            <div id="index-list-2-centent">
            <%--<div class="index-list">
                <div class="index-list-img fl">
                    <img src="Images/index/index_1.jpg" alt="" />
                </div>
                <div class="index-list-text fl">
                    <h2>幽默讽刺短片《我妈妈的摩托车》</h2>
                    <h3><a href="#">创意</a> <a href="#">励志</a> <a href="#">MV</a> <a href="#">科幻/奇幻</a><span class="index-list-text-time"></span></h3>
                    <span>短片《My mom’s motorcycle》（我妈妈的摩托车）作为My Rode Reel  短片比赛的参赛作品，以幽默的手法讲述了一个男孩的妈妈如何成为他摩托车主人的故事短片取材于导演Douglas Ga . . .</span>
                    <div class="index-list-text-bottom"></div>
                </div>
                <div class="index-list-tottom clear"></div>
            </div>--%>
            </div>
            </div>
            <%--推荐视频--%>
            <div id ="index-list-3" style = " position:relative;">
            <a href="javascript:;" onclick="UpdateIndex3()" style =" position:absolute; left:1100px;">换一批</a>
            <div id="index-list-3-centent">
                <%--<div class="index-list">
                <div class="index-list-img fl">
                    <img src="Images/index/index_3.jpg" alt="" />
                </div>
                <div class="index-list-text fl">
                    <h2>幽默讽刺短片《我妈妈的摩托车》</h2>
                    <h3><a href="#">创意</a> <a href="#">励志</a> <a href="#">MV</a> <a href="#">科幻/奇幻</a><span class="index-list-text-time"></span></h3>
                    <span>短片《My mom’s motorcycle》（我妈妈的摩托车）作为My Rode Reel  短片比赛的参赛作品，以幽默的手法讲述了一个男孩的妈妈如何成为他摩托车主人的故事短片取材于导演Douglas Ga . . .</span>
                    <div class="index-list-text-bottom"></div>
                </div>
                <div class="index-list-tottom clear"></div>
            </div>--%>
            </div>
            </div>
        </div>
    </div>
    <myControls:WebFoot ID="WebFoot1" runat="server" />

</body>
</html>
