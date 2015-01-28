<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindPassword.aspx.cs" Inherits="User_FindPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
       .web-page{ height:726px;}
       .register-body{ left:0px;right:0px;margin-left:auto; margin-right:auto; height:100%;width:325px; overflow:hidden;position:relative; }
       .register-body-top{ height:250px;background:url("/images/login/zhmm.png") center bottom no-repeat}
       .register-body-list{ height:60px; line-height:60px; vertical-align:middle; font-family:造字工房雅圆（非商用）常规体; font-size:12px; font-weight:bold; padding:3px; color:#000000 ;background:url("/images/register/di.png") center bottom no-repeat}
       .register-body-list input{ height:40px; width:250px;  line-height:40px; border:none; vertical-align:middle; background:none; }
       .text{ text-align:center;font-family:造字工房雅圆（非商用）常规体; font-size:12px; font-weight:bold;  margin-top:30px;}
       .register-body-bottom{ margin-top:20px; text-align:center; vertical-align:middle; font-size:14px; color:#a3a3a3;font-family:造字工房雅圆（非商用）常规体;font-weight:bold; }
       .register-body-bottom a{ height:35px; width:107px;vertical-align:middle; display:inline-block;background:url("/images/login/zh.png") center center no-repeat }
       .register-body-bottom a:hover{}
    </style>
     <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
        <div class="register-body">
            <div class="register-body-top"></div>
            <div class="text">密码问题</div>
            <div class="register-body-list">回答问题：<input id="Text6" type="text" /></div>
            <div class="text">答案错误请重新输入</div>
            <div class="register-body-bottom"><a href="#"></a></div>
            
        </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
