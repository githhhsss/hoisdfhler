using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class Vedio_Vedio_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int pid = 0;
        int.TryParse(Request["item"], out pid);
        YS_ProductBLL pbll = new YS_ProductBLL();
        YS_Product p = pbll.GetModel(pid);

        switch (p.Stock)
        {
            case 1: this.zptxt1.InnerHtml = "爱情"; break;
            case 2: this.zptxt1.InnerHtml = "创意"; break;
            case 3: this.zptxt1.InnerHtml = "动画"; break;
            case 4: this.zptxt1.InnerHtml = "搞笑"; break;
            case 5: this.zptxt1.InnerHtml = "广告"; break;
            case 6: this.zptxt1.InnerHtml = "混剪/配音"; break;
            case 7: this.zptxt1.InnerHtml = "青春"; break;
            case 8: this.zptxt1.InnerHtml = "励志"; break;
            case 9: this.zptxt1.InnerHtml = "特殊摄影"; break;

        }
        this.zptxt7.InnerHtml = p.ProductName;
        this.ms.InnerHtml = p.Description;
    }
}