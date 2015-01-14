<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="User_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
       .web-page{ background:url("../Images/web/login.jpg") no-repeat; height:726px;}
       .web-page .web-login{ position:absolute; top:250px; left:870px; height:350px; width:255px;}
       .web-page .web-login .web-login-top{ background:url("../images/login/login_top.png") center center no-repeat; width:100%; height:60px;}
       .web-page .web-login .login-input-text{ font-family:@造字工房雅圆（非商用）常规体; font-size:14px; font-weight:bold; padding:20px 0px 5px;}
       .web-page .web-login .login-input{ width:100%; height:39px;}
       .web-page .web-login .login-input input{ border:none; width: 253px; height:39px; background:url("../images/login/input_bimg.png") left top no-repeat; line-height:39px; font-size:16px;}
       .web-page .web-login .login-wjmm{text-align:right;padding: 10px 5px;}
       .web-page .web-login .login-wjmm a{  font-family:@造字工房雅圆（非商用）常规体;font-weight:bold; font-size:12px; color:#ffffff; text-decoration: none;}
       .web-page .web-login .login-wjmm a:hover{text-decoration: none;text-decoration: underline}
       .web-page .web-login .login-button { width:100%; height:50px; position:relative;}
       .web-page .web-login .login-button .ok{ position:absolute; display:inline-block; left:30px;top:15px; width:82px; height:35px; background:url("../images/login/OK.png") left top no-repeat;}
       .web-page .web-login .login-button .zc{ position:absolute; display:inline-block; left:160px;top:15px; width:82px; height:35px;background:url("../images/login/ZC.png") left top no-repeat;}
    </style>
     <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
        <div class="web-login">
            <div class="web-login-top"></div>
            <div class="login-input-text">用户名</div>
            <div class="login-input">
                <input id="txt_username" type="text" />
            </div>
            <div class="login-input-text">密&nbsp;&nbsp;码</div>
            <div class="login-input">
                <input id="txt_password" type="text" />
            </div>
            <div class="login-wjmm"><a href="#">忘记密码</a></div>
            <div class="login-button">
                <a href="javascript:;" class="ok" onmouseover="this.style.backgroundImage='url(../images/login/OK_h.png)'" onmouseout="this.style.backgroundImage='url(../images/login/OK.png)'"></a>
                <a href="#" class="zc"  onmouseover="this.style.backgroundImage='url(../images/login/ZC_h.png)'" onmouseout="this.style.backgroundImage='url(../images/login/ZC.png)'"></a>
            </div>
        </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
