using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace YS_WEB.DAL
{
	/// <summary>
	/// 数据访问类:YS_Product
	/// </summary>
	public partial class YS_Product
	{
		public YS_Product()
		{}
		#region  BasicMethod



		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(YS_WEB.Model.YS_Product model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into YS_Product(");
			strSql.Append("ID,ProductType,ProductName,Price,Promotion,State,Description,Stock,InputTime,StartTime,OverTime,Sales,ProductKey,IsHot,ProductMan,ProductPhone,ProductAddress,ProductXinJiu,PriceRange)");
			strSql.Append(" values (");
			strSql.Append("@ID,@ProductType,@ProductName,@Price,@Promotion,@State,@Description,@Stock,@InputTime,@StartTime,@OverTime,@Sales,@ProductKey,@IsHot,@ProductMan,@ProductPhone,@ProductAddress,@ProductXinJiu,@PriceRange)");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@ProductType", SqlDbType.Int,4),
					new SqlParameter("@ProductName", SqlDbType.NVarChar,50),
					new SqlParameter("@Price", SqlDbType.Money,8),
					new SqlParameter("@Promotion", SqlDbType.Float,8),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@Description", SqlDbType.Text),
					new SqlParameter("@Stock", SqlDbType.Int,4),
					new SqlParameter("@InputTime", SqlDbType.DateTime),
					new SqlParameter("@StartTime", SqlDbType.DateTime),
					new SqlParameter("@OverTime", SqlDbType.DateTime),
					new SqlParameter("@Sales", SqlDbType.Int,4),
					new SqlParameter("@ProductKey", SqlDbType.NVarChar,50),
					new SqlParameter("@IsHot", SqlDbType.Bit,1),
					new SqlParameter("@ProductMan", SqlDbType.NVarChar,50),
					new SqlParameter("@ProductPhone", SqlDbType.NVarChar,12),
					new SqlParameter("@ProductAddress", SqlDbType.NChar,10),
					new SqlParameter("@ProductXinJiu", SqlDbType.NVarChar,50),
					new SqlParameter("@PriceRange", SqlDbType.NVarChar,100)};
			parameters[0].Value = model.ID;
			parameters[1].Value = model.ProductType;
			parameters[2].Value = model.ProductName;
			parameters[3].Value = model.Price;
			parameters[4].Value = model.Promotion;
			parameters[5].Value = model.State;
			parameters[6].Value = model.Description;
			parameters[7].Value = model.Stock;
			parameters[8].Value = model.InputTime;
			parameters[9].Value = model.StartTime;
			parameters[10].Value = model.OverTime;
			parameters[11].Value = model.Sales;
			parameters[12].Value = model.ProductKey;
			parameters[13].Value = model.IsHot;
			parameters[14].Value = model.ProductMan;
			parameters[15].Value = model.ProductPhone;
			parameters[16].Value = model.ProductAddress;
			parameters[17].Value = model.ProductXinJiu;
			parameters[18].Value = model.PriceRange;

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
		public bool Update(YS_WEB.Model.YS_Product model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update YS_Product set ");
			strSql.Append("ID=@ID,");
			strSql.Append("ProductType=@ProductType,");
			strSql.Append("ProductName=@ProductName,");
			strSql.Append("Price=@Price,");
			strSql.Append("Promotion=@Promotion,");
			strSql.Append("State=@State,");
			strSql.Append("Description=@Description,");
			strSql.Append("Stock=@Stock,");
			strSql.Append("InputTime=@InputTime,");
			strSql.Append("StartTime=@StartTime,");
			strSql.Append("OverTime=@OverTime,");
			strSql.Append("Sales=@Sales,");
			strSql.Append("ProductKey=@ProductKey,");
			strSql.Append("IsHot=@IsHot,");
			strSql.Append("ProductMan=@ProductMan,");
			strSql.Append("ProductPhone=@ProductPhone,");
			strSql.Append("ProductAddress=@ProductAddress,");
			strSql.Append("ProductXinJiu=@ProductXinJiu,");
			strSql.Append("PriceRange=@PriceRange");
			strSql.Append(" where ");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4),
					new SqlParameter("@ProductType", SqlDbType.Int,4),
					new SqlParameter("@ProductName", SqlDbType.NVarChar,50),
					new SqlParameter("@Price", SqlDbType.Money,8),
					new SqlParameter("@Promotion", SqlDbType.Float,8),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@Description", SqlDbType.Text),
					new SqlParameter("@Stock", SqlDbType.Int,4),
					new SqlParameter("@InputTime", SqlDbType.DateTime),
					new SqlParameter("@StartTime", SqlDbType.DateTime),
					new SqlParameter("@OverTime", SqlDbType.DateTime),
					new SqlParameter("@Sales", SqlDbType.Int,4),
					new SqlParameter("@ProductKey", SqlDbType.NVarChar,50),
					new SqlParameter("@IsHot", SqlDbType.Bit,1),
					new SqlParameter("@ProductMan", SqlDbType.NVarChar,50),
					new SqlParameter("@ProductPhone", SqlDbType.NVarChar,12),
					new SqlParameter("@ProductAddress", SqlDbType.NChar,10),
					new SqlParameter("@ProductXinJiu", SqlDbType.NVarChar,50),
					new SqlParameter("@PriceRange", SqlDbType.NVarChar,100)};
			parameters[0].Value = model.ID;
			parameters[1].Value = model.ProductType;
			parameters[2].Value = model.ProductName;
			parameters[3].Value = model.Price;
			parameters[4].Value = model.Promotion;
			parameters[5].Value = model.State;
			parameters[6].Value = model.Description;
			parameters[7].Value = model.Stock;
			parameters[8].Value = model.InputTime;
			parameters[9].Value = model.StartTime;
			parameters[10].Value = model.OverTime;
			parameters[11].Value = model.Sales;
			parameters[12].Value = model.ProductKey;
			parameters[13].Value = model.IsHot;
			parameters[14].Value = model.ProductMan;
			parameters[15].Value = model.ProductPhone;
			parameters[16].Value = model.ProductAddress;
			parameters[17].Value = model.ProductXinJiu;
			parameters[18].Value = model.PriceRange;

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
			strSql.Append("delete from YS_Product ");
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
		public YS_WEB.Model.YS_Product GetModel()
		{
			//该表无主键信息，请自定义主键/条件字段
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,ProductType,ProductName,Price,Promotion,State,Description,Stock,InputTime,StartTime,OverTime,Sales,ProductKey,IsHot,ProductMan,ProductPhone,ProductAddress,ProductXinJiu,PriceRange from YS_Product ");
			strSql.Append(" where ");
			SqlParameter[] parameters = {
			};

			YS_WEB.Model.YS_Product model=new YS_WEB.Model.YS_Product();
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
		public YS_WEB.Model.YS_Product DataRowToModel(DataRow row)
		{
			YS_WEB.Model.YS_Product model=new YS_WEB.Model.YS_Product();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["ProductType"]!=null && row["ProductType"].ToString()!="")
				{
					model.ProductType=int.Parse(row["ProductType"].ToString());
				}
				if(row["ProductName"]!=null)
				{
					model.ProductName=row["ProductName"].ToString();
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
					model.State=int.Parse(row["State"].ToString());
				}
				if(row["Description"]!=null)
				{
					model.Description=row["Description"].ToString();
				}
				if(row["Stock"]!=null && row["Stock"].ToString()!="")
				{
					model.Stock=int.Parse(row["Stock"].ToString());
				}
				if(row["InputTime"]!=null && row["InputTime"].ToString()!="")
				{
					model.InputTime=DateTime.Parse(row["InputTime"].ToString());
				}
				if(row["StartTime"]!=null && row["StartTime"].ToString()!="")
				{
					model.StartTime=DateTime.Parse(row["StartTime"].ToString());
				}
				if(row["OverTime"]!=null && row["OverTime"].ToString()!="")
				{
					model.OverTime=DateTime.Parse(row["OverTime"].ToString());
				}
				if(row["Sales"]!=null && row["Sales"].ToString()!="")
				{
					model.Sales=int.Parse(row["Sales"].ToString());
				}
				if(row["ProductKey"]!=null)
				{
					model.ProductKey=row["ProductKey"].ToString();
				}
				if(row["IsHot"]!=null && row["IsHot"].ToString()!="")
				{
					if((row["IsHot"].ToString()=="1")||(row["IsHot"].ToString().ToLower()=="true"))
					{
						model.IsHot=true;
					}
					else
					{
						model.IsHot=false;
					}
				}
				if(row["ProductMan"]!=null)
				{
					model.ProductMan=row["ProductMan"].ToString();
				}
				if(row["ProductPhone"]!=null)
				{
					model.ProductPhone=row["ProductPhone"].ToString();
				}
				if(row["ProductAddress"]!=null)
				{
					model.ProductAddress=row["ProductAddress"].ToString();
				}
				if(row["ProductXinJiu"]!=null)
				{
					model.ProductXinJiu=row["ProductXinJiu"].ToString();
				}
				if(row["PriceRange"]!=null)
				{
					model.PriceRange=row["PriceRange"].ToString();
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
			strSql.Append("select ID,ProductType,ProductName,Price,Promotion,State,Description,Stock,InputTime,StartTime,OverTime,Sales,ProductKey,IsHot,ProductMan,ProductPhone,ProductAddress,ProductXinJiu,PriceRange ");
			strSql.Append(" FROM YS_Product ");
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
			strSql.Append(" ID,ProductType,ProductName,Price,Promotion,State,Description,Stock,InputTime,StartTime,OverTime,Sales,ProductKey,IsHot,ProductMan,ProductPhone,ProductAddress,ProductXinJiu,PriceRange ");
			strSql.Append(" FROM YS_Product ");
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
			strSql.Append("select count(1) FROM YS_Product ");
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
			strSql.Append(")AS Row, T.*  from YS_Product T ");
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
			parameters[0].Value = "YS_Product";
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

