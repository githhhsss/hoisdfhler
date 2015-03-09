<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="User_Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
       .web-page{ height:726px;}
       .register-body{ left:0px;right:0px;margin-left:auto; margin-right:auto; height:100%;width:325px; overflow:hidden;position:relative; }
       .register-body-top{ height:190px;background:url("/images/register/yhzc.png") center 100px no-repeat}
       .register-body-list{ height:60px; line-height:60px; vertical-align:middle; font-family:造字工房雅圆（非商用）常规体; font-size:12px; font-weight:bold; padding:3px; color:#000000 ;background:url("/images/register/di.png") center bottom no-repeat}
       .register-body-list input{ height:40px; width:250px;  line-height:40px; border:none; vertical-align:middle; background:none; }
       .register-body-ty{ text-align:center; vertical-align:middle; height:13px; margin-top:35px; line-height:13px;}
       .register-body-ty input{margin:0; padding:0;vertical-align:middle;height:13px; line-height: 13px;  }
       .register-body-ty  span{ margin:0; padding:0; height:13px; line-height:13px;font-family:造字工房雅圆（非商用）常规体; font-size:12px; font-weight:bold;}
       .register-body-bottom{ margin-top:20px; text-align:center; vertical-align:middle; font-size:14px; color:#a3a3a3;font-family:造字工房雅圆（非商用）常规体;font-weight:bold; }
       .register-body-bottom .aa{ height:35px; width:107px;vertical-align:middle; display:inline-block;background:url("/images/register/zc.png") center center no-repeat }
       .register-body-bottom .a{ color:#1ea78d; text-decoration:none; }
       .register-body-bottom .aa:hover{}
    </style>
     <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
        <div class="register-body">
            <div class="register-body-top"></div>
            <div class="register-body-list">用&nbsp;户&nbsp;名：<input id="Text1" type="text" /></div>
            <div class="register-body-list">密&nbsp;&nbsp;&nbsp;&nbsp;码：<input id="Text2" type="text" /></div>
            <div class="register-body-list">确认密码：<input id="Text3" type="text" /></div>
            <div class="register-body-list">电子邮件：<input id="Text4" type="text" /></div>
            <div class="register-body-list">密码问题：<input id="Text5" type="text" /></div>
            <div class="register-body-list">密码答案：<input id="Text6" type="text" /></div>
            <div class="register-body-ty">
                <input id="Checkbox1" type="checkbox" /> <span>我已同意并阅读，Mmovie服务使用协议</span></div>
            <div class="register-body-bottom"><a href="javascript:;" class="aa"></a> 已有账号，点此<a href="Login.aspx" class="a">登陆</a></div>
        </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
    <script type="text/javascript">
        $(function () {
            $(".aa").click(function () {
                yscom.ajax({
                    url: "Action/Handler.ashx?cmd=RegisterUser",
                    data: {
                        
                    },
                    success: function (data) {
                        if (data.flag == "true") {
                            yscom.messager('成功', data.msg);
                        } else {
                            yscom.messager('失败', data.msg);
                        }
                    }
                });
            });
        })
    </script>
</body>
</html>
