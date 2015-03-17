using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class User_Shooting : System.Web.UI.Page
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

            this.RegisteruserNameTxt.Value = p.ProductName;
            this.Registerpassword.Value = p.StartTime.ToString("yyyy-MM-dd");
            this.Registerpassword2.Value = p.ProductAddress;
            this.RegisterText4.Value = p.Price.ToString("f2"); 
            this.RegisterText5.Value = p.ProductMan;
            this.RegisterText6.Value = p.ProductPhone;
            this.RegisterText7.Value = p.Description;
        }
    }
}