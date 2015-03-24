using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using Maticsoft.DBUtility;

public partial class Shop_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater1.DataSource = DbHelperSQL.Query("select * from YS_WebImg where WebTpye = 1");
        Repeater1.DataBind();
    }
}