using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vedio_Vedio_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request["itemid"]))
            {
                switch (Convert.ToInt32(Request["itemid"]))
                {
                    case 1: divtitle.InnerText = "爱情"; break;
                    case 2: divtitle.InnerText = "创意"; break;
                    case 3: divtitle.InnerText = "动画"; break;
                    case 4: divtitle.InnerText = "搞笑"; break;
                    case 5: divtitle.InnerText = "广告"; break;
                    case 6: divtitle.InnerText = "混音/配音"; break;
                    case 7: divtitle.InnerText = "青春"; break;
                    case 8: divtitle.InnerText = "励志"; break;
                    case 9: divtitle.InnerText = "特殊摄影"; break;
                }
               

            }
        }
    }
}