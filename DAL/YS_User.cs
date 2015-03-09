﻿using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace YS_WEB.DAL
{
	/// <summary>
	/// 数据访问类:YS_User
	/// </summary>
	public partial class YS_User
	{
		public YS_User()
		{}
		#region  BasicMethod



		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(YS_WEB.Model.YS_User model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into YS_User(");
			strSql.Append("ID,UserName,ReadName,Password,Address,Birthday,E_Mail,UserType,Question,Answer,HeadImg,Score,Company,CompanyType,CompanyGM,CompanyWebAdderss,MyMoney)");
			strSql.Append(" values (");
			strSql.Append("@ID,@UserName,@ReadName,@Password,@Address,@Birthday,@E_Mail,@UserType,@Question,@Answer,@HeadImg,@Score,@Company,@CompanyType,@CompanyGM,@CompanyWebAdderss,@MyMoney)");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@UserName", SqlDbType.NVarChar,50),
					new SqlParameter("@ReadName", SqlDbType.NVarChar,100),
					new SqlParameter("@Password", SqlDbType.NVarChar,50),
					new SqlParameter("@Address", SqlDbType.NVarChar,100),
					new SqlParameter("@Birthday", SqlDbType.DateTime),
					new SqlParameter("@E_Mail", SqlDbType.NVarChar,100),
					new SqlParameter("@UserType", SqlDbType.Int,4),
					new SqlParameter("@Question", SqlDbType.NVarChar,150),
					new SqlParameter("@Answer", SqlDbType.NVarChar,150),
					new SqlParameter("@HeadImg", SqlDbType.NVarChar,200),
					new SqlParameter("@Score", SqlDbType.Int,4),
					new SqlParameter("@Company", SqlDbType.Text),
					new SqlParameter("@CompanyType", SqlDbType.NVarChar,50),
					new SqlParameter("@CompanyGM", SqlDbType.NVarChar,50),
					new SqlParameter("@CompanyWebAdderss", SqlDbType.NVarChar,200),
					new SqlParameter("@MyMoney", SqlDbType.Money,8)};
			parameters[0].Value = model.ID;
			parameters[1].Value = model.UserName;
			parameters[2].Value = model.ReadName;
			parameters[3].Value = model.Password;
			parameters[4].Value = model.Address;
			parameters[5].Value = model.Birthday;
			parameters[6].Value = model.E_Mail;
			parameters[7].Value = model.UserType;
			parameters[8].Value = model.Question;
			parameters[9].Value = model.Answer;
			parameters[10].Value = model.HeadImg;
			parameters[11].Value = model.Score;
			parameters[12].Value = model.Company;
			parameters[13].Value = model.CompanyType;
			parameters[14].Value = model.CompanyGM;
			parameters[15].Value = model.CompanyWebAdderss;
			parameters[16].Value = model.MyMoney;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(YS_WEB.Model.YS_User model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update YS_User set ");
			strSql.Append("ID=@ID,");
			strSql.Append("UserName=@UserName,");
			strSql.Append("ReadName=@ReadName,");
			strSql.Append("Password=@Password,");
			strSql.Append("Address=@Address,");
			strSql.Append("Birthday=@Birthday,");
			strSql.Append("E_Mail=@E_Mail,");
			strSql.Append("UserType=@UserType,");
			strSql.Append("Question=@Question,");
			strSql.Append("Answer=@Answer,");
			strSql.Append("HeadImg=@HeadImg,");
			strSql.Append("Score=@Score,");
			strSql.Append("Company=@Company,");
			strSql.Append("CompanyType=@CompanyType,");
			strSql.Append("CompanyGM=@CompanyGM,");
			strSql.Append("CompanyWebAdderss=@CompanyWebAdderss,");
			strSql.Append("MyMoney=@MyMoney");
			strSql.Append(" where ");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@UserName", SqlDbType.NVarChar,50),
					new SqlParameter("@ReadName", SqlDbType.NVarChar,100),
					new SqlParameter("@Password", SqlDbType.NVarChar,50),
					new SqlParameter("@Address", SqlDbType.NVarChar,100),
					new SqlParameter("@Birthday", SqlDbType.DateTime),
					new SqlParameter("@E_Mail", SqlDbType.NVarChar,100),
					new SqlParameter("@UserType", SqlDbType.Int,4),
					new SqlParameter("@Question", SqlDbType.NVarChar,150),
					new SqlParameter("@Answer", SqlDbType.NVarChar,150),
					new SqlParameter("@HeadImg", SqlDbType.NVarChar,200),
					new SqlParameter("@Score", SqlDbType.Int,4),
					new SqlParameter("@Company", SqlDbType.Text),
					new SqlParameter("@CompanyType", SqlDbType.NVarChar,50),
					new SqlParameter("@CompanyGM", SqlDbType.NVarChar,50),
					new SqlParameter("@CompanyWebAdderss", SqlDbType.NVarChar,200),
					new SqlParameter("@MyMoney", SqlDbType.Money,8)};
			parameters[0].Value = model.ID;
			parameters[1].Value = model.UserName;
			parameters[2].Value = model.ReadName;
			parameters[3].Value = model.Password;
			parameters[4].Value = model.Address;
			parameters[5].Value = model.Birthday;
			parameters[6].Value = model.E_Mail;
			parameters[7].Value = model.UserType;
			parameters[8].Value = model.Question;
			parameters[9].Value = model.Answer;
			parameters[10].Value = model.HeadImg;
			parameters[11].Value = model.Score;
			parameters[12].Value = model.Company;
			parameters[13].Value = model.CompanyType;
			parameters[14].Value = model.CompanyGM;
			parameters[15].Value = model.CompanyWebAdderss;
			parameters[16].Value = model.MyMoney;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete()
		{
			//该表无主键信息，请自定义主键/条件字段
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from YS_User ");
			strSql.Append(" where ");
			SqlParameter[] parameters = {
			};

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public YS_WEB.Model.YS_User GetModel()
		{
			//该表无主键信息，请自定义主键/条件字段
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,UserName,ReadName,Password,Address,Birthday,E_Mail,UserType,Question,Answer,HeadImg,Score,Company,CompanyType,CompanyGM,CompanyWebAdderss,MyMoney from YS_User ");
			strSql.Append(" where ");
			SqlParameter[] parameters = {
			};

			YS_WEB.Model.YS_User model=new YS_WEB.Model.YS_User();
			DataSet ds=DbHelperSQL.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				return DataRowToModel(ds.Tables[0].Rows[0]);
			}
			else
			{
				return null;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public YS_WEB.Model.YS_User DataRowToModel(DataRow row)
		{
			YS_WEB.Model.YS_User model=new YS_WEB.Model.YS_User();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["UserName"]!=null)
				{
					model.UserName=row["UserName"].ToString();
				}
				if(row["ReadName"]!=null)
				{
					model.ReadName=row["ReadName"].ToString();
				}
				if(row["Password"]!=null)
				{
					model.Password=row["Password"].ToString();
				}
				if(row["Address"]!=null)
				{
					model.Address=row["Address"].ToString();
				}
				if(row["Birthday"]!=null && row["Birthday"].ToString()!="")
				{
					model.Birthday=DateTime.Parse(row["Birthday"].ToString());
				}
				if(row["E_Mail"]!=null)
				{
					model.E_Mail=row["E_Mail"].ToString();
				}
				if(row["UserType"]!=null && row["UserType"].ToString()!="")
				{
					model.UserType=int.Parse(row["UserType"].ToString());
				}
				if(row["Question"]!=null)
				{
					model.Question=row["Question"].ToString();
				}
				if(row["Answer"]!=null)
				{
					model.Answer=row["Answer"].ToString();
				}
				if(row["HeadImg"]!=null)
				{
					model.HeadImg=row["HeadImg"].ToString();
				}
				if(row["Score"]!=null && row["Score"].ToString()!="")
				{
					model.Score=int.Parse(row["Score"].ToString());
				}
				if(row["Company"]!=null)
				{
					model.Company=row["Company"].ToString();
				}
				if(row["CompanyType"]!=null)
				{
					model.CompanyType=row["CompanyType"].ToString();
				}
				if(row["CompanyGM"]!=null)
				{
					model.CompanyGM=row["CompanyGM"].ToString();
				}
				if(row["CompanyWebAdderss"]!=null)
				{
					model.CompanyWebAdderss=row["CompanyWebAdderss"].ToString();
				}
				if(row["MyMoney"]!=null && row["MyMoney"].ToString()!="")
				{
					model.MyMoney=decimal.Parse(row["MyMoney"].ToString());
				}
			}
			return model;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ID,UserName,ReadName,Password,Address,Birthday,E_Mail,UserType,Question,Answer,HeadImg,Score,Company,CompanyType,CompanyGM,CompanyWebAdderss,MyMoney ");
			strSql.Append(" FROM YS_User ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ");
			if(Top>0)
			{
				strSql.Append(" top "+Top.ToString());
			}
			strSql.Append(" ID,UserName,ReadName,Password,Address,Birthday,E_Mail,UserType,Question,Answer,HeadImg,Score,Company,CompanyType,CompanyGM,CompanyWebAdderss,MyMoney ");
			strSql.Append(" FROM YS_User ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获取记录总数
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) FROM YS_User ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			object obj = DbHelperSQL.GetSingle(strSql.ToString());
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("SELECT * FROM ( ");
			strSql.Append(" SELECT ROW_NUMBER() OVER (");
			if (!string.IsNullOrEmpty(orderby.Trim()))
			{
				strSql.Append("order by T." + orderby );
			}
			else
			{
				strSql.Append("order by T. desc");
			}
			strSql.Append(")AS Row, T.*  from YS_User T ");
			if (!string.IsNullOrEmpty(strWhere.Trim()))
			{
				strSql.Append(" WHERE " + strWhere);
			}
			strSql.Append(" ) TT");
			strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/*
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@tblName", SqlDbType.VarChar, 255),
					new SqlParameter("@fldName", SqlDbType.VarChar, 255),
					new SqlParameter("@PageSize", SqlDbType.Int),
					new SqlParameter("@PageIndex", SqlDbType.Int),
					new SqlParameter("@IsReCount", SqlDbType.Bit),
					new SqlParameter("@OrderType", SqlDbType.Bit),
					new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
					};
			parameters[0].Value = "YS_User";
			parameters[1].Value = "";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

