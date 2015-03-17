using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace YS_WEB.DAL
{
	/// <summary>
	/// 数据访问类:YS_Order
	/// </summary>
	public partial class YS_OrderDAL
	{
        public YS_OrderDAL()
		{}
		#region  BasicMethod



		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(YS_WEB.Model.YS_Order model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into YS_Order(");
			strSql.Append("UserID,UserName,DeliveryName,DeliverPhone,DeliverSheng,DeliverCity,DeliverZipCode,DeliverAddress,Price,Promotion,State,AddTime)");
			strSql.Append(" values (");
			strSql.Append("@UserID,@UserName,@DeliveryName,@DeliverPhone,@DeliverSheng,@DeliverCity,@DeliverZipCode,@DeliverAddress,@Price,@Promotion,@State,@AddTime)");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@UserID", SqlDbType.Int,4),
					new SqlParameter("@UserName", SqlDbType.NVarChar,50),
					new SqlParameter("@DeliveryName", SqlDbType.NVarChar,50),
					new SqlParameter("@DeliverPhone", SqlDbType.NVarChar,12),
					new SqlParameter("@DeliverSheng", SqlDbType.NVarChar,50),
					new SqlParameter("@DeliverCity", SqlDbType.NVarChar,50),
					new SqlParameter("@DeliverZipCode", SqlDbType.NVarChar,10),
					new SqlParameter("@DeliverAddress", SqlDbType.NVarChar,150),
					new SqlParameter("@Price", SqlDbType.Money,8),
					new SqlParameter("@Promotion", SqlDbType.Float,8),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.DateTime)};
			parameters[0].Value = model.ID;
			parameters[1].Value = model.UserID;
			parameters[2].Value = model.UserName;
			parameters[3].Value = model.DeliveryName;
			parameters[4].Value = model.DeliverPhone;
			parameters[5].Value = model.DeliverSheng;
			parameters[6].Value = model.DeliverCity;
			parameters[7].Value = model.DeliverZipCode;
			parameters[8].Value = model.DeliverAddress;
			parameters[9].Value = model.Price;
			parameters[10].Value = model.Promotion;
			parameters[11].Value = model.State;
			parameters[12].Value = model.AddTime;

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
		public bool Update(YS_WEB.Model.YS_Order model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update YS_Order set ");
			strSql.Append("ID=@ID,");
			strSql.Append("UserID=@UserID,");
			strSql.Append("UserName=@UserName,");
			strSql.Append("DeliveryName=@DeliveryName,");
			strSql.Append("DeliverPhone=@DeliverPhone,");
			strSql.Append("DeliverSheng=@DeliverSheng,");
			strSql.Append("DeliverCity=@DeliverCity,");
			strSql.Append("DeliverZipCode=@DeliverZipCode,");
			strSql.Append("DeliverAddress=@DeliverAddress,");
			strSql.Append("Price=@Price,");
			strSql.Append("Promotion=@Promotion,");
			strSql.Append("State=@State,");
			strSql.Append("AddTime=@AddTime");
			strSql.Append(" where ");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@UserID", SqlDbType.Int,4),
					new SqlParameter("@UserName", SqlDbType.NVarChar,50),
					new SqlParameter("@DeliveryName", SqlDbType.NVarChar,50),
					new SqlParameter("@DeliverPhone", SqlDbType.NVarChar,12),
					new SqlParameter("@DeliverSheng", SqlDbType.NVarChar,50),
					new SqlParameter("@DeliverCity", SqlDbType.NVarChar,50),
					new SqlParameter("@DeliverZipCode", SqlDbType.NVarChar,10),
					new SqlParameter("@DeliverAddress", SqlDbType.NVarChar,150),
					new SqlParameter("@Price", SqlDbType.Money,8),
					new SqlParameter("@Promotion", SqlDbType.Float,8),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@AddTime", SqlDbType.DateTime)};
			parameters[0].Value = model.ID;
			parameters[1].Value = model.UserID;
			parameters[2].Value = model.UserName;
			parameters[3].Value = model.DeliveryName;
			parameters[4].Value = model.DeliverPhone;
			parameters[5].Value = model.DeliverSheng;
			parameters[6].Value = model.DeliverCity;
			parameters[7].Value = model.DeliverZipCode;
			parameters[8].Value = model.DeliverAddress;
			parameters[9].Value = model.Price;
			parameters[10].Value = model.Promotion;
			parameters[11].Value = model.State;
			parameters[12].Value = model.AddTime;

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
			strSql.Append("delete from YS_Order ");
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
		public YS_WEB.Model.YS_Order GetModel(int UserID)
		{
			//该表无主键信息，请自定义主键/条件字段
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,UserID,UserName,DeliveryName,DeliverPhone,DeliverSheng,DeliverCity,DeliverZipCode,DeliverAddress,Price,Promotion,State,AddTime from YS_Order ");
            strSql.Append(" where UserID=@UserID Order By AddTime DESC");
			SqlParameter[] parameters = {
                new SqlParameter("@UserID", SqlDbType.Int,4)
			};
            parameters[0].Value = UserID;

			YS_WEB.Model.YS_Order model=new YS_WEB.Model.YS_Order();
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
        public YS_WEB.Model.YS_Order GetModel()
        {
            //该表无主键信息，请自定义主键/条件字段
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 ID,UserID,UserName,DeliveryName,DeliverPhone,DeliverSheng,DeliverCity,DeliverZipCode,DeliverAddress,Price,Promotion,State,AddTime from YS_Order ");
            strSql.Append(" where ");
            SqlParameter[] parameters = {
			};

            YS_WEB.Model.YS_Order model = new YS_WEB.Model.YS_Order();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
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
		public YS_WEB.Model.YS_Order DataRowToModel(DataRow row)
		{
			YS_WEB.Model.YS_Order model=new YS_WEB.Model.YS_Order();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["UserID"]!=null && row["UserID"].ToString()!="")
				{
					model.UserID=int.Parse(row["UserID"].ToString());
				}
				if(row["UserName"]!=null)
				{
					model.UserName=row["UserName"].ToString();
				}
				if(row["DeliveryName"]!=null)
				{
					model.DeliveryName=row["DeliveryName"].ToString();
				}
				if(row["DeliverPhone"]!=null)
				{
					model.DeliverPhone=row["DeliverPhone"].ToString();
				}
				if(row["DeliverSheng"]!=null)
				{
					model.DeliverSheng=row["DeliverSheng"].ToString();
				}
				if(row["DeliverCity"]!=null)
				{
					model.DeliverCity=row["DeliverCity"].ToString();
				}
				if(row["DeliverZipCode"]!=null)
				{
					model.DeliverZipCode=row["DeliverZipCode"].ToString();
				}
				if(row["DeliverAddress"]!=null)
				{
					model.DeliverAddress=row["DeliverAddress"].ToString();
				}
				if(row["Price"]!=null && row["Price"].ToString()!="")
				{
					model.Price=decimal.Parse(row["Price"].ToString());
				}
				if(row["Promotion"]!=null && row["Promotion"].ToString()!="")
				{
					model.Promotion=decimal.Parse(row["Promotion"].ToString());
				}
				if(row["State"]!=null && row["State"].ToString()!="")
				{
                    model.State = (YS_WEB.Model.YS_Enum.OrderState)int.Parse(row["State"].ToString());
				}
				if(row["AddTime"]!=null && row["AddTime"].ToString()!="")
				{
					model.AddTime=DateTime.Parse(row["AddTime"].ToString());
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
			strSql.Append("select ID,UserID,UserName,DeliveryName,DeliverPhone,DeliverSheng,DeliverCity,DeliverZipCode,DeliverAddress,Price,Promotion,State,AddTime ");
			strSql.Append(" FROM YS_Order ");
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
			strSql.Append(" ID,UserID,UserName,DeliveryName,DeliverPhone,DeliverSheng,DeliverCity,DeliverZipCode,DeliverAddress,Price,Promotion,State,AddTime ");
			strSql.Append(" FROM YS_Order ");
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
			strSql.Append("select count(1) FROM YS_Order ");
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
			strSql.Append(")AS Row, T.*  from YS_Order T ");
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
			parameters[0].Value = "YS_Order";
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

