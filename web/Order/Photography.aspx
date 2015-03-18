﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Photography.aspx.cs" Inherits="Order_Photography" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <myControls:WebStyle ID="WebStyle1" runat="server" />
    <myControls:WebScript ID="WebScript1" runat="server" />
    <title></title>
    <style type="text/css">
        .web-page
        {
            
        }
        .Photography-imgtitle
        {
            background: url('/images/zpjd/bgm.png') center bottom no-repeat;
            width: 1366px;
            height: 545px;
        }
        .Photography-imgtype
        {
            background: url('/images/zpjd/psfw.png') center bottom no-repeat;
            width: 727px;
            height: 65px;
            margin-left: 320px;
            margin-top: 60px;
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
        #fwlist a{ color:#000;}
    </style>
</head>
<body>
    <myControls:WebTop ID="WebTop1" runat="server" />
    <div class="web-page">
        <div class="Photography-imgtitle">
        </div>
        <div class="Photography-imgtype">
        </div>
        <%--数据加载开始--%>
        <div id="fwlist">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="Photography-context">
                        <ul>
                            <li>
                                <img style="background: url('/images/index/index_1.jpg') center bottom no-repeat;
                                    width: 332px; height: 219px;" /></li>
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
            </asp:Repeater>
        </div>
        <div style=" height:50px;"></div>
        <%--数据加载结束--%>
    </div>
    <myControls:WebFoot ID="WebFoot1" runat="server" />
</body>
</html>
