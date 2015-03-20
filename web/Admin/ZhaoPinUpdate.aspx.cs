using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.Common;
using YS_WEB.Model;
using YS_WEB.BLL;
using Maticsoft.DBUtility;

public partial class User_Default : System.Web.UI.Page
{
    public string editor = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //如果未登陆，转到登陆页
        if (string.IsNullOrEmpty(Tool.CookieGet("UserName")))
        {
            Response.Redirect("Login.aspx");
        }

        YS_UserBLL userbll = new YS_UserBLL();
        YS_User user = userbll.GetModel(Tool.CookieGet("UserName"));

        if (user.UserType != YS_Enum.UserType.管理员)
        {
            Response.Redirect("Login.aspx");
        }

        this.jifen.InnerText = user.Score.ToString();

        this.fensi.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where attentionID = " + user.ID + "").ToString();
        this.guanzhu.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where BeConcernedID = " + user.ID + "").ToString();

        this.renqi.InnerText = (Convert.ToInt32(fensi.InnerText) * 100).ToString();
        this.readName.InnerText = user.ReadName;
        if (user.HeadImg != "")
        {
            this.headImg.Src = "../User/" + user.HeadImg;
        }
        this.name.InnerText = user.UserName;
        this.city.InnerText = user.UserType.ToString();


        if (!string.IsNullOrEmpty(Request["itemid"]))
        {
            int pid = Convert.ToInt32(Request["itemid"]);
            YS_ProductBLL probll = new YS_ProductBLL();
            YS_Product pro = probll.GetModel(pid);

            this.ptxt1.Value = pro.ProductMan;
            this.ptxt2.Value = pro.ProductName;
            this.ptxt3.Value = pro.ProductAddress;
            this.ptxt4.Value = pro.ProductPhone; ;
            this.ptxt9.Value = pro.ProductXinJiu;
            this.Select3.Value = pro.PriceRange;
            editor = StringToJson(pro.Description);
        }
        else
        {
            Response.Redirect("ZhaoPinAdd.aspx");
        }
    }
    public string GetEditor()
    {
        return editor;
    }
    /// <summary>
    /// 转义json特殊字符
    /// </summary>
    /// <param name="s"></param>
    /// <returns></returns>
    protected static string StringToJson(string s)
    {
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        for (int i = 0; i < s.Length; i++)
        {
            char c = s[i];
            switch (c)
            {
                case '\"':
                    sb.Append("\\\"");
                    break;
                case '\\':
                    sb.Append("\\\\");
                    break;
                case '/':
                    sb.Append("\\/");
                    break;
                case '\b':
                    sb.Append("\\b");
                    break;
                case '\f':
                    sb.Append("\\f");
                    break;
                case '\n':
                    sb.Append("\\n");
                    break;
                case '\r':
                    sb.Append("\\r");
                    break;
                case '\t':
                    sb.Append("\\t");
                    break;
                default:
                    sb.Append(c); break;
            }
        }
        return sb.ToString();
    }

}