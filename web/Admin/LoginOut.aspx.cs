using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;

public partial class User_LoginOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Tool.CookieRemove("UserName");
        Tool.CookieRemove("ReadName");
        Tool.CookieRemove("UserID");
        Response.Redirect("~/Default.aspx");
    }
}