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
            DataSet ds = Maticsoft.DBUtility.DbHelperSQL.Query("select top 3 * from ys_product where producttype in (7) order by newid()");
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<div class='index-list'>");
                sb.Append("<div class='index-list-img fl'>");
                sb.Append("<img src='Images/index/index_1.jpg' alt='' />");
                sb.Append("</div>");
                sb.Append("<div class='index-list-text fl'>");
                sb.Append("<h2>幽默讽刺短片《我妈妈的摩托车》</h2>");
                sb.Append("<h3><a href='#'>创意</a> <a href='#'>励志</a> <a href='#'>MV</a> <a href='#'>科幻/奇幻</a><span class='index-list-text-time'></span></h3>");
                sb.Append("<span>短片《My mom’s motorcycle》（我妈妈的摩托车）作为My Rode Reel  短片比赛的参赛作品，以幽默的手法讲述了一个男孩的妈妈如何成为他摩托车主人的故事短片取材于导演Douglas Ga . . .</span>");
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
                sb.Append("<span>" + "" + "</span>");
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
            DataSet ds = Maticsoft.DBUtility.DbHelperSQL.Query("select top 3 * from ys_product where producttype in (7) order by newid()");
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<div class='index-list'>");
                sb.Append("<div class='index-list-img fl'>");
                sb.Append("<img src='Images/index/index_1.jpg' alt='' />");
                sb.Append("</div>");
                sb.Append("<div class='index-list-text fl'>");
                sb.Append("<h2>幽默讽刺短片《我妈妈的摩托车》</h2>");
                sb.Append("<h3><a href='#'>创意</a> <a href='#'>励志</a> <a href='#'>MV</a> <a href='#'>科幻/奇幻</a><span class='index-list-text-time'></span></h3>");
                sb.Append("<span>短片《My mom’s motorcycle》（我妈妈的摩托车）作为My Rode Reel  短片比赛的参赛作品，以幽默的手法讲述了一个男孩的妈妈如何成为他摩托车主人的故事短片取材于导演Douglas Ga . . .</span>");
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