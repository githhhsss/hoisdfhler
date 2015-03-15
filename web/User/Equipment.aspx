<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Equipment.aspx.cs" Inherits="User_Equipment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <myControls:WebScript ID="WebScript1" runat="server" />
    <myControls:WebStyle ID="WebStyle1" runat="server" />
    <title></title>
      <style type="text/css">
          .web-page{ height:1114px;background: url(/images/user/bgm.gif) no-repeat; top:55px;}
           .equipment-body{ left:0px;right:0px;margin-left:auto; margin-right:auto; height:100%;width:325px; overflow:hidden;position:relative; top:120px;}
          .equipment-body-top{ height:95px;line-height:95px; vertical-align:middle;font-family:造字工房雅圆（非商用）常规体; font-size:36px; font-weight:bold; text-align:center;}
      .equipment-body-list{ height:60px; line-height:60px; vertical-align:middle; font-family:造字工房雅圆（非商用）常规体; font-size:12px; font-weight:bold; padding:3px; color:#000000 ;background:url("/images/register/di.png") center bottom no-repeat}
      .equipment-body-list-textarea{ height:120px; line-height:120px; vertical-align:middle; font-family:造字工房雅圆（非商用）常规体; font-size:12px; font-weight:bold; padding:3px; color:#000000 ;background:url("/images/register/di.png") center bottom no-repeat}
       .equipment-body-list input{ height:40px; width:250px;  line-height:40px; border:none; vertical-align:middle; background:none; }
       .equipment-body-list textarea{overflow:hidden; border:none; vertical-align:middle; background:none;}
      </style>

</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="equipment-body">
            <div class="equipment-body-top">二&nbsp;手&nbsp;器&nbsp;材</div>
            <div class="equipment-body-list">器材名称：<input id="RegisteruserNameTxt" type="text" /></div>
            <div class="equipment-body-list">新旧程度：<input id="Registerpassword" type="text" /></div>
            <div class="equipment-body-list">价&nbsp;&nbsp;&nbsp;&nbsp;格：<input id="Registerpassword2" type="text" /></div>
            <div class="equipment-body-list">所在城市：<input id="RegisterText4" type="text" /></div>
            <div class="equipment-body-list">联&nbsp;系&nbsp;人：<input id="RegisterText5" type="text" /></div>
            <div class="equipment-body-list">联系电话：<input id="RegisterText6" type="text" /></div>
           <div class="equipment-body-list-textarea">详细描述：<textarea id="RegisterText7" rows="15" cols="40"></textarea></div>
        </div>
    </div>
     <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
