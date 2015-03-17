<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoodsReceipt.aspx.cs" Inherits="User_GoodsReceipt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <myControls:WebScript ID="WebScript1" runat="server" />
    <myControls:WebStyle ID="WebStyle1" runat="server" />
    <style type="text/css">
        a{ color:Red;}
        .web-page{ height:926px; padding-bottom:50px;}
        .zx-title{ height:200px;background:url('/images/user/shrxx.png') center bottom no-repeat}
        .zx-body{ left:0px;right:0px;margin-left:auto; margin-right:auto;width:662px; position:relative; margin-top:50px; }
        
        .sci_divA{ margin-left:840px; margin-top:100px ;color:#FFF ;display:block;line-height:39px; float:left; text-align:center; width:174px; height:39px; background:url('/images/shop/btnbj.png') center bottom no-repeat;}
        
        .zx-body ul li{ margin-bottom:30px; list-style:none;}
        .zx-body ul li .sh-title{  display:inline-block ;width:80px;}
        .zx-body ul li .sh-value input{ -moz-border-radius: 5px;/* Gecko browsers */ 
                      -webkit-border-radius: 5px;/* Webkit browsers */
                      border-radius:5px;/* W3C syntax */
                       border:1px solid #CCC; height:30px; line-height:30px; width:210px;}
    </style>
    <title></title>
</head>
<body>

     <myControls:WebTop id="WebTop1" runat="server" />
     <div class="web-page">
        <div class="zx-title"></div>
        <div class="zx-body">
            <ul>
                <li><span class="sh-title">收 货 人：</span><span class="sh-value"><input id="shText1" runat="server" type="text" /></span></li>
                <li><span class="sh-title">联系电话：</span><span class="sh-value"><input id="shText2" runat="server" type="text" /></span></li>
                <li><span class="sh-title">所在城市：</span><span class="sh-value"><input id="shText3" runat="server" type="text" /></span></li>
                <li><span class="sh-title">详细地址：</span><span class="sh-value"><input id="shText4" runat="server" style="width:580px;" type="text" /></span></li>
                <li><span class="sh-title">邮政编码：</span><span class="sh-value"><input id="shText5" runat="server" type="text" /></span></li>
            </ul>
        </div><div class="btn"> <a class="sci_divA" href="javascript:;">提交</a> </div>
     </div>
     <mycontrols:webFoot id="WebFoot1" runat="server"/>
     <script type="text/javascript">
         $(function () {
             $(".sci_divA").click(function () {
                 if ($("#shText1").val() == "") {
                     alert("收货人不能为空");
                     return;
                 }
                 if ($("#shText2").val() == "") {
                     alert("联系电话不能为空");
                     return;
                 }
                 if ($("#shText4").val() == "") {
                     alert("详细地址不能为空");
                     return;
                 }
                 if (confirm("确定收货地址无误？")) {
                     yscom.ajax({
                         url: "Action/Handler.ashx?cmd=AddressUpdate",
                         data: {
                             "shText1": $("#shText1").val(),
                             "shText2": $("#shText2").val(),
                             "shText3": $("#shText3").val(),
                             "shText4": $("#shText4").val(),
                             "shText5": $("#shText5").val()
                     },
                     success: function (data) {
                         if (data.flag == "true") {
                             alert(data.msg);
                             window.location = 'Default.aspx';
                         } else {
                             alert(data.msg);
                         }
                     }
                 });
             }
         });
     })
     </script>
</body>
</html>
