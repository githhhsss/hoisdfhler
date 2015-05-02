using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YS_WEB.Model;
using YS_WEB.BLL;
using System.Data;
using Maticsoft.Common.DEncrypt;
using Maticsoft.Common;
using System.Text;
using Microsoft.Office.Core;
using Microsoft.Office.Interop.Excel;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Configuration;
using Maticsoft.DBUtility;

public partial class Admin_DownloadExcel : System.Web.UI.Page
{
    [DllImport("User32.dll", CharSet = CharSet.Auto)]
    public static extern int GetWindowThreadProcessId(IntPtr hwnd, out int ID);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ChangeMyInformation_Click(object sender, EventArgs e)
    {
        DataSet ds = DbHelperSQL.Query("select id,ProductName,Price,Stock,ProductKey,ProductAddress,Description from YS_Product where ProductType in (1)");
        exporToExcel(ds, "商品资料.xls");
    }
    public void exporToExcel(DataSet ds, string FileName)
    {

        HttpResponse resp;
        resp = Page.Response;
        resp.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        resp.AppendHeader("Content-Disposition", "attachment;filename=" + FileName);
        string colHeaders = "", ls_item = "";

        //定义表对象与行对象，同时用DataSet对其值进行初始化
        System.Data.DataTable dt = ds.Tables[0];
        DataRow[] myRow = dt.Select();//可以类似dt.Select("id>10")之形式达到数据筛选目的
        int i = 0;
        int cl = dt.Columns.Count;
        object[] myhead = { "序号", "商品名称", "价格", "库存", "关键字", "图片路径", "产品介绍" };

        //取得数据表各列标题，各标题之间以\t分割，最后一个列标题后加回车符
        for (i = 0; i < cl; i++)
        {
            if (i == (cl - 1))//最后一列，加\n
            {
                colHeaders += myhead[i].ToString() + "\n";
            }
            else
            {
                colHeaders += myhead[i].ToString() + "\t";
            }

        }
        resp.Write(colHeaders);
        //向HTTP输出流中写入取得的数据信息

        //逐行处理数据  
        foreach (DataRow row in myRow)
        {
            //当前行数据写入HTTP输出流，并且置空ls_item以便下行数据    
            for (i = 0; i < cl; i++)
            {
                if (i == (cl - 1))//最后一列，加\n
                {
                    ls_item += row[i].ToString() + "\n";
                }
                else
                {
                    ls_item += row[i].ToString() + "\t";
                }

            }
            resp.Write(ls_item);
            ls_item = "";

        }
        resp.End(); 

    }
    ///
    /// 将DataTable导入到Excel中
    ///
    /// 数据源
    /// 目标Excel
    public void exportToExcel(System.Data.DataTable dt, string filename)
    {
        try
        {
            //需要添加.Net中的引用
            Microsoft.Office.Interop.Excel.Application myExcel = new Microsoft.Office.Interop.Excel.Application();//创建Excel
            myExcel.Visible = true;
            Microsoft.Office.Interop.Excel.Workbooks myWorkbooks = myExcel.Workbooks;//创建Excel工作表
            Microsoft.Office.Interop.Excel.Workbook myWorkbook = myWorkbooks.Add(System.Reflection.Missing.Value);//创建工作表
            //创建Sheet
            Microsoft.Office.Interop.Excel.Worksheet myWorksheet = (Microsoft.Office.Interop.Excel.Worksheet)myWorkbook.Worksheets[1];

            Microsoft.Office.Interop.Excel.Range myrange = myWorksheet.get_Range("C1", "D1");//获取存储范围


            object[] myhead = { "序号", "商品名称","价格","库存","关键字","图片路径","产品介绍" };//表头
            myrange.Value2 = myhead;
            if (dt.Rows.Count > 0)
            {
                myrange = myWorksheet.get_Range("A2", System.Reflection.Missing.Value);
                int row = dt.Rows.Count;
                int col = dt.Columns.Count;
                object[,] mydata = new object[row, col];
                for (int i = 0; i < row; i++)
                {
                    for (int j = 0; j < col; j++)
                    {
                        mydata[i, j] = dt.Rows[i][j].ToString();
                    }
                }
                myrange = myrange.get_Resize(row, col);
                myrange.Value2 = mydata;
                myrange.EntireColumn.AutoFit();//调整列宽为自动列宽
            }
            if (File.Exists(filename))
                File.Delete(filename);
            object missing = System.Reflection.Missing.Value;
            myWorkbook.SaveAs(filename, missing, missing, missing, missing, missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlNoChange, missing, missing, missing, missing, missing);
            myExcel = null;//清空表单
        }
        catch (Exception ex)
        {
            // MessageBox.Show(ex.Message);
        }
    }
}