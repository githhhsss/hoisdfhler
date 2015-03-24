using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using Maticsoft.Common;
using YS_WEB.Model;
using Maticsoft.DBUtility;

public partial class Admin_WebImgManager : System.Web.UI.Page
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

        if (user.UserType != YS_Enum.UserType.管理员)
        {
            Response.Redirect("Login.aspx");
        }

        this.jifen.InnerText = user.Score.ToString();

        this.fensi.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where attentionID = " + user.ID + "").ToString();
        this.guanzhu.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where BeConcernedID = " + user.ID + "").ToString();

        this.renqi.InnerText = (Convert.ToInt32(fensi.InnerText) * 100).ToString();
        this.readName.InnerText = user.ReadName;
        if (user.HeadImg != "")
        {
            this.headImg.Src = "../User/" + user.HeadImg;
        }
        this.name.InnerText = user.UserName;
        this.city.InnerText = user.UserType.ToString();

        Repeater1.DataSource = DbHelperSQL.Query("select * from YS_WebImg order by WebTpye");
        Repeater1.DataBind();
    }
    public string GetWz(object obj)
    {
        int i = 0;
        int.TryParse(obj.ToString(),out i);
        switch (i)
        {
            case 0: return "首页banner";
            case 1: return "商城banner";
            case 2: return "商城8个列表";
            case 3: return "资讯3个列表";
        }
        return "";
    }
}