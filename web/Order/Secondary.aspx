<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Secondary.aspx.cs" Inherits="Order_Secondary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <myControls:WebStyle id="WebStyle1" runat="server" />
      <myControls:WebScript id="WebScript1" runat="server" />
    <title></title>
    <style type="text/css">
        .web-page{ }
    .Secondary-imgtitle{ background:url('/images/zpjd/3.jpg') center bottom no-repeat; width:1366px; height:545px; }
    .Secondary-imgtype{ background:url('/images/zpjd/esqc.png') center bottom no-repeat; width:727px; height:65px; margin-left:320px; margin-top:60px; }
    .Secondary-context{ margin-top:30px; margin-left:300px; width:733px; height:219px;}
    .Secondary-context ul{width:733px; height:219px;}
    .Secondary-context ul li{list-style:none; float:left; padding:0px; }
    .Secondary-context .Secondary-context-li {margin-left:50px; margin-top:70px;}
    .Secondary-context .Secondary-context-li .Secondary-context-li-title{ color:#376d97; font-size:22px; font-weight:bold; margin-bottom:20px;}
    .Secondary-context-line{ margin-top:10px;}
    #fwlist a{ color:#000;}
    </style>
    <script type="text/javascript">
        var sItem = 1;
        var isadd = true;
        $(function () {
            if (isadd == true) {
                if ($(window).scrollTop() + 500 >= $(document).height() - $(window).height()) {
                    isadd = false;
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "Action/Handler.ashx?cmd=GetProducts3",
                        data: { "sItem": sItem },
                        success: function (data) {
                            if (data.flag == "true") {
                                if (data.msg != "加载完") {
                                    $("#fwlist").html($("#fwlist").html() + data.msg);
                                    isadd = true;
                                    sItem += 1;
                                }
                            } else {
                                alert(data.msg);
                            }
                        },
                        error: function (data, textStatus, errorThrown) {
                            $.messager.alert('错误', errorThrown);
                        }
                    });
                }
            }
        })
        $(window).scroll(function () {
            if (isadd == true) {
                if ($(window).scrollTop() + 500 >= $(document).height() - $(window).height()) {
                    isadd = false;
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "Action/Handler.ashx?cmd=GetProducts3",
                        data: { "sItem": sItem },
                        success: function (data) {
                            if (data.flag == "true") {
                                if (data.msg != "加载完") {
                                    $("#fwlist").html($("#fwlist").html() + data.msg);
                                    isadd = true;
                                    sItem += 1;
                                }
                            } else {
                                alert(data.msg);
                            }
                        },
                        error: function (data, textStatus, errorThrown) {
                            $.messager.alert('错误', errorThrown);
                        }
                    });
                }
            }
        })
    </script>
</head>
<body>
     <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="Secondary-imgtitle"></div>
    <div class="Secondary-imgtype"></div>
     <%--数据加载开始--%>
     <div id="fwlist">
            <%--<asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="Secondary-context">
    <ul>
    <li><img style="background:url('/images/index/index_1.jpg') center bottom no-repeat; width:332px; height:219px;" /></li>
    <li class="Secondary-context-li"><a href='Secondary_detail.aspx?pid=<%# Eval("ID") %>'>
    <span class="Secondary-context-li-title"><%# Eval("ProductName") %></span>
    <br />
    <br />
    <span>价格：￥<%#Convert.ToDecimal( Eval("Price")).ToString("f2")%>&nbsp;&nbsp;成色：<%# Eval("ProductXinJiu") %>&nbsp;&nbsp;区域：<%# Eval("ProductAddress")%></span>
    <br />
    <br />
    <span>联系人：<%# Eval("ProductMan")%>&nbsp;&nbsp;电话：<%# Eval("ProductPhone")%></span></a>
    </li>
    </ul>
     <div class="Secondary-context-line"><hr /></div>
    </div>
                </ItemTemplate>
            </asp:Repeater>--%>
        </div>
        <div style=" height:50px;"></div>

    
              <%--数据加载结束--%>
    </div>
   <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
