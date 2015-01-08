using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebControls_WebFoot : System.Web.UI.UserControl
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

    }
}