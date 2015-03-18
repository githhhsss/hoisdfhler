using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class Order_Secondary__detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int pid = 0;
        int.TryParse(Request["pid"], out pid);
        YS_ProductBLL pbll = new YS_ProductBLL();
        YS_Product p = pbll.GetModel(pid);


        this.zptxt1.InnerText = p.ProductName;

        this.zptxt2.InnerText = p.Price.ToString("f2");
        this.zptxt3.InnerText = p.ProductXinJiu;

        this.zptxt5.InnerHtml = p.ProductMan;
        this.zptxt4.InnerText = p.ProductAddress;
        this.zptxt6.InnerHtml = p.ProductPhone;
        this.zptxt7.InnerHtml = p.Description;
    }
}