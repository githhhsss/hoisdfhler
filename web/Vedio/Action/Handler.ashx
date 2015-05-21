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
        int stock = Convert.ToInt32(context.Request["stock"]);
        StringBuilder sb = new StringBuilder();
        string ProductName = string.Empty;
        string Description = string.Empty;
        try
        {
            DataSet ds = pbll.GetListByPage("ProductType in(6) and " + "stock='" + stock + "' and Sales=1", "id desc", sItem, sItem);
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
                if (Convert.ToInt32(item["Description"].ToString().Length) > 50)
                {
                    Description = item["Description"].ToString().Substring(0, 47) + "...";
                }
                else
                {
                    Description = item["Description"].ToString();

                }
                sb.Append("<div class='Photography-context'>");
                sb.Append("<ul>");
                sb.Append("<li>");
                sb.Append("<img style='width: 332px; height: 219px;' src='../ProductImg/esImg/" + item["PriceRange"] + "' /></li>");
                sb.Append("<li class='Photography-context-li'><a href='Vedio_detail.aspx?item=" + item["ID"] + "'><span class='Photography-context-li-title'>" + ProductName + "</span>");
                sb.Append("<br />");
                sb.Append("<br />");
                //  sb.Append("<span>价格：￥" + Convert.ToDecimal(item["Price"]).ToString("f2") + "&nbsp;&nbsp;联系人：" + item["ProductMan"] + "&nbsp;&nbsp;电话：" + item["ProductPhone"] + "</span></a> </li>");
                sb.Append("<span style='display:-moz-inline-box; display:inline-block;width: 332px; '>" + Description + "</span></a> </li>");
               // sb.Append("<span style='display:-moz-inline-box; display:inline-block;width: 332px; '>《钢铁侠》改编自“漫威漫画”中的经典故事，讲述了工业家及发明家托尼·斯塔克遭阴谋绑架，被迫制造最致命的武器，身受重伤的他却暗中制造了一套高科技盔甲，保护自己逃生，从此变身“钢铁侠”保卫地球。[1] </span></a> </li>");
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
    public void GetVedio(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        int sItem = Convert.ToInt32(context.Request["sItem"]);
        int itemid = Convert.ToInt32(context.Request["item"]);
        StringBuilder sb = new StringBuilder();
        try
        {
            DataSet ds = pbll.GetListByPage("id='" + itemid + "'", "id desc", sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {

                sb.Append("<video id='video1'  width='755px' height='450px' controls='controls' >");
                sb.Append("<source   type='video/mp4' src='../VedioUp/"+item["ProductAddress"]+"'></source>Your browser does not support the video tag.");
                 sb.Append("</video>");
                //sb.Append("<div class='Photography-context'>");
                //sb.Append("<ul>");
                //sb.Append("<li>");
                //sb.Append("<img style='width: 332px; height: 219px;' src='InformationImg/" + item["PriceRange"] + "' /></li>");
                //sb.Append("<li class='Photography-context-li'><a href='Information_detail.aspx?pid=" + item["ID"] + "'><span class='Photography-context-li-title'>" + item["ProductName"] + "</span>");
                //sb.Append("<br />");
                //sb.Append("<br />");
                ////  sb.Append("<span>价格：￥" + Convert.ToDecimal(item["Price"]).ToString("f2") + "&nbsp;&nbsp;联系人：" + item["ProductMan"] + "&nbsp;&nbsp;电话：" + item["ProductPhone"] + "</span></a> </li>");
                //sb.Append("<span>" + item["Description"] + "</span></a> </li>");
                //sb.Append("</ul>");
                //sb.Append("<div class='Photography-context-line'>");
                //sb.Append("<hr /></div></div>");
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