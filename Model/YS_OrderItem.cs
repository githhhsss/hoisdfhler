using System;
namespace YS_WEB.Model
{
	/// <summary>
	/// YS_OrderItem:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class YS_OrderItem
	{
		public YS_OrderItem()
		{}
		#region Model
		private int _id;
		private int _orderid;
		private int _productid;
        private int _num;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int OrderID
		{
			set{ _orderid=value;}
			get{return _orderid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int ProductID
		{
			set{ _productid=value;}
			get{return _productid;}
		}
        /// <summary>
        /// 
        /// </summary>
        public int Num
        {
            set { _num = value; }
            get { return _num; }
        }
		#endregion Model

	}
}

