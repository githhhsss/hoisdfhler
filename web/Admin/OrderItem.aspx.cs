using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;

public partial class Admin_OrderItem : System.Web.UI.Page
{
    public YS_ProductBLL pbll = new YS_ProductBLL();
    public YS_CommentBLL cbll = new YS_CommentBLL();
    public YS_OrderBLL obll = new YS_OrderBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        int oid = 0;
        int.TryParse(Request["oid"], out oid);

        YS_OrderItemBLL oibll = new YS_OrderItemBLL();

        Repeater2.DataSource = oibll.GetList("orderId = "+oid);
        Repeater2.DataBind();

    }
}