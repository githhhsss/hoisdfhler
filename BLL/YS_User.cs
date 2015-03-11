using System;
using System.Data;
using System.Collections.Generic;
using Maticsoft.Common;
using YS_WEB.Model;
namespace YS_WEB.BLL
{
	/// <summary>
	/// YS_User
	/// </summary>
	public partial class YS_UserBLL
	{
		private readonly YS_WEB.DAL.YS_UserDAL dal=new YS_WEB.DAL.YS_UserDAL();
        public YS_UserBLL()
		{}
		#region  BasicMethod

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(YS_WEB.Model.YS_User model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(YS_WEB.Model.YS_User model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int ID)
		{
			//该表无主键信息，请自定义主键/条件字段
			return dal.Delete(ID);
		}
        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(YS_WEB.Model.YS_User model)
        {
            //该表无主键信息，请自定义主键/条件字段
            return dal.Delete(model);
        }

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public YS_WEB.Model.YS_User GetModel(int id)
		{
			//该表无主键信息，请自定义主键/条件字段
			return dal.GetModel(id);
		}
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public YS_WEB.Model.YS_User GetModel(string userName)
        {
            //该表无主键信息，请自定义主键/条件字段
            return dal.GetModel(userName);
        }
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public YS_WEB.Model.YS_User GetModel(string userName ,string password)
        {
            //该表无主键信息，请自定义主键/条件字段
            return dal.GetModel(userName,password);
        }

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public YS_WEB.Model.YS_User GetModelByCache()
		{
			//该表无主键信息，请自定义主键/条件字段
			string CacheKey = "YS_UserModel-" ;
			object objModel = Maticsoft.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel();
					if (objModel != null)
					{
						int ModelCache = Maticsoft.Common.ConfigHelper.GetConfigInt("ModelCache");
						Maticsoft.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (YS_WEB.Model.YS_User)objModel;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<YS_WEB.Model.YS_User> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<YS_WEB.Model.YS_User> DataTableToList(DataTable dt)
		{
			List<YS_WEB.Model.YS_User> modelList = new List<YS_WEB.Model.YS_User>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				YS_WEB.Model.YS_User model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = dal.DataRowToModel(dt.Rows[n]);
					if (model != null)
					{
						modelList.Add(model);
					}
				}
			}
			return modelList;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			return dal.GetRecordCount(strWhere);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			return dal.GetListByPage( strWhere,  orderby,  startIndex,  endIndex);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

