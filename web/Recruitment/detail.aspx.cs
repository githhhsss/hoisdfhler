using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class Recruitment_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int pid = 0;
        int.TryParse(Request["pid"], out pid);
        YS_ProductBLL pbll = new YS_ProductBLL();
        YS_Product p = pbll.GetModel(pid);

        this.zptxt0.InnerText = p.ProductName;
        this.zptxt1.InnerText = p.ProductMan;
        this.zptxt6.InnerText = p.ProductMan;

        this.zptxt2.InnerText = p.ProductAddress;
        this.zptxt3.InnerText = p.PriceRange;

        this.zptxt5.InnerHtml = p.Description;
        this.zptxt4.InnerText = p.InputTime.ToString("yyyy-MM-dd HH:mm");

        YS_UserBLL ubll = new YS_UserBLL();
        var u = ubll.GetModel(p.UserName);
        if (u != null)
        {
            this.zptxt7.InnerHtml = u.Company;
        }
        else
        {
            this.zptxt7.InnerHtml = p.Description;
        }


    }
}