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
    //注册用户
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
    //用户登陆
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
    //修改密码
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
    //更改用户信息
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
            user.E_Mail =  e_mail;
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
    //增加新用户
    public void AddUser(HttpContext context)
    {
        string username = context.Request["username"];
        string password = "123456";
        string e_mail = context.Request["e_mail"];
        string question = "后台创建-非注册会员";
        string answer = "后台创建-非注册会员";
        string address = context.Request["address"];
        string company = context.Request["company"];
        string companyGM = context.Request["companyGM"];
        string companyType = context.Request["companyType"];
        string companyWebAdderss = context.Request["companyWebAdderss"];
        string readName = context.Request["readName"];
        string userType = context.Request["userType"];
        

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
        user.Address = address;
        user.Birthday = DateTime.Now;
        user.Company = company;
        user.CompanyGM = companyGM;
        user.CompanyType = companyType;
        user.CompanyWebAdderss = companyWebAdderss;
        user.HeadImg = "";
        user.MyMoney = 0;
        user.ReadName = readName;
        user.Score = 0;
        user.UserType = (YS_Enum.UserType)Enum.Parse(typeof(YS_Enum.UserType), userType); 

        try
        {
            if (userbll.Add(user))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"注册用户成功\"}");
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
    //重置用户密码
    public void UpdatePassword(HttpContext context)
    {
        int UID = Convert.ToInt32(context.Request["ID"]);
        
        YS_UserBLL userbll = new YS_UserBLL();
        YS_User user = userbll.GetModel(UID);
        if (user != null)
        {
            user.Password = HashEncode.MD5("123456");
            if (userbll.Update(user))
            {
                context.Response.Write("{\"flag\":\"true\",\"msg\":\"密码重置成功\"}");
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

    //删除用户
    public void DeleteUser(HttpContext context)
    {
        int UID = Convert.ToInt32(context.Request["ID"]);

        YS_UserBLL userbll = new YS_UserBLL();
        YS_User user = userbll.GetModel(UID);
        if (user != null)
        {
            if (userbll.Delete(user))
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
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}