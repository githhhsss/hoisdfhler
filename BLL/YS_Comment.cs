﻿using System;
using System.Data;
using System.Collections.Generic;
using Maticsoft.Common;
using YS_WEB.Model;
namespace YS_WEB.BLL
{
	/// <summary>
	/// YS_Comment
	/// </summary>
	public partial class YS_CommentBLL
	{
		private readonly YS_WEB.DAL.YS_CommentDAL dal=new YS_WEB.DAL.YS_CommentDAL();
        public YS_CommentBLL()
		{}
		#region  BasicMethod

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(YS_WEB.Model.YS_Comment model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(YS_WEB.Model.YS_Comment model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int id)
		{
			//该表无主键信息，请自定义主键/条件字段
			return dal.Delete(id);
		}

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public YS_WEB.Model.YS_Comment GetModel(int id)
        {
            //该表无主键信息，请自定义主键/条件字段
            return dal.GetModel(id);
        }
		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public YS_WEB.Model.YS_Comment GetModel()
		{
			//该表无主键信息，请自定义主键/条件字段
			return dal.GetModel();
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public YS_WEB.Model.YS_Comment GetModelByCache()
		{
			//该表无主键信息，请自定义主键/条件字段
			string CacheKey = "YS_CommentModel-" ;
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
			return (YS_WEB.Model.YS_Comment)objModel;
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
		public List<YS_WEB.Model.YS_Comment> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<YS_WEB.Model.YS_Comment> DataTableToList(DataTable dt)
		{
			List<YS_WEB.Model.YS_Comment> modelList = new List<YS_WEB.Model.YS_Comment>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				YS_WEB.Model.YS_Comment model;
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

