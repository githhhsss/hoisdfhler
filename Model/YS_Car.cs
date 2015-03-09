using System;
namespace YS_WEB.Model
{
	/// <summary>
	/// YS_Car:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class YS_Car
	{
		public YS_Car()
		{}
		#region Model
		private int _id;
		private int _userid;
		private string _username;
		private int _productid;
		private string _productname;
		private int _number;
		private decimal _price;
		private decimal _promotion;
		private bool _iscan;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 用户ID
		/// </summary>
		public int UserID
		{
			set{ _userid=value;}
			get{return _userid;}
		}
		/// <summary>
		/// 用户名
		/// </summary>
		public string UserName
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// 产品ID
		/// </summary>
		public int ProductID
		{
			set{ _productid=value;}
			get{return _productid;}
		}
		/// <summary>
		/// 产品名称
		/// </summary>
		public string ProductName
		{
			set{ _productname=value;}
			get{return _productname;}
		}
		/// <summary>
		/// 数量
		/// </summary>
		public int Number
		{
			set{ _number=value;}
			get{return _number;}
		}
		/// <summary>
		/// 单价
		/// </summary>
		public decimal Price
		{
			set{ _price=value;}
			get{return _price;}
		}
		/// <summary>
		/// 促销折扣
		/// </summary>
		public decimal Promotion
		{
			set{ _promotion=value;}
			get{return _promotion;}
		}
		/// <summary>
		/// 是否有效
		/// </summary>
		public bool IsCan
		{
			set{ _iscan=value;}
			get{return _iscan;}
		}
		#endregion Model

	}
}

