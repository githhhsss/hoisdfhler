using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class User_Vrecommendation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["itemid"]))
        {

        }
        else
        {
            int id = 0;
            int.TryParse(Request["itemid"].ToString(), out id);
            YS_ProductBLL bll = new YS_ProductBLL();
            YS_Product p = bll.GetModel(id);

            this.RegisteruserNameTxt.Value = p.ProductAddress;

            this.RegisterText7.Value = p.Description;
        }
    }
}