﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;
using YS_WEB.Model;
using YS_WEB.BLL;
using Maticsoft.DBUtility;

public partial class User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //如果未登陆，转到登陆页
        if (string.IsNullOrEmpty(Tool.CookieGet("UserName")))
        {
            Response.Redirect("Login.aspx");
        }

        YS_UserBLL userbll = new YS_UserBLL();
        YS_User user = userbll.GetModel(Tool.CookieGet("UserName"));

        if (user.UserType != YS_Enum.UserType.公司机构)
            this.zhaopin.Visible = false;

        this.jifen.InnerText = user.Score.ToString();

        this.fensi.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where attentionID = " + user.ID + "").ToString();
        this.guanzhu.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where BeConcernedID = " + user.ID + "").ToString();

        this.renqi.InnerText = (Convert.ToInt32(fensi.InnerText) * 100).ToString();
        this.readName.InnerText = user.ReadName;
        if (user.HeadImg != "")
        {
            this.headImg.Src = user.HeadImg;
        }
        this.name.InnerText = user.UserName;
        this.city.InnerText = user.UserType.ToString();

        this.mynametxt.Value = user.UserName;
        this.myreadnametxt.Value = user.ReadName;
        this.myaddresstxt.Value = user.Address;
        this.myemailtxt.Value = user.E_Mail;
    }
}