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
        user.Password = HashEncode.HashEncoding(password);
        user.E_Mail = e_mail;
        user.Question = question;
        user.Answer = answer;
        user.Address = "";
        user.Birthday = new DateTime(1800, 1, 1);
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
        YS_User user = userbll.GetModel(username, HashEncode.HashEncoding(password));
        if (user != null)
        {
            Tool.CookieWrite("UserName", user.UserName);
            Tool.CookieWrite("ReadName", user.ReadName);
            Tool.CookieWrite("UserID", user.ID.ToString());
            context.Response.Write("{\"flag\":\"true\",\"msg\":\"登陆成功\"}"); 
        }
        else
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"用户名或者密码错误\"}");
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