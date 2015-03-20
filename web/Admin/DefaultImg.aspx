<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultImg.aspx.cs" Inherits="User_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
    .my-left{ float:left; width:400px;}
    .my-left-top{ margin-left:30px; margin-top:85px; border:1px solid #ccc; width:312px; background:#FFF}
    .my-left-top .headimg{ margin-left:30px; margin-top:30px; width:255px; height:255px;}
    .my-left-top ul li { list-style:none;}
    .my-left-top ul li .myName{ position:relative; font-size:15px; font-family:造字工房雅圆（非商用）常规体; line-height:20px; font-weight:bold; margin-left:30px; margin-top:5px; margin-bottom:10px;}
    .my-left-top ul li .myName .myName-name{font-size:20px;}
    .my-left-top .my-mun{border-top:1px solid #ccc;font-family:造字工房雅圆（非商用）常规体;line-height:50px;font-size:13px;margin-top:5px; margin:0 30px; color:#aaaaaa;}
    .my-left-top .my-mun span{ color:#1ea78d;font-size:25px; margin-right:10px;}
    
    .my-left-bottom{ margin-left:30px; margin-top:40px; margin-bottom:35px; border:1px solid #ccc; width:312px; background:#FFF}
    .my-left-bottom ul li { list-style:none;}
    .my-left-bottom ul li a{  display:block;color:#000; height:35px; width:255px;margin:0 30px; line-height:35px; font-size:16px;border-top:1px solid #ccc; text-decoration:none;}
    .my-left-bottom ul li a:hover{color:#ccc;}
    .my-left-bottom ul li .set-top{border-top:none;}
    .my-left-bottom .active{ color:Red;}
    
    .my-right{float:left; width:930px;}
    .u-right{margin-top:85px;margin-bottom:35px; background:#fff;}
    .my-right .u-right .orderTitle{ height:70px; width:100%; background:#ebebeb; border-bottom:1px solid #DDDDDD;}
    .my-right .u-right .orderTitle a{ display:block; float:left; height:69px; line-height:69px; width:180px;border-right:1px solid #DDDDDD; text-align:center; font-size:23px;text-decoration:none; color:#000000;}
    .my-right .u-right .orderTitle .sel{border-top:5px solid #1ea78d; height:65px; background:#FFF; line-height:60px;}
    
    .my-right .u-right .data-edit{ height:710px;}
    .my-right .u-right .data-edit ul li{ list-style:none;}
    
    </style>
    <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />

    <div class="web-page">
        <div class="my-left">
            <div class="my-left-top">
                <ul>
                    <li><img class="headimg" src="~/User/UserPic/u_face.jpg" id="headImg" runat="server" /></li>
                    <li>
                        <div class="myName">
                            <span class="myName-name" id="name" runat="server"></span>
                            <br />
                            <span id="readName" runat="server"></span>/<span id="city" runat="server"></span>
                            <div></div>
                        </div>
                    </li>
                    <li><div class="my-mun"><span id="renqi" runat="server"></span> 人气</div></li>
                    <li><div class="my-mun"><span id="jifen" runat="server"></span> 积分</div></li>
                    <li><div class="my-mun"><span id="fensi" runat="server"></span> 粉丝 / <span id="guanzhu" runat="server"></span> 关注</div></li>
                </ul>
            </div>
            <div class="my-left-bottom">
                <ul>
                <li><a href="Default.aspx" class="set-top active">个人设置</a></li>
                <li><a href="UserManager.aspx">用户管理</a></li>
                <li><a href="ProductManager.aspx">商品管理</a></li>
                <li><a href="FWProductManager.aspx">摄影服务</a></li>
                <li><a href="OrderManager.aspx">订单管理</a></li>
                <li><a href="ZhaoPinManager.aspx">招聘信息</a></li>
                <li><a href="ZiXunManager.aspx">资讯文章</a></li>
                </ul>
            </div>
        </div>
        <div class="my-right">
            <div class="u-right">

                <div class="orderTitle">
                    <a href="Default.aspx">个人信息</a> 
                    <a href="DefaultPasswrod.aspx">修改密码</a> 
                    <a class="sel" href="DefaultImg.aspx">更改头像</a>
                </div>

            <!--信息-->
            <div class="data-edit">
                <form id="form1" runat="server">
                <div style=" margin-top:80px; margin-left:100px;">
                    <ul>
                        <li> <span style=" font-family: Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height:35px; font-size:14px; color:#999; font-weight:bold;">当前图像</span></li>
                        <li>
                            <div style="  float:left;width:303px; height:303px; border:solid 1px #e1e1e1; padding:3px;">
                                <img src="/User/UserPic/u_face.jpg" width="300" height="300" runat="server" id="userImg" style="border:solid 1px #fafafa;" />
                            </div>
                            <div style="float:left; width:330px; margin-left:30px; margin-top:20px;"><img src="../Images/user/headImg.jpg" /></div><div class="clear"></div>
                        </li>
                        <li><span style=" font-family: Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height:35px; font-size:14px; color:#999;font-weight:bold;">更换头像</span></li>
                        <li>
                            <asp:FileUpload ID="FileUpload1" runat="server" style=" width:350px; height:25px;" />
                            <asp:Button ID="Button1" style=" width:50px; height:25px;" runat="server" 
                                Text="上 传" onclick="Button1_Click" /><asp:HiddenField ID="HiddenField1" runat="server" Value="false" />
                                <asp:HiddenField ID="HiddenField2" runat="server" Value="false" />
                        </li>
                        <li><span style=" font-family: Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height:25px; font-size:12px; color:#f60">请不要上传反动，色情，暴力等违法的图片。</span></li>
                        <li><span style=" font-family: Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height:25px; font-size:12px; color:#969696">支持jpg,jpeg,png,gif格式的图片,文件大小不能超过200K</span></li>
                    </ul>
                </div>
                </form>
            </div>
        </div>
        <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>

    <mycontrols:webFoot id="WebFoot1" runat="server"/>
    <input type="hidden" runat="server" class="hfProvince" id="hfProvince" />
    <input type="hidden" runat="server" class="hfCity" id="hfCity" />
    <input type="hidden" runat="server" class="hfArea" id="hfArea" />
</body>
</html>
