<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

public class Handler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        // 反射方法
        string cmd = context.Request["cmd"];
        if (cmd != "")
        {
            System.Reflection.MethodInfo Remethod = this.GetType().GetMethod(cmd);
            if (Remethod != null) { Remethod.Invoke(this, new object[] { context }); }
        }
        else
        {
            context.Response.Write("{\"flag\":\"false\",\"msg\":\"非法操作\"}");
        }
    }

    public void RegisterUser(HttpContext context)
    {
        context.Response.Write("{\"flag\":\"false\",\"msg\":\"非法操作\"}");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}