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

            this.ptxt1.Value = pro.ProductName;
            this.ptxt4.Value = pro.ProductKey;
            this.content.SelectedValue = Convert.ToInt32((YS_Enum.ProductType)pro.ProductType).ToString();
            Image1.ImageUrl = "../Information/InformationImg/" + pro.PriceRange;
            editor = StringToJson(pro.Description);
        }
        else
        {
            Response.Redirect("ZiXunAdd.aspx");
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
    protected void AddPro_Click(object sender, EventArgs e)
    {
        EditPro();
    }
    public void EditPro()
    {
        int pid = Convert.ToInt32(Request["itemid"]);
        string ProductName = ptxt1.Value ;
        string Price = "0";
        string Promotion = "0";
        string State = "0";
        string Description = HiddenField1.Value;
        string Stock = "0";
        string ProductKey = ptxt4.Value;
        string pimg ="";
        string ishot ="否";
        string ProductType = content.SelectedValue;
        FileMessage fileMessage = new FileMessage();
        if (FileUpload1.HasFile)
        {
           
            if (FileUpload1.FileBytes.Length > 2048000)
            {
                MessageBox.Show(this, "上传文件不能大于2M");
                return;
            }
           
            string fileType = FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf('.')).ToLower();
            if (fileType == ".jpg" || fileType == ".jpeg" || fileType == ".png" || fileType == ".gif")
            {
                if (!FileOper.ExistsFold(Server.MapPath("~/Information/InformationImg/")))
                {
                    FileOper.CreateFold(Server.MapPath("~/Information/InformationImg/"));
                }
                fileMessage = FileOper.UploadFile(FileUpload1, Server.MapPath("~/Information/InformationImg/"), true);
            }

        }
        if (string.IsNullOrEmpty(ProductName))
        {
           // context.Response.Write("{\"flag\":\"false\",\"msg\":\"标题不能为空\"}");
            return;
        }
       

        YS_ProductBLL probll = new YS_ProductBLL();
        YS_Product pro = probll.GetModel(pid);
        pro.Description = Description;
        pro.InputTime = DateTime.Now;
        pro.IsHot = ishot == "是" ? true : false;
        pro.OverTime = new DateTime(9999, 12, 30);
        pro.Price = Convert.ToDecimal(Price);
        if (fileMessage.FileSize<=0)
        {
            pro.PriceRange = pro.PriceRange;
        }
        else
        {
            pro.PriceRange = fileMessage.FileName;
        }
        pro.ProductAddress = pimg;
        pro.ProductKey = ProductKey;
        pro.ProductMan = "";
        pro.ProductName = ProductName;
        pro.ProductPhone = "";
        pro.ProductType = (YS_Enum.ProductType)Convert.ToInt32(ProductType);
        pro.ProductXinJiu = "";
        pro.Promotion = Convert.ToDecimal(Promotion);
        pro.Sales = 0;
        pro.StartTime = DateTime.Now;
        pro.State = (YS_Enum.ProductState)Enum.Parse(typeof(YS_Enum.ProductState), State);
        pro.Stock = Convert.ToInt32(Stock);

        try
        {
            if (probll.Update(pro))
            {
                MessageBox.Show(this, "修改成功");
              //  context.Response.Write("{\"flag\":\"true\",\"msg\":\"产品修改成功\"}");
                return;
            }
            else
            {
                MessageBox.Show(this, "未知错误");
               // context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                return;
            }

        }
        catch
        {
            MessageBox.Show(this, "数据库异常");
           // context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
            return;
        }

    }
}