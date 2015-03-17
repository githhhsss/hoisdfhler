using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;

public partial class User_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //如果登陆，转到用户首页
        if (!string.IsNullOrEmpty(Tool.CookieGet("UserName")))
        {
            Response.Redirect("Default.aspx");
        }
    }
}