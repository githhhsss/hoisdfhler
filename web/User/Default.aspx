<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
    .my-left{ float:left; width:400px;}
    .my-left-top{ margin-left:50px; margin-top:100px; border:1px solid #ccc; width:240px; background:#FFF}
    .my-left-top .headimg{ margin-left:30px; margin-top:30px; width:180px; height:180px;}
    .my-left-top ul li { list-style:none;}
    .my-left-top ul li .myName{ position:relative; font-size:12px; font-family:造字工房雅圆（非商用）常规体; line-height:20px; font-weight:bold; margin-left:30px; margin-top:5px; margin-bottom:10px;}
    .my-left-top ul li .myName .myName-name{font-size:14px;}
    .my-left-top .my-mun{border-top:1px solid #ccc;font-family:造字工房雅圆（非商用）常规体;line-height:50px;font-size:14px;margin-top:5px; margin:0 30px;}
    .my-left-top .my-mun span{ color:#1ea78d;}
    
    .my-left-bottom{ margin-left:50px; margin-top:40px; margin-bottom:40px; border:1px solid #ccc; width:240px; background:#FFF}
    .my-left-bottom ul li { list-style:none;}
    .my-left-bottom ul li a{  display:block;color:#000; height:40px; width:180px;margin:0 30px; line-height:40px; font-size:16px;border-top:1px solid #ccc; text-decoration:none;}
    .my-left-bottom ul li a:hover{color:#ccc;}
    .my-left-bottom ul li .set-top{border-top:none;}
    
    .my-right{float:left; width:800px;}
    .u-right{margin-top:100px;margin-bottom:40px}
    
    </style>
    <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />

    <div class="web-page">
        <div class="my-left">
            <div class="my-left-top">
                <ul>
                    <li><img class="headimg" id="headImg" runat="server" /></li>
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
                <li><a href="MyOrder.aspx" class="set-top">个人设置</a></li>
                <li><a href="MyOrder.aspx">我的发布</a></li>
                <li><a href="MyOrder.aspx">我的购物车</a></li>
                <li><a href="MyOrder.aspx">我的订单</a></li>
                </ul>
            </div>
        </div>
        <div class="my-right">
            <div class="u-right">

            <div class="orderTitle">
                <a href="MyInfo.aspx">个人信息</a> 
                <a href="EditPassword.aspx">修改密码</a> 
                <a class="sel" href="HeadImg.aspx">更改头像</a>
            </div>

            <!--信息-->
            <div class="data-edit">
                <form id="form1" runat="server">
                <div>
                <ul>
                    <li> <span style=" font-family: Tahoma, Helvetica, Arial, 宋体, sans-serif; line-height:35px; font-size:14px; color:#999; font-weight:bold;">当前图像</span></li>
                    <li><div style=" width:97px; height:97px; border:solid 1px #e1e1e1; padding:3px;"><img src="/User/UserPic/u_face.jpg" width="95" height="95" runat="server" id="userImg" style="border:solid 1px #fafafa;" /></div></li>
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
