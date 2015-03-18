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
                sb.Append("<a href='Orders_Detail.aspx?pid=" + item["ID"] + "'>");
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
                sb.Append("<img src='Images/index/index_1.jpg' alt='' />");
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
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}