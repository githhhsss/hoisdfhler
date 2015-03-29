<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using YS_WEB.Model;
using YS_WEB.BLL;
using System.Data;
using Maticsoft.Common.DEncrypt;
using Maticsoft.Common;
using System.Text;

public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        // 反射方法
        string cmd = context.Request["cmd"];
        if (cmd != "")
        {
            try
            {
                System.Reflection.MethodInfo Remethod = this.GetType().GetMethod(cmd);
                if (Remethod != null) { Remethod.Invoke(this, new object[] { context }); }
            }
            catch
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"系统异常 \"}");
            }
        }
        else
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"非法操作\"}");
        }
    }

    public void UpdateIndex1(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        StringBuilder sb = new StringBuilder();
        try
        {
            DataSet ds = Maticsoft.DBUtility.DbHelperSQL.Query("select top 3 * from ys_product where producttype in (2,3,4) order by newid()");
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                if ((YS_Enum.ProductType)Convert.ToInt32(item["ProductType"]) == YS_Enum.ProductType.二手)
                {
                    sb.Append("<a href='Order/Secondary_detail.aspx?pid=" + item["ID"] + "'>");
                }
                else if ((YS_Enum.ProductType)Convert.ToInt32(item["ProductType"]) == YS_Enum.ProductType.拍摄外单)
                {
                    sb.Append("<a href='Order/Orders_Detail.aspx?pid=" + item["ID"] + "'>");
                }
                else
                {
                    sb.Append("<a href='Recruitment/detail.aspx?pid=" + item["ID"] + "'>");
                }
                sb.Append("<div class='Recruitment-title'>");
                sb.Append("<ul>");
                sb.Append("<li class='Recruitment-title-name'>" + item["ProductName"] + "</li>");
                sb.Append("<li class='Recruitment-title-city'>（" + item["ProductAddress"] + "）</li>");
                sb.Append("<li class='Recruitment-title-Salary'>日薪" + Convert.ToDecimal(item["Price"]).ToString("f2") + "</li>");
                sb.Append("</ul>");
                sb.Append("</div>");
                sb.Append("<div class='Recruitment-context'>");
                sb.Append("<ul>");
                sb.Append("<li>发布机构：" + item["ProductMan"] + "&nbsp;&nbsp;&nbsp;</li>");
                sb.Append("<li>公司地址：" + item["ProductAddress"] + "</li>");
                sb.Append("<li class='Recruitment-context-time'>" + Convert.ToDateTime(item["InputTime"]).ToString("yyyy-MM-dd HH:mm") + "</li>");
                sb.Append(" </ul></div></a>");
            }
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"" + sb.ToString() + "\"}");
            return;
        }
        catch
        {
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"!\"}");
            return;
        }
    }
    public void UpdateIndex2(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        StringBuilder sb = new StringBuilder();
        try
        {
            DataSet ds = Maticsoft.DBUtility.DbHelperSQL.Query("select top 3 * from ys_product where producttype in (7) order by newid()");
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<div class='index-list'>");
                sb.Append("<div class='index-list-img fl'>");
                sb.Append("<img src='ProductImg/" + item["ProductAddress"] + "' alt='' />");
                sb.Append("</div>");
                sb.Append("<a href='Order/Photography_detail.aspx?pid=" + item["id"] + "'><div class='index-list-text fl'>");
                sb.Append("<h2>" + item["ProductName"] + "</h2>");

                sb.Append("<h3>");
                string[] ss = item["ProductKey"].ToString().Split(' ');
                foreach (string s in ss)
                {
                    sb.Append("<a href='#'>" + s + "</a> ");
                }

                sb.Append("<span class='index-list-text-time'></span></h3>");
                sb.Append("<span>联系人：" + item["ProductMan"] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：" + item["ProductPhone"] + "</span>");
                sb.Append("<div class='index-list-text-bottom'></div>");
                sb.Append("</div>");
                sb.Append("<div class='index-list-tottom clear'></div>");
                sb.Append("</div></a>");
            }
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"" + sb.ToString() + "\"}");
            return;
        }
        catch
        {
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"!\"}");
            return;
        }
    }
    public void UpdateIndex3(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        StringBuilder sb = new StringBuilder();
        try
        {
            DataSet ds = Maticsoft.DBUtility.DbHelperSQL.Query("select top 3 * from ys_product where producttype in (6) order by newid()");
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<div class='index-list'>");
                sb.Append("<div class='index-list-img fl'>");
                sb.Append("<img src='../ProductImg/esImg/" + item["PriceRange"] + "' alt='' />");
                sb.Append("</div>");
                sb.Append("<div class='index-list-text fl'>");
                sb.Append("<h2><a  target='_blank' href='" + item["ProductAddress"] + "'>" + item["ProductName"] + "</a></h2>");
                sb.Append("<h3><a href='#'>视频</a> <span class='index-list-text-time'></span></h3>");
                sb.Append("<span>" + item["Description"] + "</span>");
                sb.Append("<div class='index-list-text-bottom'></div>");
                sb.Append("</div>");
                sb.Append("<div class='index-list-tottom clear'></div>");
                sb.Append("</div>");
            }
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"" + sb.ToString() + "\"}");
            return;
        }
        catch
        {
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"!\"}");
            return;
        }
    }

    public void Addpj(HttpContext context)
    {
        int oid = Convert.ToInt32(context.Request["oid"]);
        string centent = context.Request["centent"];

        YS_OrderItemBLL oibll = new YS_OrderItemBLL();

        YS_CommentBLL cbll = new YS_CommentBLL();

        YS_OrderItem  o = oibll.GetModel(oid);
        YS_Comment c = cbll.GetModel(oid);
        if (o == null)
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"已找不到对应的订单产品，不能评价!\"}");
            return;
        }
        if (c != null)
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"本次订单已经评价!\"}");
            return;
        }
        else
        {
            c = new YS_Comment();
        }
        c.Content = centent;
        c.ProductID = o.ProductID;
        c.ProductName = "";
        c.UserName = Tool.CookieGet("UserName") ;
        c.UserID = o.ID;

        try
        {
            if (cbll.Add(c))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"评价成功!\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理错误!\"}");
                return;
            }
        }
        catch {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"发生未知错误!\"}");
            return;
        }
        
    }

    public void UpdateIndex4(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        StringBuilder sb = new StringBuilder();
        int sItem = Convert.ToInt32(context.Request["sItem"]);
        string searchPro = context.Request["searchPro"];
        try
        {
            DataSet ds = pbll.GetListByPage("ProductType in(0,1,2,3,4,7) and (ProductName like '%" + searchPro + "%' or ProductKey like '%" + searchPro + "%')", "id desc", sItem, sItem); 
            
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<li>");
                if ((YS_Enum.ProductType)Convert.ToInt32(item["ProductType"]) == YS_Enum.ProductType.二手)
                {
                    sb.Append("<a href='Order/Secondary_detail.aspx?pid=" + item["ID"] + "'>");
                    sb.Append("<div class='Recruitment-title'>");
                    sb.Append("<ul>");
                    sb.Append("<li class='Recruitment-title-name'>" + item["ProductName"] + "</li>");
                    sb.Append("<li class='Recruitment-title-city'>（" + item["ProductAddress"] + "）</li>");
                    sb.Append("<li class='Recruitment-title-Salary'>价格" + Convert.ToDecimal(item["Price"]).ToString("f2") + "</li>");
                    sb.Append("</ul>");
                    sb.Append("</div>");
                    sb.Append("<div class='Recruitment-context'>");
                    sb.Append("<ul>");
                    sb.Append("<li>发布机构：" + item["ProductMan"] + "&nbsp;&nbsp;&nbsp;</li>");
                    sb.Append("<li>公司地址：" + item["ProductAddress"] + "</li>");
                }
                else if ((YS_Enum.ProductType)Convert.ToInt32(item["ProductType"]) == YS_Enum.ProductType.拍摄外单)
                {
                    sb.Append("<a href='Order/Orders_Detail.aspx?pid=" + item["ID"] + "'>");
                    sb.Append("<div class='Recruitment-title'>");
                    sb.Append("<ul>");
                    sb.Append("<li class='Recruitment-title-name'>" + item["ProductName"] + "</li>");
                    sb.Append("<li class='Recruitment-title-city'>（" + item["ProductAddress"] + "）</li>");
                    sb.Append("<li class='Recruitment-title-Salary'>价格" + Convert.ToDecimal(item["Price"]).ToString("f2") + "</li>");
                    sb.Append("</ul>");
                    sb.Append("</div>");
                    sb.Append("<div class='Recruitment-context'>");
                    sb.Append("<ul>");
                    sb.Append("<li>发布机构：" + item["ProductMan"] + "&nbsp;&nbsp;&nbsp;</li>");
                    sb.Append("<li>公司地址：" + item["ProductAddress"] + "</li>");
                }
                else if ((YS_Enum.ProductType)Convert.ToInt32(item["ProductType"]) == YS_Enum.ProductType.器材)
                {
                    sb.Append("<a href='Shop/ProductItem.aspx?itemid=" + item["ID"] + "'>");
                    sb.Append("<div class='Recruitment-title'>");
                    sb.Append("<ul>");
                    sb.Append("<li class='Recruitment-title-name'>" + item["ProductName"] + "</li>");
                    sb.Append("<li class='Recruitment-title-city'></li>");
                    sb.Append("<li class='Recruitment-title-Salary'>(" + Convert.ToDecimal(item["Price"]).ToString("f2") + ")</li>");
                    sb.Append("</ul>");
                    sb.Append("</div>");
                    sb.Append("<div class='Recruitment-context'>");
                    sb.Append("<ul>");
                  
                }
                else if ((YS_Enum.ProductType)Convert.ToInt32(item["ProductType"]) == YS_Enum.ProductType.摄影服务)
                {
                    sb.Append("<a href='Order/Photography_detail.aspx?pid=" + item["ID"] + "'>");
                    sb.Append("<div class='Recruitment-title'>");
                    sb.Append("<ul>");
                    sb.Append("<li class='Recruitment-title-name'>" + item["ProductName"] + "</li>");
                    sb.Append("<li class='Recruitment-title-city'>（" + item["ProductAddress"] + "）</li>");
                    sb.Append("<li class='Recruitment-title-Salary'>价格" + Convert.ToDecimal(item["Price"]).ToString("f2") + "</li>");
                    sb.Append("</ul>");
                    sb.Append("</div>");
                    sb.Append("<div class='Recruitment-context'>");
                    sb.Append("<ul>");
                    sb.Append("<li>发布机构：" + item["ProductMan"] + "&nbsp;&nbsp;&nbsp;</li>");
                    sb.Append("<li>公司地址：" + item["ProductAddress"] + "</li>");
                }
                else if ((YS_Enum.ProductType)Convert.ToInt32(item["ProductType"]) == YS_Enum.ProductType.职位)
                {
                    sb.Append("<a href='Recruitment/detail.aspx?pid=" + item["ID"] + "'>");
                    sb.Append("<div class='Recruitment-title'>");
                    sb.Append("<ul>");
                    sb.Append("<li class='Recruitment-title-name'>" + item["ProductName"] + "</li>");
                    sb.Append("<li class='Recruitment-title-city'>（" + item["ProductAddress"] + "）</li>");
                    sb.Append("<li class='Recruitment-title-Salary'>薪资" +item["PriceRange"] + "</li>");
                    sb.Append("</ul>");
                    sb.Append("</div>");
                    sb.Append("<div class='Recruitment-context'>");
                    sb.Append("<ul>");
                    sb.Append("<li>发布机构：" + item["ProductMan"] + "&nbsp;&nbsp;&nbsp;</li>");
                    sb.Append("<li>公司地址：" + item["ProductAddress"] + "</li>");
                }
                else
                {
                    sb.Append("<a href='Shop/ProductItem.aspx?itemid=" + item["ID"] + "'>");
                    sb.Append("<a href='Shop/ProductItem.aspx?itemid=" + item["ID"] + "'>");
                    sb.Append("<div class='Recruitment-title'>");
                    sb.Append("<ul>");
                    sb.Append("<li class='Recruitment-title-name'>" + item["ProductName"] + "</li>");
                    sb.Append("<li class='Recruitment-title-city'></li>");
                    sb.Append("<li class='Recruitment-title-Salary'>(" + Convert.ToDecimal(item["Price"]).ToString("f2") + ")</li>");
                    sb.Append("</ul>");
                    sb.Append("</div>");
                    sb.Append("<div class='Recruitment-context'>");
                    sb.Append("<ul>");
                  
                }
                
                
                sb.Append("<li class='Recruitment-context-time'>" + Convert.ToDateTime(item["InputTime"]).ToString("yyyy-MM-dd HH:mm") + "</li>");
                sb.Append(" </ul></div></a>");
                sb.Append("</li>");
            }
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"" + sb.ToString() + "\"}");
            return;
        }
        catch
        {
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"!\"}");
            return;
        }
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}