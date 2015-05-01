using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;
using Maticsoft.Common;

public partial class User_Vrecommendation : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (string.IsNullOrEmpty(Request["itemid"]))
        {

        }
        else
        {
            int id = 0;
            int.TryParse(Request["itemid"].ToString(), out id);
            YS_ProductBLL bll = new YS_ProductBLL();
            YS_Product p = bll.GetModel(id);

            //this.RegisteruserNameTxt.Value = p.ProductAddress;
            this.Textname.Value = p.ProductName;
            this.RegisterText7.Value = p.Description;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
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
                if (!FileOper.ExistsFold(Server.MapPath("~/ProductImg/esImg/")))
                {
                    FileOper.CreateFold(Server.MapPath("~/ProductImg/esImg/"));
                }
                fileMessage = FileOper.UploadFile(FileUpload1, Server.MapPath("~/ProductImg/esImg/"), true);

            }
            else
            {
                MessageBox.Show(this, "上传格式不支持，本站点支持jpg,jpeg,png,gif格式的图片");
                return;
            }
        }
        else
        {
            MessageBox.Show(this, "请先选择文件，本站点支持jpg,jpeg,png,gif格式的图片");
            return;
        }
        FileMessage fileMessage2 = new FileMessage();
        if (FileUpload2.HasFile)
        {
            if (FileUpload2.FileBytes.Length > 1048000000)
            {
                MessageBox.Show(this, "上传文件不能大于1G");
                return;
            }

            string fileType = FileUpload2.FileName.Substring(FileUpload2.FileName.LastIndexOf('.')).ToLower();
            if (fileType == ".mp4")
            {
                if (!FileOper.ExistsFold(Server.MapPath("~/VedioUp/")))
                {
                    FileOper.CreateFold(Server.MapPath("~/VedioUp/"));
                }
                fileMessage2 = FileOper.UploadFile(FileUpload2, Server.MapPath("~/VedioUp/"), true);

            }
            else
            {
                MessageBox.Show(this, "上传格式不支持，本站点支持mp4格式的视频");
                return;
            }
        }
        else
        {
            MessageBox.Show(this, "请先选择文件，本站点支持mp4格式的视频");
            return;
        }
        try
        {
            int pid = Convert.ToInt32(Request["itemid"]);
            string ProductName = this.Textname.Value;//名称
            string ProductAddress = fileMessage2.FileName;//视频连接

            string Description = this.RegisterText7.Value;//详细描述
            string stock = DropDownList1.SelectedValue;//类型


            YS_ProductBLL probll = new YS_ProductBLL();
            YS_Product pro = new YS_Product();
            pro.Description = Description;
            pro.InputTime = DateTime.Now;
            pro.IsHot = true;
            pro.OverTime = new DateTime(9999, 12, 30);
            pro.Price = Convert.ToDecimal(0);
            pro.PriceRange = fileMessage.FileName;
            pro.ProductAddress = ProductAddress;
            pro.ProductKey = "";
            pro.ProductMan = "";
            pro.ProductName = ProductName;
            pro.ProductPhone = "";
            pro.ProductType = YS_Enum.ProductType.视频;
            pro.ProductXinJiu = "";
            pro.Promotion = 0;
            pro.Sales = 0;
            pro.StartTime = DateTime.Now;
            pro.State = YS_Enum.ProductState.默认;
            pro.Stock = Convert.ToInt32(stock);

            pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
            pro.UserName = Tool.CookieGet("UserName");

            try
            {
                if (probll.Add(pro))
                {
                    MessageBox.Show(this, "视频推荐发布成功");
                    //context.Response.Write("{\"flag\":\"true\",\"msg\":\"视频推荐修改成功\"}");
                    return;
                }
                else
                {
                    MessageBox.Show(this, "未知错误");
                    //context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                    return;
                }

            }
            catch
            {
                MessageBox.Show(this, "数据库异常");
                //context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
                return;
            }

        }
        catch
        {
            MessageBox.Show(this, "添加失败");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

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
                if (!FileOper.ExistsFold(Server.MapPath("~/ProductImg/esImg/")))
                {
                    FileOper.CreateFold(Server.MapPath("~/ProductImg/esImg/"));
                }
                fileMessage = FileOper.UploadFile(FileUpload1, Server.MapPath("~/ProductImg/esImg/"), true);

            }
            else
            {
                MessageBox.Show(this, "上传格式不支持，本站点支持jpg,jpeg,png,gif格式的图片");
                return;
            }
        }
        FileMessage fileMessage2 = new FileMessage();
        if (FileUpload2.HasFile)
        {
            if (FileUpload2.FileBytes.Length > 1048000000)
            {
                MessageBox.Show(this, "上传文件不能大于1G");
                return;
            }

            string fileType = FileUpload2.FileName.Substring(FileUpload2.FileName.LastIndexOf('.')).ToLower();
            if (fileType == ".mp4" )
            {
                if (!FileOper.ExistsFold(Server.MapPath("~/VedioUp/")))
                {
                    FileOper.CreateFold(Server.MapPath("~/VedioUp/"));
                }
                fileMessage2 = FileOper.UploadFile(FileUpload2, Server.MapPath("~/VedioUp/"), true);

            }
            else
            {
                MessageBox.Show(this, "上传格式不支持，本站点支持mp4格式的视频");
                return;
            }
        }
        try
        {
            int pid = Convert.ToInt32(Request["itemid"]);
            string ProductName = this.Textname.Value;//名称
            string ProductAddress = fileMessage2.FileName;//视频连接

            string Description = this.RegisterText7.Value;//详细描述
            string stock = DropDownList1.SelectedValue;//类型

            YS_ProductBLL probll = new YS_ProductBLL();
            YS_Product pro = probll.GetModel(pid);
            pro.Description = Description;
            pro.InputTime = DateTime.Now;
            pro.IsHot = true;
            pro.OverTime = new DateTime(9999, 12, 30);
            pro.Price = Convert.ToDecimal(0);
            if (fileMessage.FileSize <= 0)
            {
                pro.PriceRange = pro.PriceRange;
            }
            else
            {
                pro.PriceRange = fileMessage.FileName;
            }
            if (fileMessage2.FileSize <= 0)
            {
                pro.ProductAddress = pro.ProductAddress;
            }
            else
            {
                pro.ProductAddress = ProductAddress;
            }
            pro.ProductKey = "";
            pro.ProductMan = "";
            pro.ProductName = ProductName;
            pro.ProductPhone = "";
            pro.ProductType = YS_Enum.ProductType.视频;
            pro.ProductXinJiu = "";
            pro.Promotion = 0;
            pro.Sales = 0;
            pro.StartTime = DateTime.Now;
            pro.State = YS_Enum.ProductState.默认;
            pro.Stock = Convert.ToInt32(stock);

            pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
            pro.UserName = Tool.CookieGet("UserName");

            try
            {
                if (probll.Update(pro))
                {
                    MessageBox.Show(this, "视频推荐修改成功");
                    //context.Response.Write("{\"flag\":\"true\",\"msg\":\"视频推荐修改成功\"}");
                    return;
                }
                else
                {
                    MessageBox.Show(this, "未知错误");
                    //context.Response.Write("{\"flag\":\"false\",\"msg\":\"未知错误\"}");
                    return;
                }

            }
            catch
            {
                MessageBox.Show(this, "数据库异常");
                //context.Response.Write("{\"flag\":\"false\",\"msg\":\"数据库异常\"}");
                return;
            }

        }
        catch
        {
            MessageBox.Show(this, "添加失败");
        }


    }
}