using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class Order_Photography_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int pid = 0;
        int.TryParse(Request["pid"], out pid);
        YS_ProductBLL pbll = new YS_ProductBLL();
        YS_Product p = pbll.GetModel(pid);


        hsimg.Src = "/ProductImg/"+p.ProductAddress;
        this.zptxt1.InnerText = p.ProductName;

        this.zptxt2.InnerText = p.Price.ToString("f2");
        this.zptxt3.InnerText = p.ProductMan;

        this.zptxt5.InnerHtml = p.Description;
        this.zptxt4.InnerText = p.ProductPhone;
    }
}