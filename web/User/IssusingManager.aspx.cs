using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using Maticsoft.Common;
using Maticsoft.DBUtility;
using YS_WEB.Model;

public partial class User_IssusingManager : System.Web.UI.Page
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



        YS_ProductBLL pbll = new YS_ProductBLL();
        Repeater1.DataSource = pbll.GetModelList("ProductType in (2,3,6) and username = '" + Tool.CookieGet("UserName") + "'");
        Repeater1.DataBind();
    }
}