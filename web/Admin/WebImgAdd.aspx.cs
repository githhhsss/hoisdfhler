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
    protected void Button1_Click(object sender, EventArgs e)
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
                if (!FileOper.ExistsFold(Server.MapPath("~/ProductImg/webImg/")))
                {
                    FileOper.CreateFold(Server.MapPath("~/ProductImg/webImg/"));
                }
                fileMessage = FileOper.UploadFile(FileUpload1, Server.MapPath("~/ProductImg/webImg/"), true);

                try
                {
                    string insertSql = string.Format("insert into YS_WebImg(WebUrl,WebImg,WebTpye,Note,ImgName) values('{0}','{1}','{2}','{3}','{4}')"
                            , myreadnametxt.Value
                            , fileMessage.FileName
                            , Select1.SelectedIndex
                            , mycjjtxt.Value
                            , mynametxt.Value
                            );
                    DbHelperSQL.ExecuteSql(insertSql);
                    MessageBox.Show(this, "添加成功");

                }
                catch
                {
                    MessageBox.Show(this, "添加失败");
                }

            }
            else
            {
                MessageBox.Show(this, "上传格式不支持，本站点支持jpg,jpeg,png,gif格式的图片");
            }
        }
        else
        {
            MessageBox.Show(this, "请先选择文件，本站点支持jpg,jpeg,png,gif格式的图片");
        }
    }
}