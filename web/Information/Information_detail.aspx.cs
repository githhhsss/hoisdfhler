using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class Information_Information_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int pid = 0;
        int.TryParse(Request["pid"], out pid);
        YS_ProductBLL pbll = new YS_ProductBLL();
        YS_Product p = pbll.GetModel(pid);

        switch (p.ProductType)
        {
            case YS_Enum.ProductType.电影电视剧: this.zptxt1.InnerHtml = "类别>电影电视剧"; break;
            case YS_Enum.ProductType.器材资讯: this.zptxt1.InnerHtml = "类别>器材"; break;
            case YS_Enum.ProductType.制作: this.zptxt1.InnerHtml = "类别>制作"; break;

        }
        this.zptxt7.InnerHtml = p.Description;
    }
}