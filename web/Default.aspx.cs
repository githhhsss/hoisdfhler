using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.DBUtility;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater1.DataSource = DbHelperSQL.Query("select * from YS_WebImg where WebTpye = 0");
        Repeater1.DataBind();
    }
}