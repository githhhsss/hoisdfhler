<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="Recruitment_detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<myControls:WebStyle id="WebStyle1" runat="server" />
      <myControls:WebScript id="WebScript1" runat="server" />
      <style type="text/css">
     .web-page{ background-color:#d3d3d3; height:1000px; position:relative;margin:0px auto;padding:0px;}
     .web-page .detail-top{position:absolute; height:103px;top:70px;left:220px; width:450px;background:url('/images/shop/bj_title.png') center bottom no-repeat; z-index:1000; line-height:103px; text-align:center; font-size:42px; color:White; font-weight:bold;}
     .web-page .detail-left{position:absolute;background-color:White; height:850px;top:91px;left:30px; width:872px;}
     .web-page .detail-left-context{ width:100%; height:172px; margin-top:115px; margin-left:42px;}
     .web-page .detail-left ul{}
     .web-page .detail-left ul li{list-style:none;padding:0px; margin-top:35px;}
     .web-page .detail-left .detail-left-left-span{ font-size:16px; font-weight:bold;}
     .web-page .detail-left .detail-left-right-span{ font-size:22px; font-weight:bold;}
     .web-page .detail-left .detail-left-time{ margin-left:650px;}
     .web-page .detail-left .detail-left-description{ margin-top:60px; width:100%;}
     .web-page .detail-left .detail-left-title{width:100%; margin:0 0 0 42px; padding:0 0 0 0; font-size:16px; font-weight:bold;}
     .web-page .detail-left .detail-left-description-context{font-size:16px;padding:0 0 0 0;margin:40px 0 0 42px; line-height:32px; }
     .web-page .detail-right{position:absolute; background-color:#e3e3e5; height:700px; width:405px; top:91px; left:920px;}
     .web-page .detail-right .detail-right-title{ color:#6686b7; font-size:23px; margin:20px 0 0 25px;font-weight:bold;}
     .web-page .detail-right .detail-right-context{ margin:37px 25px 0 25px;font-weight:bold;font-size:16px;line-height:32px;}
      </style>
    <title></title>
</head>
<body>
     <myControls:WebTop id="WebTop1" runat="server" />
    <div class="web-page">
    <div class="detail-top">影视摄影师</div>
    <div class="detail-left">
    <div class="detail-left-context">
        <ul>
    <li><span class="detail-left-left-span">招聘公司：</span><span class="detail-left-right-span">广州九著电子科技有限公司</span></li>
    <li><span class="detail-left-left-span">工作地点：</span><span class="detail-left-right-span">天河区珠江新城华明路13号华普广场懂1301</span></li>
    <li><span class="detail-left-left-span">薪资范围：</span><span class="detail-left-right-span">3K-4K</span></li>
    <li class="detail-left-time"><span class="detail-left-left-span">2014-10-31 11:38</span></li>
    </ul>
    </div>
    <div class="detail-left-description">
    <div class="detail-left-title">职业描述：</div>
    <div class="detail-left-description-context">
    1、负责拍摄公司相关产品的视频、照片
    </br>
    2、熟悉摄像器材，能适应各种拍摄条件，可独立完成拍摄任务。
    </div>
    </div>
      <div class="detail-left-description">
    <div class="detail-left-title">职业要求：</div>
    <div class="detail-left-description-context">
    1、热爱摄影
    </br>
    2、有较强的美术功底。
    </div>
    </div>
    </div>
    <div class="detail-right">
    <div class="detail-right-title">广州九著电子科技公司</div>
    <div class="detail-right-context">
    WENPOD稳拍，是广州九著电子科技有限公司自主研发的全系列智能产品，采用全球独创的电子增稳专利技术，为移动拍摄维持稳定，让画面始终保持水平，适配主流智能手机、卡片机、微单、数码单反、家用DV、GoPro运动相机等，可应用于户外活动、旅行、聚会、儿童成长、婚礼现场、新闻采访、商业广告、微电影等需要移动拍摄增稳的各类场合。
公司研发的“智能稳拍”系列智能稳定产品，拥有美国和中国市场多项发明专利，并获得2013东京CEATEC数码影像大奖。
    </div>
    </div>
    </div>
    <mycontrols:webFoot id="WebFoot1" runat="server"/>
</body>
</html>
