using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using Maticsoft.Common;

public partial class User_IssusingManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        Repeater1.DataSource = pbll.GetModelList("ProductType in (2,3,6) and username = '" + Tool.CookieGet("UserName") + "'");
        Repeater1.DataBind();
    }
}