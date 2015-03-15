<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Vrecommendation.aspx.cs" Inherits="User_Vrecommendation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <myControls:WebScript ID="WebScript1" runat="server" />
    <myControls:WebStyle ID="WebStyle1" runat="server" />
    <title></title>
      <style type="text/css">
          .web-page{ height:814px;background: url(/images/user/bgm.gif) no-repeat; top:55px;}
           .Vrecommendation-body{ left:0px;right:0px;margin-left:auto; margin-right:auto; height:100%;width:325px; overflow:hidden;position:relative; top:120px;}
          .Vrecommendation-body-top{ height:95px;line-height:95px; vertical-align:middle;font-family:造字工房雅圆（非商用）常规体; font-size:36px; font-weight:bold; text-align:center;}
      .Vrecommendation-body-list{ height:60px; line-height:60px; vertical-align:middle; font-family:造字工房雅圆（非商用）常规体; font-size:12px; font-weight:bold; padding:3px; color:#000000 ;background:url("/images/register/di.png") center bottom no-repeat}
      .Vrecommendation-textarea{ position:absolute; top:340px;left:522px; height:120px;width:425px;  vertical-align:text-top;font-family:造字工房雅圆（非商用）常规体; font-size:12px; font-weight:bold; padding:3px; color:#000000 ;}
       .Vrecommendation-body-list input{ height:40px; width:250px;  line-height:40px; border:none; vertical-align:middle; background:none; }
       
      #fb{ position:absolute; display:inline-block; left:542px;top:660px; width:82px; height:35px; background:url("/images/login/OK.png") left top no-repeat;}
       #cz{ position:absolute; display:inline-block; left:742px;top:660px; width:82px; height:35px; background:url("/images/login/OK.png") left top no-repeat;}
      </style>
</head>
<body>
       <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="Vrecommendation-body">
            <div class="Vrecommendation-body-top">视&nbsp;频&nbsp;推&nbsp;荐</div>
            <div class="Vrecommendation-body-list">视频地址：<input id="RegisteruserNameTxt" type="text" /></div>
        </div>
         <div class="Vrecommendation-textarea"><span style="float:left">推荐理由：</span><textarea id="RegisterText7" cols="45" rows="15"></textarea></div>

         <a href="javascript:;" id="fb" onmouseover="this.style.backgroundImage='url(/images/login/OK_h.png)'" onmouseout="this.style.backgroundImage='url(/images/login/OK.png)'"></a>
                <a href="Register.aspx" id="cz"  onmouseover="this.style.backgroundImage='url(../images/login/ZC_h.png)'" onmouseout="this.style.backgroundImage='url(../images/login/ZC.png)'"></a>
    </div>
     <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
