<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Recruitment_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <myControls:WebStyle id="WebStyle1" runat="server" />
      <myControls:WebScript id="WebScript1" runat="server" />
    <title>影视圈求职</title>
    <style type="text/css">
    .web-page{ height:1081px; margin-top:52px;}
    .Recruitment-imgtitle{ width:100%; height:515px; background:url('/images/Recruitment/title.png') center bottom no-repeat; }
    .Recruitment-wordtitle{ width:100%; height:39px; margin-top:38px; text-align:center; color:#0eb493; font-family:造字工房雅圆（非商用）常规体; font-size:38px; font-weight:bold;}
    .Recruitment-img1{ width:100%; height:16px; text-align:center;}
    .Recruitment-img1 img{ src:url('/images/Recruitment/x.png'); height:14px; width:194px;}
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
    </style>
</head>
<body>
 <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="Recruitment-imgtitle"></div>
    <div class="Recruitment-wordtitle">影视圈招聘</div>
    <div class="Recruitment-img1"><img  /></div>
    <div class="Recruitment-SO">
    <ul>
    <li class="Recruitment-SO-ul-li1">关键词|</li>
    <li><input class="Recruitment-SO-ul-input" onclick="this.value='';" onblur="this.value='输入职业关键词,如：摄影师';" type="text" value="输入职业关键词,如：摄影师" /></li>
    </ul>
    </div>
    <div class="Recruitment-city">
    <ul>
    <li class="Recruitment-city-ul-li1">地区:</li>
    <li>北京</li>
    <li>上海</li>
    <li>广州</li>
    <li>深圳</li>
    <li>其他</li>
    </ul>
    
    </div>
    <div class="Recruitment-line"><hr /></div>
        <div class="Recruitment-title">
    <ul>
    <li class="Recruitment-title-name">摄像师</li>
    <li class="Recruitment-title-city">（上海）</li>
    <li class="Recruitment-title-Salary">月薪3K-8K</li>
    </ul>
    </div>
    <div class="Recruitment-context">
    <ul>
    <li>职位吸引力：对影像工作有梦想，欢迎加入XX电影制作团队</li>
    <li>发布机构：XX电影制作&nbsp;&nbsp;&nbsp;类型：影视制作公司&nbsp;&nbsp;&nbsp;公司规模：10-50人</li>
    <li>公司地址：上海松江区三心北路900弄1560号</li>
    <li class="Recruitment-context-time">3分钟前发布</li>
    </ul>
    </div>
    </div>

        <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
