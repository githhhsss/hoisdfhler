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
            DataSet ds = pbll.GetListByPage("ProductType in(0,1)", "id desc", sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<a href='ProductItem.aspx?itemid=" + item["ID"] + "'>");
                sb.Append("<div class='sc-centent-4-div " + (sItem % 3 == 1 ? "h-first" : "") + "'>");
                sb.Append("<img  src='/ProductImg/" + item["ProductAddress"] + "' />");
                sb.Append("<span>" + item["ProductName"] + "</span>");
                sb.Append("<span style='margin-top:10px;'>$" + Convert.ToDecimal(item["Price"]).ToString("f2") + "</span>");
                sb.Append("</div>");
                sb.Append("</a>");
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

    public void GetProducts1(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        int sItem = Convert.ToInt32(context.Request["sItem"]);
        string searchPro = context.Request["searchPro"];
        StringBuilder sb = new StringBuilder();
        try
        {
            //DataSet ds = pbll.GetListByPage("ProductType in(3)", "id desc", sItem, sItem);
            DataSet ds = pbll.GetListByPage("ProductType in(3) and (ProductName like '%" + searchPro + "%' or ProductAddress like '%" + searchPro + "%')", "id desc", sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<a href='Orders_Detail.aspx?pid="+item["ID"]+"'>");
                sb.Append("<div class='Recruitment-title'>");
                sb.Append("<ul>");
                sb.Append("<li class='Recruitment-title-name'>"+item["ProductName"]+"</li>");
                sb.Append("<li class='Recruitment-title-city'>（"+item["ProductAddress"]+"）</li>");
                sb.Append("<li class='Recruitment-title-Salary'>日薪"+ Convert.ToDecimal( item["Price"]).ToString("f2")+"</li>");
                sb.Append("</ul>");
                sb.Append("</div>");
                sb.Append("<div class='Recruitment-context'>");
                sb.Append("<ul>");
                sb.Append("<li>发布机构："+item["ProductMan"]+"&nbsp;&nbsp;&nbsp;</li>");
                sb.Append("<li>公司地址："+item["ProductAddress"]+"</li>");
                sb.Append("<li class='Recruitment-context-time'>"+ Convert.ToDateTime( item["InputTime"]).ToString("yyyy-MM-dd HH:mm")+"</li>");
                sb.Append(" </ul></div></a>");
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


    public void GetProducts2(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        int sItem = Convert.ToInt32(context.Request["sItem"]);
        StringBuilder sb = new StringBuilder();
        try
        {
            DataSet ds = pbll.GetListByPage("ProductType in(7)", "id desc", sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<div class='Photography-context'>");
                sb.Append("<ul>");
                sb.Append("<li>");
                sb.Append("<img style='width: 332px; height: 219px;' src='/ProductImg/"+item["ProductAddress"]+"' /></li>");
                sb.Append("<li class='Photography-context-li'><a href='Photography_detail.aspx?pid="+item["ID"]+"'><span class='Photography-context-li-title'>"+item["ProductName"]+"</span>");
                sb.Append("<br />");
                sb.Append("<br />");
                sb.Append("<span>价格：￥"+ Convert.ToDecimal( item["Price"]).ToString("f2")+"&nbsp;&nbsp;联系人："+item["ProductMan"]+"&nbsp;&nbsp;电话："+item["ProductPhone"]+"</span></a> </li>");
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
        try
        {
            DataSet ds = pbll.GetListByPage("ProductType in(2)", "id desc", sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<div class='Secondary-context'>");
                sb.Append("<ul>");
                sb.Append("<li><img style='background:url(../ProductImg/esImg/" + item["PriceRange"].ToString() + ") center bottom no-repeat; width:332px; height:219px;' /></li>");
                sb.Append("<li class='Secondary-context-li'><a href='Secondary_detail.aspx?pid="+item["ID"]+"'>");
                sb.Append("<span class='Secondary-context-li-title'>"+item["ProductName"]+"</span>");
                sb.Append("<br /><br />");
                sb.Append("<span>价格：￥"+Convert.ToDecimal( item["Price"]).ToString("f2")+"&nbsp;&nbsp;成色："+item["ProductXinJiu"]+"&nbsp;&nbsp;区域："+item["ProductAddress"]+"</span>");
                sb.Append("<br /><br />");
                sb.Append("<span>联系人："+item["ProductMan"]+"&nbsp;&nbsp;电话："+item["ProductPhone"]+"</span></a>");
                sb.Append("</li></ul>");
                sb.Append("<div class='Secondary-context-line'><hr /></div>");
                sb.Append("</div>");
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