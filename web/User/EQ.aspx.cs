using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.BLL;
using YS_WEB.Model;
using Maticsoft.Common;

public partial class User_EQ : System.Web.UI.Page
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

            this.RegisteruserNameTxt.Value = p.ProductName;
            this.Registerpassword.Value = p.ProductXinJiu;
            this.Registerpassword2.Value = p.Price.ToString("f2");
            this.RegisterText4.Value = p.ProductAddress;
            this.RegisterText5.Value = p.ProductMan;
            this.RegisterText6.Value = p.ProductPhone;
            this.RegisterText7.Value = p.Description;
        }
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
                if (!FileOper.ExistsFold(Server.MapPath("~/ProductImg/esImg/")))
                {
                    FileOper.CreateFold(Server.MapPath("~/ProductImg/esImg/"));
                }
                fileMessage = FileOper.UploadFile(FileUpload1, Server.MapPath("~/ProductImg/esImg/"), true);

                try
                {
                    string ProductName = this.RegisteruserNameTxt.Value;//器材名称
                    string ProductXinJiu = this.Registerpassword.Value;//新旧程度
                    string Price = this.Registerpassword2.Value;//价&nbsp;&nbsp;格
                    string ProductAddress = this.RegisterText4.Value;//所在城市
                    string ProductMan = this.RegisterText5.Value;//联系人
                    string ProductPhone = this.RegisterText6.Value;//联系电话
                    string Description = this.RegisterText7.Value;//详细描述

                    if (string.IsNullOrEmpty(ProductName))
                    {
                        MessageBox.Show(this, "器材名称不能为空");
                        //context.Response.Write("{\"flag\":\"false\",\"msg\":\"器材名称不能为空\"}");
                        return;
                    }
                    if (!PageValidate.IsDecimal(Price))
                    {
                        MessageBox.Show(this, "价格格式不对");
                        //context.Response.Write("{\"flag\":\"false\",\"msg\":\"价格格式不对\"}");
                        return;
                    }


                    YS_ProductBLL probll = new YS_ProductBLL();
                    YS_Product pro = new YS_Product();
                    pro.Description = Description;
                    pro.InputTime = DateTime.Now;
                    pro.IsHot = true;
                    pro.OverTime = new DateTime(9999, 12, 30);
                    pro.Price = Convert.ToDecimal(Price);
                    pro.PriceRange = fileMessage.FileName;
                    pro.ProductAddress = ProductAddress;
                    pro.ProductKey = "";
                    pro.ProductMan = ProductMan;
                    pro.ProductName = ProductName;
                    pro.ProductPhone = ProductPhone;
                    pro.ProductType = YS_Enum.ProductType.二手;
                    pro.ProductXinJiu = ProductXinJiu;
                    pro.Promotion = 0;
                    pro.Sales = 0;
                    pro.StartTime = DateTime.Now;
                    pro.State = YS_Enum.ProductState.默认;
                    pro.Stock = 0;

                    pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
                    pro.UserName = Tool.CookieGet("UserName");

                    try
                    {
                        if (probll.Add(pro))
                        {
                            MessageBox.Show(this, "二手器材发布成功");
                            //context.Response.Write("{\"flag\":\"true\",\"msg\":\"二手器材发布成功\"}");
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
    protected void Button2_Click(object sender, EventArgs e)
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
                if (!FileOper.ExistsFold(Server.MapPath("~/ProductImg/esImg/")))
                {
                    FileOper.CreateFold(Server.MapPath("~/ProductImg/esImg/"));
                }
                fileMessage = FileOper.UploadFile(FileUpload1, Server.MapPath("~/ProductImg/esImg/"), true);

                try
                {
                    int pid = Convert.ToInt32(Request["itemid"]);
                    string ProductName = this.RegisteruserNameTxt.Value;//器材名称
                    string ProductXinJiu = this.Registerpassword.Value;//新旧程度
                    string Price = this.Registerpassword2.Value;//价&nbsp;&nbsp;格
                    string ProductAddress = this.RegisterText4.Value;//所在城市
                    string ProductMan = this.RegisterText5.Value;//联系人
                    string ProductPhone = this.RegisterText6.Value;//联系电话
                    string Description = this.RegisterText7.Value;//详细描述

                    if (string.IsNullOrEmpty(ProductName))
                    {
                        MessageBox.Show(this, "器材名称不能为空");
                        //context.Response.Write("{\"flag\":\"false\",\"msg\":\"器材名称不能为空\"}");
                        return;
                    }
                    if (!PageValidate.IsDecimal(Price))
                    {
                        MessageBox.Show(this, "价格格式不对");
                        //context.Response.Write("{\"flag\":\"false\",\"msg\":\"价格格式不对\"}");
                        return;
                    }


                    YS_ProductBLL probll = new YS_ProductBLL();
                    YS_Product pro = probll.GetModel(pid);
                    pro.Description = Description;
                    pro.InputTime = DateTime.Now;
                    pro.IsHot = true;
                    pro.OverTime = new DateTime(9999, 12, 30);
                    pro.Price = Convert.ToDecimal(Price);
                    pro.PriceRange = fileMessage.FileName;
                    pro.ProductAddress = ProductAddress;
                    pro.ProductKey = "";
                    pro.ProductMan = ProductMan;
                    pro.ProductName = ProductName;
                    pro.ProductPhone = ProductPhone;
                    pro.ProductType = YS_Enum.ProductType.二手;
                    pro.ProductXinJiu = ProductXinJiu;
                    pro.Promotion = 0;
                    pro.Sales = 0;
                    pro.StartTime = DateTime.Now;
                    pro.State = YS_Enum.ProductState.默认;
                    pro.Stock = 0;

                    pro.UserID = Convert.ToInt32(Tool.CookieGet("UserID"));
                    pro.UserName = Tool.CookieGet("UserName");

                    try
                    {
                        if (probll.Update(pro))
                        {
                            MessageBox.Show(this, "二手器材修改成功");
                            //context.Response.Write("{\"flag\":\"true\",\"msg\":\"二手器材修改成功\"}");
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