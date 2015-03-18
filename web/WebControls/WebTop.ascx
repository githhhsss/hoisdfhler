<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebTop.ascx.cs" Inherits="WebControls_WebTop" %>
<div class="web-top" id="web-top">
    <div class="web-top-left">
        <a href="/"><img src="<%= MyPath %>Images/web/logo.png" /></a></div>
    <div class="web-top-jgx">
        <img src="<%= MyPath %>Images/web/top_meun_1.png" /></div>
    <div class="web-top-center">
        <ul class="web-top-center-ul">
            <li><a href="../Consultation/Default.aspx"><img src="<%= MyPath %>Images/web/top_meun_zx.png" /></a></li>
            <li><a href="#"><img src="<%= MyPath %>Images/web/top_meun_pd.png" /></a></li>
            <li><a href="<%= MyPath %>Shop/Default.aspx"><img src="<%= MyPath %>Images/web/top_meun_sc.png" /></a></li>
            <li><a href="<%= MyPath %>Recruitment/Default.aspx"><img src="<%= MyPath %>Images/web/top_meun_yszp.png" /></a></li>
        </ul>
    </div>
    <div class="web-top-right">
        <!-- 未登陆状态 -->
        <ul class="web-top-center-ul" id="no_login" runat="server">
            <li><a href="<%= MyPath %>User/Login.aspx"><img src="<%= MyPath %>Images/web/top_meun_dl.png" /></a></li>
            <li><div><img src="<%= MyPath %>Images/web/top_meun_2.png" /></div></li>
            <li><a href="<%= MyPath %>User/Register.aspx"><img src="<%= MyPath %>Images/web/top_meun_zc.png" /></a></li>
            <li><div class="web-top-right-ss">
                <input id="Text1" type="text" /></div></li>
        </ul>
        <!-- 登陆后状态 -->
        <ul class="web-top-center-ul"  id="is_login" runat="server">
            <li><a href="<%= MyPath %>User/Login.aspx"><span class="span" id="login_User" runat="server"></span></a></li>
            <li><div><img src="<%= MyPath %>Images/web/top_meun_2.png" /></div></li>
            <li><a href="<%= MyPath %>User/LoginOut.aspx"><span class="span" id="login_Out" runat="server"></span></a></li>
            <li><div class="web-top-right-ss">
                <input id="Text2" type="text" /></div></li>
        </ul>
    </div>
</div>
