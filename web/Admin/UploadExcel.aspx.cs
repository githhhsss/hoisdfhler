using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using YS_WEB.BLL;
using YS_WEB.Model;
using Maticsoft.Common;

public partial class Admin_UploadExcel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //如果未登陆，转到登陆页
        //if (string.IsNullOrEmpty(Tool.CookieGet("UserName")))
        //{
        //    Response.Redirect("Login.aspx");
        //}

        //YS_UserBLL userbll = new YS_UserBLL();
        //YS_User user = userbll.GetModel(Tool.CookieGet("UserName"));

        //if (user.UserType != YS_Enum.UserType.管理员)
        //{
        //    Response.Redirect("Login.aspx");
        //}

        //this.jifen.InnerText = user.Score.ToString();

        //this.fensi.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where attentionID = " + user.ID + "").ToString();
        //this.guanzhu.InnerText = DbHelperSQL.GetSingle("select count(*) from YS_Attention where BeConcernedID = " + user.ID + "").ToString();

        //this.renqi.InnerText = (Convert.ToInt32(fensi.InnerText) * 100).ToString();
        //this.readName.InnerText = user.ReadName;
        //if (user.HeadImg != "")
        //{
        //    this.headImg.Src = "../User/" + user.HeadImg;
        //}
        //this.name.InnerText = user.UserName;
        //this.city.InnerText = user.UserType.ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        UploadFiles(sender, e);
        string fileFullName = Server.MapPath("~/Admin/ImportExcelTemp/" + FileUpload1.FileName);
        string fileType = fileFullName.Substring(fileFullName.LastIndexOf(".") + 1);
        int successfulCount = 0;
        if (fileType.ToUpper() == "XLS" || fileType.ToUpper() == "XLSX" || fileType.ToUpper() == "XLSM" || fileType.ToUpper() == "XLSB")
        {
            try
            {
                DataTable dt = new LinkOffice().ReadExcelToTable(fileFullName);
                int i = 1;
                
                foreach (DataRow row in dt.Rows)
                {

                    if (i == 1)
                    {
                        i++;
                    }
                    else
                    {
                        string ProductName = row[1].ToString();//名称
                        string Price = row[2].ToString();//价格

                        string State = "在售";
                        string Description = row[6].ToString(); ;//产品介绍
                        string Stock = row[3].ToString(); ;//库存
                        string ProductKey = row[4].ToString(); ;//关键字
                        string pimg = row[5].ToString(); ;//图片
                        string ishot = "否";
                        if (string.IsNullOrEmpty(ProductName))
                        {
                            PutScript(string.Format("产品名称不能为空"), this);
                            return;
                        }
                        if (!PageValidate.IsDecimal(Price))
                        {
                            PutScript(string.Format("价格格式不对"), this);
                            return;
                        }
                        //if (!PageValidate.IsDecimal(Promotion))
                        //{ 
                        //    PutScript(string.Format("促销格式不对"), this);
                        //    return;
                        //}
                        if (!PageValidate.IsNumber(Stock))
                        {
                            PutScript(string.Format("库存格式不对"), this);
                            return;
                        }

                        YS_ProductBLL probll = new YS_ProductBLL();
                        YS_Product pro = new YS_Product();
                        pro.Description = Description;
                        pro.InputTime = DateTime.Now;
                        pro.IsHot = ishot == "是" ? true : false;
                        pro.OverTime = new DateTime(9999, 12, 30);
                        pro.Price = Convert.ToDecimal(Price);
                        pro.PriceRange = "";
                        pro.ProductAddress = pimg;
                        pro.ProductKey = ProductKey;
                        pro.ProductMan = "";
                        pro.ProductName = ProductName;
                        pro.ProductPhone = "";
                        pro.ProductType = YS_Enum.ProductType.器材;
                        pro.ProductXinJiu = "";
                        pro.Promotion = Convert.ToDecimal(1);
                        pro.Sales = 0;
                        pro.StartTime = DateTime.Now;
                        pro.State = (YS_Enum.ProductState)Enum.Parse(typeof(YS_Enum.ProductState), State);
                        pro.Stock = Convert.ToInt32(Stock);

                        string username = Tool.CookieGet("UserName");
                        YS_UserBLL userbll = new YS_UserBLL();
                        YS_User user = userbll.GetModel(username);
                        pro.UserID = user.ID;
                        pro.UserName = user.UserName;

                        try
                        {
                            if (probll.Add(pro))
                            {
                                successfulCount++;
                            }
                            else
                            {

                            }

                        }
                        catch { i = 0; throw new Exception("数据库读写错误！请联系网站开发人员，或者检查Excel数据表中是否存在某些字段过长引起的数据错误！"); }
                        i++;
                    }

                    
                }
            }
            catch (Exception ex)
            {
                PutScript("Execl内容不能正确解析，请根据提供的模板使用正确的Excel文件,系统消息:" + ex.Message, this);
            }
            PutScript(string.Format("成功导入{0}条记录", successfulCount), this);
        }
        else
        {
            PutScript("上传文件格式不对。请上传正确的Excel文件", this);
            return;
        }
    }
    public void PutScript(string str, Control col)
    {
        string scriptString = "javascript:confirm(\"" + str.Replace("\"", "\\\"'").Replace("\r\n", "") + "\");";
        ScriptManager.RegisterStartupScript(col, col.GetType(), "script", scriptString, true);
    }
    protected void UploadFiles(object sender, EventArgs e)
    {
        try
        {
            if (HttpContext.Current.Request.Files.Count > 0)
            {
                //System.Web.HttpPostedFile Provides access to individual files that have been uploaded by a client.
                HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];//获得用户提交的文件

                string savePath;
                string dir = HttpContext.Current.Request.PhysicalApplicationPath;//当前应用程序的根目录
                savePath = dir + "Admin/ImportExcelTemp/";//保存文件的目录,要事先添加,不会自己添加
                //string date = DateTime.Now.ToString("yyyy-M-d") + "-" + DateTime.Now.Hour.ToString() + "-" + DateTime.Now.Minute.ToString() + "-" + DateTime.Now.Second.ToString() + "-";//根据自己需要添加
                savePath += Path.GetFileName(postedFile.FileName);
                if (File.Exists(savePath))
                {
                    File.Delete(savePath);//如果文件已经存在就将已存在的文件删除
                }
                postedFile.SaveAs(savePath);//将用户提交的文件postedFile保存为savePath                 
            }
        }
        catch (Exception ex)
        {

        }
    }
}