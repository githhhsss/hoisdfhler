<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <myControls:WebStyle ID="WebStyle1" runat="server" />
    <myControls:WebScript ID="WebScript1" runat="server" />

    <script type="text/javascript">
        var sItem = 1;
        var isadd = true;
        $(function () {
            setInterval(scroll, 100);
            $(".syText1").val( decodeURI(yscom.getParams("searchPro")));
        })
        function scroll() {
            if (isadd == true) {
                if ($(window).scrollTop() + 400 >= $(document).height() - $(window).height()) {
                    isadd = false;
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "Handler.ashx?cmd=UpdateIndex4",
                        data: {
                            "sItem": sItem,
                            "searchPro": $(".syText1").val()
                        },
                        success: function (data) {
                            if (data.flag == "true") {
                                if (data.msg != "加载完") {
                                    $("#ProductUl").append($("<li></li>").html(data.msg)); isadd = true;
                                    if (sItem % 3 == 0) {
                                        $("#ProductUl").append($("<li></li>").html("<div class='fgx'><div>"));
                                    }
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
    </script>
    <style type="text/css">
        /*列表内容*/
        .index-list{ width:740px; height:250px; margin-left:auto; margin-right:auto; position:relative;}
        .index-list .index-list-tottom{ position:absolute; bottom:0px; width:100%; height:30px;background: url('/Images/index/bottom_1.png') center center no-repeat;}
        #index-list-4-centent{ padding-top:150px;}
        .Recruitment-title { margin-left: 343px; margin-top: 33px; height: 38px; }
        .Recruitment-title ul {  height: 25px;}
        .Recruitment-title ul li{ list-style: none; float: left; padding: 0px; font-family: 造字工房雅圆（非商用）常规体;  height: 25px; }
        .Recruitment-title .Recruitment-title-name{ color: #376d97;font-size: 22px; font-weight: bold; }
        .Recruitment-title .Recruitment-title-city{ font-size: 16px; font-weight: bold; margin-top: 5px;}
        .Recruitment-title .Recruitment-title-Salary { font-size: 16px; margin-top: 5px; }
        .Recruitment-context { margin-left: 343px;  margin-top: 20px; height: 165px; }
        .Recruitment-context ul {  height: 25px; }
        .Recruitment-context ul li  { list-style: none;padding: 0px;  font-family: 造字工房雅圆（非商用）常规体;height: 25px; }
        .Recruitment-context .Recruitment-context-time{margin-top: 10px;}
        #ProductUl li{ list-style:none;}
        a{ color:#333;}
    </style>
</head>
<body>
    <myControls:WebTop ID="WebTop1" runat="server" />
    <div class="web-page">
        <div class="index-content">
            <%--最新资讯--%>
            <div id ="index-list-1" style = " position:relative;">
                <div id="index-list-4-centent">
                    <ul id="ProductUl"></ul>
                </div>
            </div>
        </div>
    </div>
    <myControls:WebFoot ID="WebFoot1" runat="server" />

</body>
</html>
