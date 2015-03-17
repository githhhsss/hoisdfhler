<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using YS_WEB.Model;
using YS_WEB.BLL;
using System.Data;
using Maticsoft.Common.DEncrypt;
using Maticsoft.Common;

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

    public void CarAdd(HttpContext context)
    {
        if (string.IsNullOrEmpty(Tool.CookieGet("UserName")))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"登陆超时。请重新登陆\"}");
            return;
        }
        int pid = Convert.ToInt32(context.Request["itemid"]);
        int num = 0;
        int.TryParse(context.Request["num"], out num);

        YS_ProductBLL pbll = new YS_ProductBLL();
        YS_Product p = pbll.GetModel(pid);

        YS_CarBLL cbll = new YS_CarBLL();
        YS_Car c = new YS_Car();

        bool isAdd = true;

        var clist = cbll.GetModelList("ProductID = " + pid);
        if (clist.Count > 0)
        {
            c = clist[0];
            isAdd = false;
        }
        c.IsCan = true;
        c.Number = num;
        if (c.Number <= 0)
        {
            c.Number = 1;
        }
        c.Price = p.Price;
        c.ProductID = p.ID;
        c.ProductName = p.ProductName;
        c.Promotion = p.Promotion;
        c.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
        c.UserName = Tool.CookieGet("UserName");
        if (isAdd)
        {
            if (cbll.Add(c))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"成功添加到购物车\",\"num\":\""+c.Number+"\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常\"}");
                return;
            }

        }
        else
        {
            if (cbll.Update(c))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"成功添加到购物车\",\"num\":\"" + c.Number + "\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常\"}");
                return;
            }
        }

    }
    public void CarDelete(HttpContext context)
    {
        if (string.IsNullOrEmpty(Tool.CookieGet("UserName")))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"登陆超时。请重新登陆\"}");
            return;
        }
        int pid = Convert.ToInt32(context.Request["itemid"]);

        YS_CarBLL cbll = new YS_CarBLL();
        YS_Car c = new YS_Car();

        var clist = cbll.GetModelList("ProductID = " + pid + " and userid = " + Convert.ToInt32(Tool.CookieGet("UserID")));

        foreach (var cc in clist)
        {
            if (cbll.Delete(cc.ID))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"成功删除购物车\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常\"}");
                return;
            }
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