<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Vedio_detail.aspx.cs" Inherits="Vedio_Vedio_detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <myControls:WebStyle ID="WebStyle1" runat="server" />
    <myControls:WebScript ID="WebScript1" runat="server" />
    <title></title>
    <style type="text/css">
        .web-page
        {
            height: 1800px;
            background-color: #d4d4d4;
            position: relative;
        }
        .Orders_Detail-imgtitle
        {
            top: 70px;
            left: 450px;
            height: 103px;
            width: 450px;
            position: absolute;
            background: url('/images/shop/bj_title.png') center bottom no-repeat;
            z-index: 1000;
            line-height: 103px;
            text-align: center;
            font-size: 42px;
            color: White;
            font-weight: bold;
        }
        .Orders_Detail-whitebox
        {
            background-color: White;
            width: 1196px;
            position: absolute;
            top: 91px;
            left: 85px;
            height: 1500px;
        }
        .Orders_Detail-name
        {
            width: 100%;
            font-size: 37px;
            font-family: 造字工房雅圆（非商用）常规体;
            font-weight: bold;
            margin: 186px 0 0 230px;
        }
        .Orders_Detail-name-detailed
        {
            margin: 86px 0 0 230px;
        }
        .Orders_Detail-name-detailed ul li
        {
            list-style: none;
            padding: 0 0 0 0;
            margin-bottom: 38px;
            font-size: 37px;
        }
        .Orders_Detail-name-detailed .Orders_Detail-name-detailed-leftspan
        {
            color: #aeaeae;
        }
        .Orders_Detail-name-detailed .Orders_Detail-name-detailed-rightspan
        {
            color: Black;
        }
        .Orders_Detail-xq
        {
            margin-top: 100px;
            margin-left: 110px;
            margin-right: 110px;
            font-family: 造字工房雅圆（非商用）常规体;
            color: #4fb3a0;
            font-size: 37px;
        }
        .Orders_Detail-line
        {
            margin-top: 15px;
            margin-left: 100px;
            margin-right: 100px;
        }
        .Orders_Detail-context
        {
            margin-top: 150px;
            margin-left: 110px;
            margin-right: 110px;
        }
        .Vedio
        {
            margin-top: 10px;
            margin-left: 110px;
            margin-right: 110px;
             text-align:center;
        }
        .ms
        {
            font-family: 造字工房雅圆（非商用）常规体;
            font-size: 27px;
        }
        .msdiv
        {
             margin-left:110px;
             margin-top:70px;
        }
    </style>
</head>
<body onload="scroll()">
    <myControls:WebTop ID="WebTop1" runat="server" />
    <div class="web-page">
        <div class="Orders_Detail-imgtitle" id="zptxt1" runat="server">
        </div>
        <div class="Orders_Detail-whitebox">
            <div class="Orders_Detail-context" id="zptxt7" runat="server" style="text-align: center;
                line-height: 50px; font-size: 38px; font-weight: bold;">
            </div>
            <div class="Vedio">
                <div id="fwlist">
                </div>
            </div>
            <div class="msdiv">
             <span class="ms" id="ms" runat="server"></span>
             </div>
        </div>
    </div>
    <script type="text/javascript">
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = location.search.substr(1).match(reg);
            if (r != null) return unescape(decodeURI(r[2])); return null;
        }
        var sItem = 1;
        var isadd = true;
        function scroll() {
            if (isadd == true) {

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "Action/Handler.ashx?cmd=GetVedio",
                    data: {
                        "sItem": sItem,
                        "item": getQueryString("item")
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
    </script>
    <myControls:WebFoot ID="WebFoot1" runat="server" />
</body>
</html>
