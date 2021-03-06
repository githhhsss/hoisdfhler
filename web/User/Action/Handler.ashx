﻿<%@ WebHandler Language="C#" Class="Handler" %>

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

    public void RegisterUser(HttpContext context)
    {
        string username = context.Request["username"];
        string password = context.Request["password"];
        string passwordag = context.Request["passwordag"];
        string e_mail = context.Request["e_mail"];
        string question = context.Request["question"];
        string answer = context.Request["answer"];

        YS_UserBLL userbll = new YS_UserBLL();
        YS_User user = userbll.GetModel(username);

        if (user != null)
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"用户名已经存在\"}");
            return;
        }
        else
        {
            user = new YS_User();
        }
        if (!password.Equals(passwordag))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"2次密码输入不相同\"}");
            return;
        }
        if (!PageValidate.IsEmail(e_mail))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"邮件地址格式不对\"}");
            return;
        }
        //添加用户
        user.UserName = username;
        user.Password = HashEncode.MD5(password);
        user.E_Mail = e_mail;
        user.Question = question;
        user.Answer = answer;
        user.Address = "";
        user.Birthday = DateTime.Now;
        user.Company = "";
        user.CompanyGM = "";
        user.CompanyType = "";
        user.CompanyWebAdderss = "";
        user.HeadImg = "";
        user.MyMoney = 0;
        user.ReadName = username;
        user.Score = 0;
        user.UserType = YS_Enum.UserType.商城用户;

        try
        {
            if (userbll.Add(user))
            {
                user = userbll.GetModel(username);
                Tool.CookieWrite("UserName", user.UserName);
                Tool.CookieWrite("ReadName", user.ReadName);
                Tool.CookieWrite("UserID", user.ID.ToString());
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"注册成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }
        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }
    }
    public void UserLogin(HttpContext context)
    {
        string username = context.Request["username"];
        string password = context.Request["password"];
        YS_UserBLL userbll = new YS_UserBLL();
        YS_User user = userbll.GetModel(username, HashEncode.MD5(password));
        if (user != null)
        {
            Tool.CookieWrite("UserName", user.UserName);
            Tool.CookieWrite("ReadName", user.ReadName);
            Tool.CookieWrite("UserID", user.ID.ToString());
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"登陆成功\"}");
            return;
        }
        else
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"用户名或者密码错误\"}");
            return;
        }
    }
    public void ChangePassword(HttpContext context)
    {
        string password1 = context.Request["password1"];
        string password2 = context.Request["password2"];
        string password3 = context.Request["password3"];
        if (password2 != password3)
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"2次密码不正确\"}");
            return;
        }
        string username = Tool.CookieGet("UserName");
        YS_UserBLL userbll = new YS_UserBLL();
        YS_User user = userbll.GetModel(username);
        if (user != null)
        {
            if (user.Password == HashEncode.MD5(password1))
            {
                user.Password = HashEncode.MD5(password2);
                if (userbll.Update(user))
                {
                    context.Response.Write("{\"flag\":\"true\",\"msg\":\"密码修改成功\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                    return;
                }
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"原始密码错误\"}");
                return;
            }

        }
        else
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"用户登陆超时！请退出重新登陆\"}");
            return;
        }
    }
    public void ChangeMyInformation(HttpContext context)
    {
        string username = context.Request["username"];
        string readname = context.Request["readname"];
        string address = context.Request["address"];
        string e_mail = context.Request["e_mail"];

        YS_UserBLL userbll = new YS_UserBLL();
        YS_User user = userbll.GetModel(username);
        if (user != null)
        {
            user.ReadName = readname;
            user.E_Mail = e_mail;
            user.Address = address;
            if (userbll.Update(user))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"信息修改成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        else
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"用户登陆超时！请退出重新登陆\"}");
            return;
        }
    }


    //发布摄影信息
    public void AddProduct(HttpContext context)
    {
        string ProductName = context.Request["txt1"];//拍摄类型
        DateTime StartTime = DateTime.Now;
        try
        {
            StartTime = Convert.ToDateTime(context.Request["txt2"]);//拍摄时间
        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"拍摄时间格式错误\"}");
            return;
        }
        string ProductAddress = context.Request["txt3"];//拍摄地点
        string Price = context.Request["txt4"];//价&nbsp;&nbsp;格：
        string ProductMan = context.Request["txt5"];//联系人
        string ProductPhone = context.Request["txt6"];//联系电话
        string Description = context.Request["txt7"];//详细描述

        if (string.IsNullOrEmpty(ProductName))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"拍摄类型不能为空\"}");
            return;
        }
        if (!PageValidate.IsDecimal(Price))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"价格格式不对\"}");
            return;
        }


        YS_ProductBLL probll = new YS_ProductBLL();
        YS_Product pro = new YS_Product();
        pro.Description = Description;
        pro.InputTime = DateTime.Now;
        pro.IsHot = true;
        pro.OverTime = new DateTime(9999, 12, 30);
        pro.Price = Convert.ToDecimal(Price);
        pro.PriceRange = "";
        pro.ProductAddress = ProductAddress;
        pro.ProductKey = "";
        pro.ProductMan = ProductMan;
        pro.ProductName = ProductName;
        pro.ProductPhone = ProductPhone;
        pro.ProductType = YS_Enum.ProductType.拍摄外单;
        pro.ProductXinJiu = "";
        pro.Promotion = 0;
        pro.Sales = 0;
        pro.StartTime = StartTime;
        pro.State = YS_Enum.ProductState.默认;
        pro.Stock = 0;

        pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
        pro.UserName = Tool.CookieGet("UserName");

        try
        {
            if (probll.Add(pro))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"拍摄任务添加成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }

    }
    //发布二手器材
    public void AddProduct2(HttpContext context)
    {
        string ProductName = context.Request["txt1"];//器材名称
        string ProductXinJiu = context.Request["txt2"];//新旧程度
        string Price = context.Request["txt3"];//价&nbsp;&nbsp;格
        string ProductAddress = context.Request["txt4"];//所在城市
        string ProductMan = context.Request["txt5"];//联系人
        string ProductPhone = context.Request["txt6"];//联系电话
        string Description = context.Request["txt7"];//详细描述

        if (string.IsNullOrEmpty(ProductName))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"器材名称不能为空\"}");
            return;
        }
        if (!PageValidate.IsDecimal(Price))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"价格格式不对\"}");
            return;
        }


        YS_ProductBLL probll = new YS_ProductBLL();
        YS_Product pro = new YS_Product();
        pro.Description = Description;
        pro.InputTime = DateTime.Now;
        pro.IsHot = true;
        pro.OverTime = new DateTime(9999, 12, 30);
        pro.Price = Convert.ToDecimal(Price);
        pro.PriceRange = "";
        pro.ProductAddress = ProductAddress;
        pro.ProductKey = "";
        pro.ProductMan = ProductMan;
        pro.ProductName = ProductName;
        pro.ProductPhone = ProductPhone;
        pro.ProductType = YS_Enum.ProductType.二手;
        pro.ProductXinJiu = ProductXinJiu;
        pro.Promotion = 0;
        pro.Sales = 0;
        pro.StartTime = DateTime.Now;
        pro.State = YS_Enum.ProductState.默认;
        pro.Stock = 0;

        pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
        pro.UserName = Tool.CookieGet("UserName");

        try
        {
            if (probll.Add(pro))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"二手器材发布成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }

    }
    //发布推荐视频
    public void AddProduct3(HttpContext context)
    {
        string ProductAddress = context.Request["txt1"];//视频地址 
        string Description = context.Request["txt7"];//推荐理由 


        YS_ProductBLL probll = new YS_ProductBLL();
        YS_Product pro = new YS_Product();
        pro.Description = Description;
        pro.InputTime = DateTime.Now;
        pro.IsHot = true;
        pro.OverTime = new DateTime(9999, 12, 30);
        pro.Price = 0;
        pro.PriceRange = "";
        pro.ProductAddress = ProductAddress;
        pro.ProductKey = "";
        pro.ProductMan = "";
        pro.ProductName = "推荐视频";
        pro.ProductPhone = "";
        pro.ProductType = YS_Enum.ProductType.视频;
        pro.ProductXinJiu = ""; ;
        pro.Promotion = 0;
        pro.Sales = 0;
        pro.StartTime = DateTime.Now;
        pro.State = YS_Enum.ProductState.默认;
        pro.Stock = 0;

        pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
        pro.UserName = Tool.CookieGet("UserName");

        try
        {
            if (probll.Add(pro))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"推荐视频发布成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }

    }
    //修改摄影信息
    public void EditProduct(HttpContext context)
    {
        int pid = Convert.ToInt32(context.Request["itemid"]);
        string ProductName = context.Request["txt1"];//拍摄类型
        DateTime StartTime = DateTime.Now;
        try
        {
            StartTime = Convert.ToDateTime(context.Request["txt2"]);//拍摄时间
        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"拍摄时间格式错误\"}");
            return;
        }
        string ProductAddress = context.Request["txt3"];//拍摄地点
        string Price = context.Request["txt4"];//价&nbsp;&nbsp;格：
        string ProductMan = context.Request["txt5"];//联系人
        string ProductPhone = context.Request["txt6"];//联系电话
        string Description = context.Request["txt7"];//详细描述

        if (string.IsNullOrEmpty(ProductName))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"拍摄类型不能为空\"}");
            return;
        }
        if (!PageValidate.IsDecimal(Price))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"价格格式不对\"}");
            return;
        }


        YS_ProductBLL probll = new YS_ProductBLL();
        YS_Product pro = probll.GetModel(pid);
        pro.Description = Description;
        pro.InputTime = DateTime.Now;
        pro.IsHot = true;
        pro.OverTime = new DateTime(9999, 12, 30);
        pro.Price = Convert.ToDecimal(Price);
        pro.PriceRange = "";
        pro.ProductAddress = ProductAddress;
        pro.ProductKey = "";
        pro.ProductMan = ProductMan;
        pro.ProductName = ProductName;
        pro.ProductPhone = ProductPhone;
        pro.ProductType = YS_Enum.ProductType.拍摄外单;
        pro.ProductXinJiu = "";
        pro.Promotion = 0;
        pro.Sales = 0;
        pro.StartTime = StartTime;
        pro.State = YS_Enum.ProductState.默认;
        pro.Stock = 0;

        pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
        pro.UserName = Tool.CookieGet("UserName");

        try
        {
            if (probll.Update(pro))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"拍摄任务修改成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }

    }
    //修改二手器材
    public void EditProduct2(HttpContext context)
    {
        int pid = Convert.ToInt32(context.Request["itemid"]);
        string ProductName = context.Request["txt1"];//器材名称
        string ProductXinJiu = context.Request["txt2"];//新旧程度
        string Price = context.Request["txt3"];//价&nbsp;&nbsp;格
        string ProductAddress = context.Request["txt4"];//所在城市
        string ProductMan = context.Request["txt5"];//联系人
        string ProductPhone = context.Request["txt6"];//联系电话
        string Description = context.Request["txt7"];//详细描述

        if (string.IsNullOrEmpty(ProductName))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"器材名称不能为空\"}");
            return;
        }
        if (!PageValidate.IsDecimal(Price))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"价格格式不对\"}");
            return;
        }


        YS_ProductBLL probll = new YS_ProductBLL();
        YS_Product pro = probll.GetModel(pid);
        pro.Description = Description;
        pro.InputTime = DateTime.Now;
        pro.IsHot = true;
        pro.OverTime = new DateTime(9999, 12, 30);
        pro.Price = Convert.ToDecimal(Price);
        pro.PriceRange = "";
        pro.ProductAddress = ProductAddress;
        pro.ProductKey = "";
        pro.ProductMan = ProductMan;
        pro.ProductName = ProductName;
        pro.ProductPhone = ProductPhone;
        pro.ProductType = YS_Enum.ProductType.二手;
        pro.ProductXinJiu = ProductXinJiu;
        pro.Promotion = 0;
        pro.Sales = 0;
        pro.StartTime = DateTime.Now;
        pro.State = YS_Enum.ProductState.默认;
        pro.Stock = 0;

        pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
        pro.UserName = Tool.CookieGet("UserName");

        try
        {
            if (probll.Update(pro))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"二手器材修改成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }

    }
    //修改推荐视频
    public void EditProduct3(HttpContext context)
    {
        int pid = Convert.ToInt32(context.Request["itemid"]);
        string ProductAddress = context.Request["txt1"];//视频地址 
        string Description = context.Request["txt7"];//推荐理由 


        YS_ProductBLL probll = new YS_ProductBLL();
        YS_Product pro = probll.GetModel(pid);
        pro.Description = Description;
        pro.InputTime = DateTime.Now;
        pro.IsHot = true;
        pro.OverTime = new DateTime(9999, 12, 30);
        pro.Price = 0;
        pro.PriceRange = "";
        pro.ProductAddress = ProductAddress;
        pro.ProductKey = "";
        pro.ProductMan = "";
        pro.ProductName = "推荐视频";
        pro.ProductPhone = "";
        pro.ProductType = YS_Enum.ProductType.视频;
        pro.ProductXinJiu = ""; ;
        pro.Promotion = 0;
        pro.Sales = 0;
        pro.StartTime = DateTime.Now;
        pro.State = YS_Enum.ProductState.默认;
        pro.Stock = 0;

        pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
        pro.UserName = Tool.CookieGet("UserName");

        try
        {
            if (probll.Update(pro))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"推荐视频修改成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }

    }
    //删除产品……
    public void DeletePro(HttpContext context)
    {
        int UID = Convert.ToInt32(context.Request["ID"]);

        YS_ProductBLL pbll = new YS_ProductBLL();
        YS_Product pro = pbll.GetModel(UID);
        if (pro != null)
        {
            if (pbll.Delete(pro.ID))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"用户删除成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        else
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"找不到用户，请刷新页面\"}");
            return;
        }
    }

    //收货信息
    public void AddressUpdate(HttpContext context)
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
            if (dbll.Add(d))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"收货信息设置成功\"}");
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
            if (dbll.Update(d))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"收货信息设置成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库处理异常\"}");
                return;
            }
        }
    }

    //添加招聘
    public void AddZhaoPin(HttpContext context)
    {
        string ProductName = context.Request["txt2"];
        string PriceRange = context.Request["txt5"];
        string ProductMan = context.Request["txt1"];
        string ProductPhone = context.Request["txt4"];
        string ProductAddress = context.Request["txt3"];
        string Description = context.Request["txt6"];
        string txt9 = context.Request["txt9"];

        if (string.IsNullOrEmpty(ProductName))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"标题名称不能为空\"}");
            return;
        }

        YS_ProductBLL probll = new YS_ProductBLL();
        YS_Product pro = new YS_Product();
        pro.Description = Description;
        pro.InputTime = DateTime.Now;
        pro.IsHot = true;
        pro.OverTime = new DateTime(9999, 12, 30);
        pro.Price = 0;
        pro.PriceRange = PriceRange;
        pro.ProductAddress = ProductAddress;
        pro.ProductKey = "招聘";
        pro.ProductMan = ProductMan;
        pro.ProductName = ProductName;
        pro.ProductPhone = ProductPhone;
        pro.ProductType = YS_Enum.ProductType.职位;
        pro.ProductXinJiu = txt9;
        pro.Promotion = 0;
        pro.Sales = 0;
        pro.StartTime = DateTime.Now;
        pro.State = YS_Enum.ProductState.默认;
        pro.Stock = 0;
        string username = Tool.CookieGet("UserName");
        YS_UserBLL userbll = new YS_UserBLL();
        YS_User user = userbll.GetModel(username);
        pro.UserID = user.ID;
        pro.UserName = user.UserName;

        try
        {
            if (probll.Add(pro))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"招聘信息添加成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }

    }
    //修改招聘
    public void EditZhaoPin(HttpContext context)
    {
        int pid = Convert.ToInt32(context.Request["pid"]);
        string ProductName = context.Request["txt2"];
        string PriceRange = context.Request["txt5"];
        string ProductMan = context.Request["txt1"];
        string ProductPhone = context.Request["txt4"];
        string ProductAddress = context.Request["txt3"];
        string Description = context.Request["txt6"];
        string txt9 = context.Request["txt9"];

        if (string.IsNullOrEmpty(ProductName))
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"标题名称不能为空\"}");
            return;
        }

        YS_ProductBLL probll = new YS_ProductBLL();
        YS_Product pro = probll.GetModel(pid);
        pro.Description = Description;
        pro.InputTime = DateTime.Now;
        pro.IsHot = true;
        pro.OverTime = new DateTime(9999, 12, 30);
        pro.Price = 0;
        pro.PriceRange = PriceRange;
        pro.ProductAddress = ProductAddress;
        pro.ProductKey = "招聘";
        pro.ProductMan = ProductMan;
        pro.ProductName = ProductName;
        pro.ProductPhone = ProductPhone;
        pro.ProductType = YS_Enum.ProductType.职位;
        pro.ProductXinJiu = txt9;
        pro.Promotion = 0;
        pro.Sales = 0;
        pro.StartTime = DateTime.Now;
        pro.State = YS_Enum.ProductState.默认;
        pro.Stock = 0;

        try
        {
            if (probll.Update(pro))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"招聘信息修改成功\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        catch
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }

    }

    public void GetUser(HttpContext context)
    {
        string username = context.Request["username"];
        YS_UserBLL ubll = new YS_UserBLL();
        YS_User u = ubll.GetModel(username);
        if (u == null)
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"用户不存在\"}");
            return;
        }
        if (u.Question == "后台创建-非注册会员")
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"该用户不允许自助找回密码。请联系网站管理员重置密码!\"}");
            return;
        }
        if (u.UserType == YS_Enum.UserType.管理员)
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"该用户不允许自助找回密码。请联系网站管理员重置密码!\"}");
            return;
        }
        context.Response.Write("{\"flag\":\"true\",\"msg\":\"" + u.Question + "\"}");
    }
    public void FindUser(HttpContext context)
    {
        string username = context.Request["username"];
        string answer = context.Request["answer"];
        YS_UserBLL ubll = new YS_UserBLL();
        YS_User u = ubll.GetModel(username);
        if (u == null)
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"用户不存在\"}");
            return;
        }
        if (u.Question == "后台创建-非注册会员")
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"该用户不允许自助找回密码。请联系网站管理员重置密码!\"}");
            return;
        }
        if (u.UserType == YS_Enum.UserType.管理员)
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"该用户不允许自助找回密码。请联系网站管理员重置密码!\"}");
            return;
        }
        if (u.Answer == answer)
        {
            u.Password = HashEncode.MD5("123456");
            if (ubll.Update(u))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"密码已重置为123456，请及时修改!\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }
        }
        else
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"答案错误请重新输入!\"}");
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