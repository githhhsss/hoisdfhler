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

        this.jifen.InnerText = user.Score.ToString();

        this.fensi.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where attentionID = " + user.ID + "").ToString();
        this.guanzhu.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where BeConcernedID = " + user.ID + "").ToString();

        this.renqi.InnerText = (Convert.ToInt32(fensi.InnerText) * 100).ToString();
        this.readName.InnerText = user.ReadName;
        this.headImg.Src = user.HeadImg;
        this.userImg.Src = user.HeadImg;
        this.name.InnerText = user.UserName;
        this.city.InnerText = user.UserType.ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.FileBytes.Length > 204800)
            {
                HiddenField1.Value = "true";
                HiddenField2.Value = "上传文件大小不能超过200K";
                return;
            }
            FileMessage fileMessage = new FileMessage();
            string fileType = FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf('.')).ToLower();
            if (fileType == ".jpg" || fileType == ".jpeg" || fileType == ".png" || fileType == ".gif")
            {
                if (!FileOper.ExistsFold(Server.MapPath("UserPic/")))
                {
                    FileOper.CreateFold(Server.MapPath("UserPic/"));
                }
                fileMessage = FileOper.UploadFile(FileUpload1, Server.MapPath("UserPic/"), true);

                YS_UserBLL userbll = new YS_UserBLL();
                YS_User user = userbll.GetModel(Tool.CookieGet("UserName"));

                string oldPath = Server.MapPath(user.HeadImg);
                user.HeadImg = "UserPic/" + fileMessage.FileName;

                userbll.Update(user);

                this.headImg.Src = user.HeadImg;
                this.userImg.Src = user.HeadImg;
                FileOper.DeleteFile(oldPath);//删除历史头像
                HiddenField1.Value = "false";
            }
            else
            {
                HiddenField1.Value = "true";
                HiddenField2.Value = "上传格式不支持，本站点支持jpg,jpeg,png,gif格式的图片";
            }
        }
        else
        {
            HiddenField1.Value = "true";
            HiddenField2.Value = "请先选择文件，本站点支持jpg,jpeg,png,gif格式的图片";
        }
    }
}