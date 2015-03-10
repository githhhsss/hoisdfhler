using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;

public partial class WebControls_WebTop : System.Web.UI.UserControl
{
    private string _Path;
    /// <summary>  
    /// 距离根目录的路径  
    /// </summary>  
    public string MyPath
    {
        get
        {
            _Path = "";
            string[] m = Request.FilePath.Split('/');
            for (int i = 2; i < m.Length; i++)
            {
                _Path = "../" + _Path;
            }
            return _Path;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Tool.CookieGet("UserName")))
        {
            is_login.Visible = false;
            no_login.Visible = true;
        }
        else
        {
            is_login.Visible = true;
            no_login.Visible = false;
            login_User.InnerHtml = "<span style='color:#FFF;'>" + Tool.CookieGet("ReadName") + "</span>";
            login_Out.InnerHtml = "<span style='color:#FFF;'>退出</span>";
        }
    }
}