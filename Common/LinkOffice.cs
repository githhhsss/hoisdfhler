using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
///LinkOffice 的摘要说明
/// </summary>
public class LinkOffice
{
	public LinkOffice()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public DataTable ReadExcelToTable(string path)
    {
        //连接字符串
        //string connstring = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=1';"; // Office 07及以上版本 不能出现多余的空格 而且分号注意
        string connstring = "Provider=Microsoft.JET.OLEDB.4.0;Data Source=" + path + ";Extended Properties='Excel 8.0;HDR=NO;IMEX=1';"; //Office 07以下版本 因为本人用Office2010 所以没有用到这个连接字符串 可根据自己的情况选择 或者程序判断要用哪一个连接字符串
        using (OleDbConnection conn = new OleDbConnection(connstring))
        {
            conn.Open();
            DataTable sheetsName = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "Table" }); //得到所有sheet的名字
            string firstSheetName = sheetsName.Rows[0][2].ToString(); //得到第一个sheet的名字
            string sql = string.Format("SELECT * FROM [{0}]", firstSheetName); //查询字符串
            OleDbDataAdapter ada = new OleDbDataAdapter(sql, connstring);
            DataSet set = new DataSet();
            ada.Fill(set);
            return set.Tables[0];
        }
    }
}