using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class User_MyOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //如果未登陆，转到登陆页
        if (string.IsNullOrEmpty(Tool.CookieGet("UserName")))
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            YS_UserBLL userbll = new YS_UserBLL();
            YS_User user = userbll.GetModel(Tool.CookieGet("UserName"));
            List<YS_Order> orderList = new YS_OrderBLL().GetModelList("userid = " + user.ID +" order by addtime desc");
            Repeater1.DataSource = orderList;
            Repeater1.DataBind();
        }
        
    }
}