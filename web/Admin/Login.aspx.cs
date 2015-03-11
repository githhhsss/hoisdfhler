using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class User_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //如果登陆，转到用户首页
        if (!string.IsNullOrEmpty(Tool.CookieGet("UserName")))
        {
            YS_UserBLL userbll = new YS_UserBLL();
            YS_User user = userbll.GetModel(Tool.CookieGet("UserName"));

            if (user.UserType == YS_Enum.UserType.管理员)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}