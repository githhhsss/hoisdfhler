using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;

public partial class Shop_ProductItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        YS_ProductBLL productbll = new YS_ProductBLL();
        int id = 0;
        int.TryParse(Request["itemid"].ToString(), out id);
        YS_Product pro = productbll.GetModel(id);
        if (pro != null)
        {
            if (pro.ProductType == YS_Enum.ProductType.器材 || pro.ProductType == YS_Enum.ProductType.默认)
            {
                this.sci_name.InnerText = pro.ProductName;
                this.sci_price.InnerText = "售价：$"+pro.Price.ToString("f2") ;
                this.sci_stock.InnerText = "库存："+pro.Stock.ToString();
                this.pro_img.Src = "/ProductImg/" + pro.ProductAddress;//图片
                this.sci_Description.InnerHtml = pro.Description;

                YS_CommentBLL commentbll = new YS_CommentBLL();
                List<YS_Comment> clist = commentbll.GetModelList("ProductID = " + id);

                this.scipnum.InnerText = clist.Count.ToString();
                Repeater1.DataSource = clist;
                Repeater1.DataBind();

            }
            else
            {
                Response.Redirect("NotFind.aspx");
            }
        }
        else
        {
            Response.Redirect("NotFind.aspx");
        }
        
    }
}