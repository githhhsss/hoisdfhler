using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace YS_WEB.DAL
{
	/// <summary>
	/// 数据访问类:YS_Attention
	/// </summary>
	public partial class YS_AttentionDAL
	{
        public YS_AttentionDAL()
		{}
		#region  BasicMethod



		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(YS_WEB.Model.YS_Attention model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into YS_Attention(");
			strSql.Append("AttentionID,AttentionName,BeConcernedID,BeConcernedName,AttentionTime)");
			strSql.Append(" values (");
			strSql.Append("@AttentionID,@AttentionName,@BeConcernedID,@BeConcernedName,@AttentionTime)");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@AttentionID", SqlDbType.Int,4),
					new SqlParameter("@AttentionName", SqlDbType.NVarChar,50),
					new SqlParameter("@BeConcernedID", SqlDbType.Int,4),
					new SqlParameter("@BeConcernedName", SqlDbType.NVarChar,50),
					new SqlParameter("@AttentionTime", SqlDbType.DateTime)};
			parameters[0].Value = model.ID;
			parameters[1].Value = model.AttentionID;
			parameters[2].Value = model.AttentionName;
			parameters[3].Value = model.BeConcernedID;
			parameters[4].Value = model.BeConcernedName;
			parameters[5].Value = model.AttentionTime;

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
		public bool Update(YS_WEB.Model.YS_Attention model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update YS_Attention set ");
			strSql.Append("ID=@ID,");
			strSql.Append("AttentionID=@AttentionID,");
			strSql.Append("AttentionName=@AttentionName,");
			strSql.Append("BeConcernedID=@BeConcernedID,");
			strSql.Append("BeConcernedName=@BeConcernedName,");
			strSql.Append("AttentionTime=@AttentionTime");
			strSql.Append(" where ");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@AttentionID", SqlDbType.Int,4),
					new SqlParameter("@AttentionName", SqlDbType.NVarChar,50),
					new SqlParameter("@BeConcernedID", SqlDbType.Int,4),
					new SqlParameter("@BeConcernedName", SqlDbType.NVarChar,50),
					new SqlParameter("@AttentionTime", SqlDbType.DateTime)};
			parameters[0].Value = model.ID;
			parameters[1].Value = model.AttentionID;
			parameters[2].Value = model.AttentionName;
			parameters[3].Value = model.BeConcernedID;
			parameters[4].Value = model.BeConcernedName;
			parameters[5].Value = model.AttentionTime;

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
			strSql.Append("delete from YS_Attention ");
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
		public YS_WEB.Model.YS_Attention GetModel()
		{
			//该表无主键信息，请自定义主键/条件字段
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,AttentionID,AttentionName,BeConcernedID,BeConcernedName,AttentionTime from YS_Attention ");
			strSql.Append(" where ");
			SqlParameter[] parameters = {
			};

			YS_WEB.Model.YS_Attention model=new YS_WEB.Model.YS_Attention();
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
		public YS_WEB.Model.YS_Attention DataRowToModel(DataRow row)
		{
			YS_WEB.Model.YS_Attention model=new YS_WEB.Model.YS_Attention();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["AttentionID"]!=null && row["AttentionID"].ToString()!="")
				{
					model.AttentionID=int.Parse(row["AttentionID"].ToString());
				}
				if(row["AttentionName"]!=null)
				{
					model.AttentionName=row["AttentionName"].ToString();
				}
				if(row["BeConcernedID"]!=null && row["BeConcernedID"].ToString()!="")
				{
					model.BeConcernedID=int.Parse(row["BeConcernedID"].ToString());
				}
				if(row["BeConcernedName"]!=null)
				{
					model.BeConcernedName=row["BeConcernedName"].ToString();
				}
				if(row["AttentionTime"]!=null && row["AttentionTime"].ToString()!="")
				{
					model.AttentionTime=DateTime.Parse(row["AttentionTime"].ToString());
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
			strSql.Append("select ID,AttentionID,AttentionName,BeConcernedID,BeConcernedName,AttentionTime ");
			strSql.Append(" FROM YS_Attention ");
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
			strSql.Append(" ID,AttentionID,AttentionName,BeConcernedID,BeConcernedName,AttentionTime ");
			strSql.Append(" FROM YS_Attention ");
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
			strSql.Append("select count(1) FROM YS_Attention ");
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
			strSql.Append(")AS Row, T.*  from YS_Attention T ");
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
			parameters[0].Value = "YS_Attention";
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

