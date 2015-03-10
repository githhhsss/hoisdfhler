using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_MyOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<string> l = new List<string>();
        l.Add("11");
        l.Add("11");
        l.Add("11");
        l.Add("11");
        l.Add("11"); l.Add("11");
        l.Add("11");
        l.Add("11");
        l.Add("11");
        l.Add("11");
        l.Add("11"); l.Add("11");
        l.Add("11");
        l.Add("11");
        l.Add("11");
        l.Add("11");
        Repeater1.DataSource = l;
        Repeater1.DataBind();
    }
}