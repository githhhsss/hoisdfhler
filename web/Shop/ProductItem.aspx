<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductItem.aspx.cs" Inherits="Shop_ProductItem" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle id="WebStyle1" runat="server" />
    <style type="text/css">
       
       /*产品图像*/
       .web-page .sci-left{ margin-top:100px; float:left; width:750px; height:650px;position:relative;}
       .web-page .sci-left #pro_img{height:500px; width:700px; position:absolute; right:25px; top:0px;}
       
       /*产品信息*/
       .web-page .sci-right{margin-top:150px; float:left; width:616px; height:600px;position:relative;}
       .web-page .sci-right .sci_divA{ display:block;line-height:39px; float:left; text-align:center; width:174px; height:39px; background:url('/images/shop/btnbj.png') center bottom no-repeat;}
       .web-page .sci-right .sci_divB{ display:block;line-height:39px; float:left; margin-left:15px;text-align:center; width:174px; height:39px; background:url('/images/shop/btnbj.png') center bottom no-repeat;}
       .web-page .sci-right a{font-family:造字工房雅圆（非商用）常规体; font-size:20px; font-weight:bold; color:White;}
       .web-page .sci-right #sci_name{ font-family:造字工房雅圆（非商用）常规体; font-size:37px;}
       .web-page .sci-right #sci_say{font-family:造字工房雅圆（非商用）常规体; font-size:12px;}
       .web-page .sci-right #sci_price{font-family:造字工房雅圆（非商用）常规体; font-size:37px; line-height:65px;}
       .web-page .sci-right #sci_stock{font-family:造字工房雅圆（非商用）常规体; font-size:37px; line-height:65px;}
       .web-page .sci-item .sci-right ul li{list-style:none;padding:0; margin-bottom:20px;}
       .web-page .sci-item .sci-right #buy{  position:absolute; bottom:130px;}
       
       /*详细/评价按钮*/
       .web-page .sci-tab{ position:absolute; height:55px; width:100%;top:653px;}
       .web-page .sci-tab ul{ width:100%;}
       .web-page .sci-tab ul li{list-style:none; float:left;padding:0; margin-left:216px;}
       .web-page .sci-tab #xq a{ font-family:造字工房雅圆（非商用）常规体; font-size:24px; color:#1ea78d;}
       .web-page .sci-tab #pj a{ font-family:造字工房雅圆（非商用）常规体; font-size:24px; color:#848484;}
       
       /*详细*/

       /*评价*/
       .sci-centent-Comment{ display:none;}
       
       .CommentMan{ text-indent:50px;line-height:40px;}
       .CommentContent{ margin:0 100px; line-height:40px; font-size:14px;}
       
    </style>
     <myControls:WebScript id="WebScript1" runat="server" />
</head>
<body>
    <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
        <div class="sci-item">
            <div class="sci-left">
                <img id="pro_img" runat="server" />
            </div>
            <div class="sci-right">
                <ul>
                    <li><span id="sci_name" runat="server"></span></li>
                    <li><span id="sci_say" runat="server">加入购物车后可以选择购买数量</span></li>
                    <li><span id="sci_price" runat="server"></span></li>
                    <li><span id="sci_stock" runat="server"></span></li>
                    <li id="buy"><a class="sci_divA" href="javascript:;">立即购买</a><a class="sci_divB" href="javascript:;">加入购物车</a></li>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
        <div class="sci-tab">
            <ul>
                <li id="xq"><a href="javascript:;">商品详情</a></li>
                <li id="pj"><a href="javascript:;">累计评价<span id="scipnum" runat="server"></span></a></li>
                <li></li>
            </ul>
            <br />
            <br />
            <br />
            <hr />
        </div>
        <div class="sci-centent">
            <div class="sci-centent_1">
                <div id="sci_Description" runat="server"></div>
            </div>

            <div class="sci-centent-Comment">
                <div id="sci-Comment">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="CommentMan"><span><%# Eval("UserName")%>：</span></div>
                            <div class="CommentContent"><%# Eval("Content")%></div>
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div style=" height:100px; width:100%;"></div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
    <script type="text/javascript">
        $(function () {
            $("#xq").click(function () {
                $(".sci-centent_1").show();
                $(".sci-centent-Comment").hide();
            });
            $("#pj").click(function () {
                $(".sci-centent_1").hide();
                $(".sci-centent-Comment").show();
            });

            /*加入购物车*/
            $(".sci_divB").click(function () {
                var itemid = yscom.getParams("itemid");
                if (itemid > 0) {
                    yscom.ajax({
                        url: "Action/Handler.ashx?cmd=CarAdd",
                        data: {
                            "itemid": itemid
                        },
                        success: function (data) {
                            if (data.flag == "true") {
                                alert(data.msg);
                            } else {
                                alert(data.msg);
                            }
                        }
                    });
                }
                else {
                    alert("找不到产品信息");
                }
            });
            $(".sci_divA").click(function () {
                var itemid = yscom.getParams("itemid");
                if (itemid > 0) {
                    yscom.ajax({
                        url: "Action/Handler.ashx?cmd=CarAdd",
                        data: {
                            "itemid": itemid
                        },
                        success: function (data) {
                            if (data.flag == "true") {
                                window.location = 'MyCar.aspx';
                            } else {
                                alert(data.msg);
                            }
                        }
                    });
                }
                else {
                    alert("找不到产品信息");
                }
            });
        })
    </script>
</body>
</html>
