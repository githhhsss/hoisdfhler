<%@ WebHandler Language="C#" Class="Handler" %>


using System;
using System.Web;
using YS_WEB.Model;
using YS_WEB.BLL;
using System.Data;
using Maticsoft.Common.DEncrypt;
using Maticsoft.Common;
using System.Text;

public class Handler : IHttpHandler {

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
    public void GetProducts2(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        int sItem = Convert.ToInt32(context.Request["sItem"]);
        StringBuilder sb = new StringBuilder();
        string ProductName = string.Empty;
        string ProductKey = string.Empty;
        try
        {
            DataSet ds = pbll.GetListByPage("ProductType in(10)", "id desc", sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                if (Convert.ToInt32(item["ProductName"].ToString().Length) > 18)
                {
                    ProductName = item["ProductName"].ToString().Substring(0, 17) + "...";
                }
                else
                {
                    ProductName = item["ProductName"].ToString();

                }
                if (Convert.ToInt32(item["ProductKey"].ToString().Length) > 100)
                {
                    ProductKey = item["ProductKey"].ToString().Substring(0, 97) + "...";
                }
                else
                {
                    ProductKey = item["ProductKey"].ToString();

                }
                sb.Append("<div class='Photography-context'>");
                sb.Append("<ul>");
                sb.Append("<li>");
                sb.Append("<img style='width: 332px; height: 219px;' src='InformationImg/" + item["PriceRange"] + "' /></li>");
                sb.Append("<li class='Photography-context-li'><a href='Information_detail.aspx?pid=" + item["ID"] + "'><span class='Photography-context-li-title'>" + ProductName + "</span>");
                sb.Append("<br />");
                sb.Append("<br />");
              //  sb.Append("<span>价格：￥" + Convert.ToDecimal(item["Price"]).ToString("f2") + "&nbsp;&nbsp;联系人：" + item["ProductMan"] + "&nbsp;&nbsp;电话：" + item["ProductPhone"] + "</span></a> </li>");
                sb.Append("<span style='display:-moz-inline-box; display:inline-block;width: 332px; '>" + ProductKey + "</span></a> </li>");
                sb.Append("</ul>");
                sb.Append("<div class='Photography-context-line'>");
                sb.Append("<hr /></div></div>");
            }
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"" + sb.ToString() + "\"}");
            return;
        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常!\"}");
            return;
        }
    }
    public void GetProducts3(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        int sItem = Convert.ToInt32(context.Request["sItem"]);
        StringBuilder sb = new StringBuilder();
        string ProductName = string.Empty;
        string ProductKey = string.Empty;
        try
        {
            DataSet ds = pbll.GetListByPage("ProductType in(9)", "id desc", sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                if (Convert.ToInt32(item["ProductName"].ToString().Length) > 18)
                {
                    ProductName = item["ProductName"].ToString().Substring(0, 17) + "...";
                }
                else
                {
                    ProductName = item["ProductName"].ToString();

                }
                if (Convert.ToInt32(item["ProductKey"].ToString().Length) > 100)
                {
                    ProductKey = item["ProductKey"].ToString().Substring(0, 97) + "...";
                }
                else
                {
                    ProductKey = item["ProductKey"].ToString();

                }
                sb.Append("<div class='Photography-context'>");
                sb.Append("<ul>");
                sb.Append("<li>");
                sb.Append("<img style='width: 332px; height: 219px;' src='InformationImg/" + item["PriceRange"] + "' /></li>");
                sb.Append("<li class='Photography-context-li'><a href='Information_detail.aspx?pid=" + item["ID"] + "'><span class='Photography-context-li-title'>" + ProductName + "</span>");
                sb.Append("<br />");
                sb.Append("<br />");
                //  sb.Append("<span>价格：￥" + Convert.ToDecimal(item["Price"]).ToString("f2") + "&nbsp;&nbsp;联系人：" + item["ProductMan"] + "&nbsp;&nbsp;电话：" + item["ProductPhone"] + "</span></a> </li>");
                sb.Append("<span style='display:-moz-inline-box; display:inline-block;width: 332px; '>" + ProductKey + "</span></a> </li>");
                sb.Append("</ul>");
                sb.Append("<div class='Photography-context-line'>");
                sb.Append("<hr /></div></div>");
            }
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"" + sb.ToString() + "\"}");
            return;
        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常!\"}");
            return;
        }
    }
    public void GetProducts4(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        int sItem = Convert.ToInt32(context.Request["sItem"]);
        StringBuilder sb = new StringBuilder();
        string ProductName = string.Empty;
        string ProductKey = string.Empty;
        try
        {
            DataSet ds = pbll.GetListByPage("ProductType in(8)", "id desc", sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                if (Convert.ToInt32(item["ProductName"].ToString().Length) > 18)
                {
                    ProductName = item["ProductName"].ToString().Substring(0, 17) + "...";
                }
                else
                {
                    ProductName = item["ProductName"].ToString();

                }
                if (Convert.ToInt32(item["ProductKey"].ToString().Length) > 100)
                {
                    ProductKey = item["ProductKey"].ToString().Substring(0, 97) + "...";
                }
                else
                {
                    ProductKey = item["ProductKey"].ToString();

                }
                sb.Append("<div class='Photography-context'>");
                sb.Append("<ul>");
                sb.Append("<li>");
                sb.Append("<img style='width: 332px; height: 219px;' src='InformationImg/" + item["PriceRange"] + "' /></li>");
                sb.Append("<li class='Photography-context-li'><a href='Information_detail.aspx?pid=" + item["ID"] + "'><span class='Photography-context-li-title'>" + ProductName + "</span>");
                sb.Append("<br />");
                sb.Append("<br />");
                //  sb.Append("<span>价格：￥" + Convert.ToDecimal(item["Price"]).ToString("f2") + "&nbsp;&nbsp;联系人：" + item["ProductMan"] + "&nbsp;&nbsp;电话：" + item["ProductPhone"] + "</span></a> </li>");
                sb.Append("<span style='display:-moz-inline-box; display:inline-block;width: 332px; '>" + ProductKey + "</span></a> </li>");
                sb.Append("</ul>");
                sb.Append("<div class='Photography-context-line'>");
                sb.Append("<hr /></div></div>");
            }
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"" + sb.ToString() + "\"}");
            return;
        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常!\"}");
            return;
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}