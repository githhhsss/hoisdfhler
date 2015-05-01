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
using System.IO;

public partial class User_Default : System.Web.UI.Page
{
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

    }
    protected void AddPro_Click(object sender, EventArgs e)
    {
        AddZiXun();
    }
    public void AddZiXun()
    {
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.FileBytes.Length > 2048000)
            {
                MessageBox.Show(this, "上传文件不能大于2M");
                return;
            }
            FileMessage fileMessage = new FileMessage();
            string fileType = FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf('.')).ToLower();
            if (fileType == ".jpg" || fileType == ".jpeg" || fileType == ".png" || fileType == ".gif")
            {
                if (!FileOper.ExistsFold(Server.MapPath("~/Information/InformationImg/")))
                {
                    FileOper.CreateFold(Server.MapPath("~/Information/InformationImg/"));
                }
                fileMessage = FileOper.UploadFile(FileUpload1, Server.MapPath("~/Information/InformationImg/"), true);
                try
                {
                    string ProductName = ptxt1.Value;
                    string ProductKey = ptxt4.Value;
                    string Description = HiddenField1.Value;


                    if (string.IsNullOrEmpty(ProductName))
                    {
                        MessageBox.Show(this, "标题不能为空");
                        //context.Response.Write("{\"flag\":\"false\",\"msg\":\"器材名称不能为空\"}");
                        return;
                    }
                    if (string.IsNullOrEmpty(ProductKey))
                    {
                        MessageBox.Show(this, "关键字");
                        //context.Response.Write("{\"flag\":\"false\",\"msg\":\"价格格式不对\"}");
                        return;
                    }


                    YS_ProductBLL probll = new YS_ProductBLL();
                    YS_Product pro = new YS_Product();
                    pro.Description = Description;
                    pro.InputTime = DateTime.Now;
                    pro.IsHot = true;
                    pro.OverTime = new DateTime(9999, 12, 30);
                    pro.Price = 0;
                    pro.PriceRange = fileMessage.FileName; ;
                    pro.ProductAddress = "";
                    pro.ProductKey = ProductKey;
                    pro.ProductMan = "";
                    pro.ProductName = ProductName;
                    pro.ProductPhone = "";
                    pro.ProductType = (YS_Enum.ProductType)Convert.ToInt32(content.Value);
                    pro.ProductXinJiu = "";
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

                    if (probll.Add(pro))
                    {
                        MessageBox.Show(this, "资讯添加成功");
                        //  context.Response.Write("{\"flag\":\"true\",\"msg\":\"资讯添加成功\"}");
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
                    //   context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
                    return;
                }

            }
        }
    }
}