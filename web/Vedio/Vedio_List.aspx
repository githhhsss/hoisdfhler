<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Vedio_List.aspx.cs" Inherits="Vedio_Vedio_List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <myControls:WebStyle ID="WebStyle1" runat="server" />
    <myControls:WebScript ID="WebScript1" runat="server" />
    <title></title>
    <style type="text/css">
        .web-page
        {
        }
        .Photography-imgtype
        {
            background: url('/images/Vedio/line.png') center bottom no-repeat;
            width: 727px;
            height: 65px;
            margin-left: 320px;
            margin-top: 60px;
            font-family: 造字工房雅圆（非商用）常规体;
            font-size: 40px;
            color: #0eb493;
            text-align: center;
            font-weight:bold;
        }
        .Photography-context
        {
            margin-top: 30px;
            margin-left: 300px;
            width: 733px;
            height: 219px;
        }
        .Photography-context ul
        {
            width: 733px;
            height: 219px;
        }
        .Photography-context ul li
        {
            list-style: none;
            float: left;
            padding: 0px;
        }
        .Photography-context .Photography-context-li
        {
            margin-left: 50px;
            margin-top: 70px;
        }
        .Photography-context .Photography-context-li .Photography-context-li-title
        {
            color: #376d97;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .Photography-context-line
        {
            margin-top: 10px;
        }
        #fwlist a
        {
            color: #000;
        }
    </style>
    <script type="text/javascript">
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = location.search.substr(1).match(reg);
            if (r != null) return unescape(decodeURI(r[2])); return null;
        }
        var sItem = 1;
        var isadd = true;
        $(function () {
            setInterval(scroll, 100);
            $("#fwlist").val(decodeURI(yscom.getParams("searchPro")));
        })
        function scroll() {
            if (isadd == true) {
                if ($(window).scrollTop() + 500 >= $(document).height() - $(window).height()) {
                    isadd = false;
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "Action/Handler.ashx?cmd=GetProducts2",
                        data: {
                            "sItem": sItem,
                            "stock": getQueryString("itemid")
                        },
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
        }
        $(window).scroll(function () {
            if (isadd == true) {
                if ($(window).scrollTop() + 500 >= $(document).height() - $(window).height()) {
                    isadd = false;
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "Action/Handler.ashx?cmd=GetProducts2",
                        data: {
                            "sItem": sItem,
                            "stock": getQueryString("itemid")
                        },
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
    <myControls:WebTop ID="WebTop1" runat="server" />
    <div class="web-page">
        
        <div class="Photography-imgtype" id="divtitle" runat="server">
        
        </div>
        <%--数据加载开始--%>
        <div id="fwlist">
            <%--<asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="Photography-context">
                        <ul>
                            <li>
                                <img style="
                                    width: 332px; height: 219px;" src='/ProductImg/<%# Eval("ProductAddress")%>' /></li>
                            <li class="Photography-context-li"><a href='Photography_detail.aspx?pid=<%# Eval("ID")%>'><span class="Photography-context-li-title"><%# Eval("ProductName")%></span>
                                <br />
                                <br />
                                <span>价格：￥<%# Convert.ToDecimal( Eval("Price")).ToString("f2")%>&nbsp;&nbsp;联系人：<%# Eval("ProductMan")%>&nbsp;&nbsp;电话：<%# Eval("ProductPhone")%></span></a> </li>
                        </ul>
                        <div class="Photography-context-line">
                            <hr />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>--%>
        </div>
        <div style="height: 50px;">
        </div>
        <%--数据加载结束--%>
    </div>
    <myControls:WebFoot ID="WebFoot1" runat="server" />
</body>
</html>
