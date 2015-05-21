using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class User_GoodsReceipt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //如果未登陆，转到登陆页
        if (string.IsNullOrEmpty(Tool.CookieGet("UserID")))
        {
            Response.Redirect("~/User/Login.aspx");
        }
        if (!IsPostBack)
        {
            YS_DeliveryBLL dbll = new YS_DeliveryBLL();
            YS_Delivery d = dbll.GetModelForUser(Convert.ToInt32(Tool.CookieGet("UserID")));
            if (d != null)
            {
                if (d.ID > 0)
                {
                    this.shText1.Value = d.DeliveryName;
                    this.shText2.Value = d.DeliverPhone;
                    this.shText3.Value = d.DeliverSheng;
                    this.shText4.Value = d.DeliverAddress;
                    this.shText5.Value = d.DeliverZipCode;
                }
            }
        }
    }
}