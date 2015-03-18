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
    public void GetProducts(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        int sItem = Convert.ToInt32(context.Request["sItem"]);
        StringBuilder sb = new StringBuilder();
        try
        {
            DataSet ds = pbll.GetListByPage("ProductType in(4)", "id desc", sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<a href='detail.aspx?pid="+ item["ID"] +"'>");
                sb.Append("<div class='Recruitment-title'>");
                sb.Append("<ul>");
                sb.Append("<li class='Recruitment-title-name'>"+item["ProductName"]+"</li>");
                sb.Append("<li class='Recruitment-title-city'>（"+item["ProductXinJiu"]+"）</li>");
                sb.Append("<li class='Recruitment-title-Salary'>月薪"+item["PriceRange"]+"</li>");
                sb.Append("</ul>");
                sb.Append("</div>");
                sb.Append("<div class='Recruitment-context'>");
                sb.Append("<ul>");
                sb.Append("<li>发布机构："+item["ProductMan"]+"&nbsp;&nbsp;&nbsp;</li>");
                sb.Append("<li>公司地址："+item["ProductAddress"]+"</li>");
                sb.Append("<li class='Recruitment-context-time'>"+ Convert.ToDateTime( item["InputTime"]).ToString("yyyy-MM-dd HH:mm")+"</li>");
                sb.Append("</ul>");
                sb.Append("</div></a>");
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
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}