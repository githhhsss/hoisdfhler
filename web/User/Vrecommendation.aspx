﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Vrecommendation.aspx.cs" Inherits="User_Vrecommendation" %>

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
        .equipment-upload1{ height:40px; width:250px;  position:absolute;  left:542px;top:600px;}
      #fb{ position:absolute; display:inline-block; left:542px;top:660px; width:70px; height:35px; text-align:center; line-height:35px ;background:url("/images/zpjd/btnbj.png") center center no-repeat;background-size:cover;}
       #cz{ position:absolute; display:inline-block; left:742px;top:660px; width:70px; height:35px;  text-align:center; line-height:35px ;background:url("/images/zpjd/btnbj.png") center center no-repeat;background-size:cover;}
     
      </style>
</head>
<body>
<form runat="server">
       <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="Vrecommendation-body">
            <div class="Vrecommendation-body-top">视&nbsp;频&nbsp;推&nbsp;荐</div>
            <div class="Vrecommendation-body-list">视频名称：<input id="Textname" type="text" runat="server" /></div>
            <div class="Vrecommendation-body-list">视频地址：<input id="RegisteruserNameTxt" type="text" runat="server" /></div>
        </div>
         <div class="Vrecommendation-textarea"><span style="float:left">推荐理由：</span><textarea id="RegisterText7" runat="server" cols="45" rows="15"></textarea></div>

                  <div class="equipment-upload1">图片：<asp:FileUpload ID="FileUpload1" runat="server" /></div>
         <a href="javascript:;" id="fb" >确认发布</a>
         <a href="javascript:;" id="cz" >重  置</a>
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click"  style=" display:none;"/>
        <asp:Button ID="Button2" runat="server" Text="Button" onclick="Button2_Click" style=" display:none;"/>
    </div> 
     <mycontrols:webFoot id="WebFoot1" runat="server"/>
     <script type="text/javascript">
         $(function () {
             $("#fb").click(function () {
                 var itemid = yscom.getParams("itemid");
                 if (itemid <= 0) {
                     if (confirm("确定要添加信息吗？")) {
                         //                         yscom.ajax({
                         //                             url: "Action/Handler.ashx?cmd=AddProduct2",
                         //                             data: {
                         //                                 "txt1": $("#RegisteruserNameTxt").val(),
                         //                                 "txt2": $("#Registerpassword").val(),
                         //                                 "txt3": $("#Registerpassword2").val(),
                         //                                 "txt4": $("#RegisterText4").val(),
                         //                                 "txt5": $("#RegisterText5").val(),
                         //                                 "txt6": $("#RegisterText6").val(),
                         //                                 "txt7": $("#RegisterText7").val()
                         //                             },
                         //                             success: function (data) {
                         //                                 if (data.flag == "true") {
                         //                                     alert(data.msg);
                         //                                 } else {
                         //                                     alert(data.msg);
                         //                                 }
                         //                             }
                         //                         });
                         $("#Button1").click();
                     };
                 }
                 else {
                     if (confirm("确定要修改信息吗？")) {
                         //                         yscom.ajax({
                         //                             url: "Action/Handler.ashx?cmd=EditProduct2",
                         //                             data: {
                         //                                 "itemid":itemid,
                         //                                 "txt1": $("#RegisteruserNameTxt").val(),
                         //                                 "txt2": $("#Registerpassword").val(),
                         //                                 "txt3": $("#Registerpassword2").val(),
                         //                                 "txt4": $("#RegisterText4").val(),
                         //                                 "txt5": $("#RegisterText5").val(),
                         //                                 "txt6": $("#RegisterText6").val(),
                         //                                 "txt7": $("#RegisterText7").val()
                         //                             },
                         //                             success: function (data) {
                         //                                 if (data.flag == "true") {
                         //                                     alert(data.msg);
                         //                                 } else {
                         //                                     alert(data.msg);
                         //                                 }
                         //                             }
                         //                         });
                         $("#Button2").click();
                     };
                 }
             });
             $("#cz").click(function () {
                 if (confirm("确定要重置信息吗？")) {
                     //                     $("#RegisteruserNameTxt").val("");
                     //                     $("#Registerpassword").val("");
                     //                     $("#Registerpassword2").val("");
                     //                     $("#RegisterText4").val("");
                     //                     $("#RegisterText5").val("");
                     //                     $("#RegisterText6").val("");
                     //                     $("#RegisterText7").val("");
                     window.location = 'EQ.aspx?itemid=' + yscom.getParams("itemid");
                 }
             });
         })
    </script>
    </form>
</body>
</html>
