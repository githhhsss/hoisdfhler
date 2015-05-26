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
            //try
           // {
                System.Reflection.MethodInfo Remethod = this.GetType().GetMethod(cmd);
                if (Remethod != null) { Remethod.Invoke(this, new object[] { context }); }
          //  }
           // catch
           // {
               // context.Response.Write("{\"flag\":\"false\",\"msg\":\"系统异常 \"}");
           // }
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
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"成功添加到购物车\",\"num\":\"" + c.Number + "\",\"snum\":\"" + (c.Number * c.Price).ToString("f2") + "\"}");
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
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"成功添加到购物车\",\"num\":\"" + c.Number + "\",\"snum\":\"" + (c.Number * c.Price).ToString("f2") + "\"}");
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

    //添加订单 
    //收货信息
    public void AddOrder(HttpContext context)
    {
        if (string.IsNullOrEmpty(Tool.CookieGet("UserID")))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"登陆超时。请重新登陆\"}");
            return;
        }
        string DeliveryName = context.Request["shText1"];
        string DeliverPhone = context.Request["shText2"];
        string DeliverSheng = context.Request["shText3"];
        string DeliverAddress = context.Request["shText4"];
        string DeliverZipCode = context.Request["shText5"];

        bool isAdd = true;
        YS_ProductBLL pbll = new YS_ProductBLL();
        YS_DeliveryBLL dbll = new YS_DeliveryBLL();
        YS_Delivery d = dbll.GetModelForUser(Convert.ToInt32(Tool.CookieGet("UserID")));
        if (d != null)
        {
            isAdd = false;
        }
        else
        {
            d = new YS_Delivery();
        }

        d.DeliverAddress = DeliverAddress;
        d.DeliverCity = DeliverSheng;
        d.DeliverPhone = DeliverPhone;
        d.DeliverSheng = DeliverSheng;
        d.DeliveryName = DeliveryName;
        d.DeliverZipCode = DeliverZipCode;
        d.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
        d.UserName = Tool.CookieGet("UserName");


        if (isAdd)
        {
            if (!dbll.Add(d))
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常\"}");
                return;
            }

        }
        else
        {
            if (!dbll.Update(d))
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常\"}");
                return;
            }
        }

        YS_OrderBLL obll = new YS_OrderBLL();
        YS_Order o = new YS_Order();

        YS_OrderItemBLL oibll = new YS_OrderItemBLL();
        YS_OrderItem oi = new YS_OrderItem();

        YS_CarBLL cbll = new YS_CarBLL();

        var clist = cbll.GetModelList("userid = " + Convert.ToInt32(Tool.CookieGet("UserID")));
        decimal sum = 0;
        foreach (var c in clist)
        {

            YS_Product p = pbll.GetModel(c.ProductID);
            if (p.Stock <= c.Number)
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"你选购的商品无货。请查看。\"}");
                return;
            }
                
            sum += c.Number * c.Price;
        }

        o.AddTime = DateTime.Now;
        o.DeliverAddress = DeliverAddress;
        o.DeliverCity = DeliverSheng;
        o.DeliverPhone = DeliverPhone;
        o.DeliverSheng = DeliverSheng;
        o.DeliveryName = DeliveryName;
        o.DeliverZipCode = DeliverZipCode;
        o.Price = sum;
        o.Promotion = 1;
        o.State = YS_Enum.OrderState.待发货;
        o.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
        o.UserName = Tool.CookieGet("UserName");
        if (!obll.Add(o))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常\"}");
            return;
        }

        o = obll.GetModel(Convert.ToInt32(Tool.CookieGet("UserID")));

        foreach (var c in clist)
        {
            oi.OrderID = o.ID;
            oi.ProductID = c.ProductID;
            oi.Num = c.Number;

            //更新产品售量
            
            YS_Product p = pbll.GetModel(c.ProductID);
            if (p != null)
            {
                p.Sales += c.Number;
                p.Stock -= c.Number;
                pbll.Update(p);
            }
            if (!oibll.Add(oi))
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常\"}");
                return;
            }

            if (!cbll.Delete(c.ID))
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常\"}");
                return;
            }
        }
        context.Response.Write("{\"flag\":\"true\",\"msg\":\"订单提交成功!\"}");

    }
    public void GetProducts(HttpContext context)
    {
        YS_ProductBLL pbll = new YS_ProductBLL();
        int sItem = Convert.ToInt32(context.Request["sItem"]);
        string searchPro = context.Request["searchPro"];
        string oder_by = context.Request["oder_by"];
        StringBuilder sb = new StringBuilder();
        try
        {
            DataSet ds = pbll.GetListByPage("ProductType in(0,1) and (ProductName like '%" + searchPro + "%' or ProductKey like '%" + searchPro + "%')", oder_by, sItem, sItem);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"加载完\"}");
                return;
            }
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                sb.Append("<div style='position:relative;'>");
                if (Convert.ToBoolean(item["IsHot"]))
                {
                    if (sItem % 3 == 1)
                    {
                        sb.Append("<img src='../Images/rx.jpg' style='position:absolute;top:50px; left:0px;' />");
                    }
                    else
                    {
                        sb.Append("<img src='../Images/rx.jpg' style='position:absolute;top:50px; left:36px;' />");
                    }
                }
                sb.Append("<a href='ProductItem.aspx?itemid=" + item["ID"] + "'>");
                sb.Append("<div class='sc-centent-4-div " + (sItem % 3 == 1 ? "h-first" : "") + "'>");
                sb.Append("<img  src='/ProductImg/" + item["ProductAddress"] + "' />");
                sb.Append("<span>" + item["ProductName"] + "</span>");
                sb.Append("<span style='margin-top:10px;'>$" + Convert.ToDecimal(item["Price"]).ToString("f2") + "</span>");
                sb.Append("</div>");
                sb.Append("</a>");
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