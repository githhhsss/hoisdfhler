<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Recruitment_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <myControls:WebStyle id="WebStyle1" runat="server" />
      <myControls:WebScript id="WebScript1" runat="server" />
    <title>影视圈求职</title>
    <style type="text/css">
    .web-page{  margin-top:52px;}
    .Recruitment-imgtitle{ width:100%; height:515px; background:url('/images/Recruitment/title.png') center bottom no-repeat; }
    .Recruitment-wordtitle{ width:100%; height:39px; margin-top:38px; text-align:center; color:#0eb493; font-family:造字工房雅圆（非商用）常规体; font-size:38px; font-weight:bold;}
    .Recruitment-img1{ width:100%; height:16px; text-align:center;}
    .Recruitment-img1 img{  height:14px; width:194px;}
    .Recruitment-SO{ height:20px; margin-left:373px; margin-top:65px;}
    .Recruitment-SO ul{font-family:造字工房雅圆（非商用）常规体; height:43px; width:700px; }
    .Recruitment-SO ul li{list-style:none; float:left; padding:0px;}
    .Recruitment-SO-ul-li1{ font-size:16px; font-weight:bold; margin-right:50px; margin-top:13px;}
    .Recruitment-SO-ul-input{ border-style: none;border-color: inherit;border-width: 0px;width:556px; height:43px; color:#bbbbc0;font-weight:bold; background:url('/images/zpjd/ss.png') center bottom no-repeat;}
    
    .Recruitment-city{ height:20px; margin-left:373px; margin-top:65px;}
    .Recruitment-city ul{font-family:造字工房雅圆（非商用）常规体; height:20px; }
    .Recruitment-city ul li{list-style:none; float:left; padding:0px;font-size:16px; font-weight:bold; margin-right:30px;}
   .Recruitment-city .Recruitment-city-ul-li1{  margin-right:100px;}
   .Recruitment-line{ margin-top:58px; margin-left:243px; margin-right:243px; width:871px; height:2px;}
   .Recruitment-line hr{ height:2px; width:871px;}
   .Recruitment-title{ margin-left:343px;margin-top:33px; height:38px;}
   .Recruitment-title ul{height:25px;}
   .Recruitment-title ul li{list-style:none; float:left; padding:0px;font-family:造字工房雅圆（非商用）常规体;height:25px;}
  .Recruitment-title .Recruitment-title-name{ color:#376d97; font-size:22px; font-weight:bold; }
  .Recruitment-title .Recruitment-title-city{ font-size:16px; font-weight:bold; margin-top:5px; }
  .Recruitment-title .Recruitment-title-Salary{ font-size:16px; margin-top:5px;  }
  .Recruitment-context{ margin-left:343px;margin-top:20px; height:165px;}
  .Recruitment-context ul{height:25px;}
  .Recruitment-context ul li{list-style:none; padding:0px;font-family:造字工房雅圆（非商用）常规体;height:25px;}
  .Recruitment-context .Recruitment-context-time{ margin-top:10px;}
  #xllist a{ color:#000;}
  .diqa{ color:#000;}
  .active{ color:Red;}
    </style>
    <script type="text/javascript">
        var sItem = 1;
        var isadd = true;
        var rel = "";
        $(window).scroll(function () {
            queryData();
        })

        function SearchPro() {
            $("#xllist").html("");
            sItem = 1;
            isadd = true;
            queryData();
        }
        $(function () {
            queryData();
            $(".diqa").click(function () {
                $(".diqa").removeClass("active");
                $(this).addClass("active");
                rel = $(this).attr("rel");
                // $("#scText1").val($(this).attr("rel"));
                SearchPro();
            });
        })

        function queryData() {
            if (isadd == true) {
                if ($(window).scrollTop() + 500 >= $(document).height() - $(window).height()) {
                    isadd = false;
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "Action/Handler.ashx?cmd=GetProducts",
                        data: {
                            "sItem": sItem,
                            "searchPro": $("#scText1").val() == "输入职业关键词,如：摄影师" ? "" : $("#scText1").val(),
                            "rel": rel
                        },
                        success: function (data) {
                            if (data.flag == "true") {
                                if (data.msg != "加载完") {
                                    $("#xllist").html($("#xllist").html() + data.msg);
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

    </script>
</head>
<body>
 <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="Recruitment-imgtitle"></div>
    <div class="Recruitment-wordtitle">影视圈招聘</div>
    <div class="Recruitment-img1"><img src="../Images/Recruitment/x.png"  /></div>
    <div class="Recruitment-SO">
    <ul>
    <li class="Recruitment-SO-ul-li1">关键词|</li>
    <li><input id="scText1" class="Recruitment-SO-ul-input" onclick="javascript:this.value=(this.value=='输入职业关键词,如：摄影师'?'':this.value);" 
            onblur="javascript:this.value=(this.value==''?'输入职业关键词,如：摄影师':this.value);" 
            type="text" value="输入职业关键词,如：摄影师" onkeydown='javascript:if(event.keyCode==13) SearchPro($("#scText1").val())' /></li>
    </ul>
    </div>
    <div class="Recruitment-city">
    <ul>
    <li class="Recruitment-city-ul-li1">地区:</li>
    <li><a class="diqa active" rel="" href="javascript:;">全部</a></li>
    <li><a class="diqa" rel="北京" href="javascript:;">北京</a></li>
    <li><a class="diqa" rel="上海" href="javascript:;">上海</a></li>
    <li><a class="diqa" rel="广州" href="javascript:;">广州</a></li>
    <li><a class="diqa" rel="深圳" href="javascript:;">深圳</a></li>
    <li><a class="diqa" rel="其他" href="javascript:;">其他</a></li>
    </ul>
    
    </div>
    <div class="Recruitment-line"><hr /></div>
    <div id="xllist">
        
    
        <%--<asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
            <a href='detail.aspx?pid=<%# Eval("ID")%>'>
                <div class="Recruitment-title">
                    <ul>
                        <li class="Recruitment-title-name"><%# Eval("ProductName")%></li>
                        <li class="Recruitment-title-city">（<%# Eval("ProductXinJiu")%>）</li>
                        <li class="Recruitment-title-Salary">月薪<%# Eval("PriceRange")%></li>
                    </ul>
                </div>
                <div class="Recruitment-context">
                    <ul>
                        <li>发布机构：<%# Eval("ProductMan")%>&nbsp;&nbsp;&nbsp;</li>
                        <li>公司地址：<%# Eval("ProductAddress")%></li>
                        <li class="Recruitment-context-time"><%# Convert.ToDateTime( Eval("InputTime")).ToString("yyyy-MM-dd HH:mm")%></li>
                    </ul>
                </div></a>
            </ItemTemplate>
        </asp:Repeater>--%>
        </div>
    </div>

        <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
