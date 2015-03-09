using System;
namespace YS_WEB.Model
{
	/// <summary>
	/// YS_Product:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class YS_Product
	{
		public YS_Product()
		{}
		#region Model
		private int _id;
		private int _producttype;
		private string _productname;
		private decimal _price;
		private decimal _promotion;
		private int _state;
		private string _description;
		private int _stock;
		private DateTime _inputtime;
		private DateTime _starttime;
		private DateTime _overtime;
		private int _sales;
		private string _productkey;
		private bool _ishot;
		private string _productman;
		private string _productphone;
		private string _productaddress;
		private string _productxinjiu;
		private string _pricerange;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 产品类型：0默认，1器材，2二手，3拍摄外单，4职位，5其他
		/// </summary>
		public int ProductType
		{
			set{ _producttype=value;}
			get{return _producttype;}
		}
		/// <summary>
		/// 商品名称
		/// </summary>
		public string ProductName
		{
			set{ _productname=value;}
			get{return _productname;}
		}
		/// <summary>
		/// 价格
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
		/// 状态：0默认，1在售，2下架
		/// </summary>
		public int State
		{
			set{ _state=value;}
			get{return _state;}
		}
		/// <summary>
		/// 描述
		/// </summary>
		public string Description
		{
			set{ _description=value;}
			get{return _description;}
		}
		/// <summary>
		/// 库存
		/// </summary>
		public int Stock
		{
			set{ _stock=value;}
			get{return _stock;}
		}
		/// <summary>
		/// 录入时间
		/// </summary>
		public DateTime InputTime
		{
			set{ _inputtime=value;}
			get{return _inputtime;}
		}
		/// <summary>
		/// 开售时间
		/// </summary>
		public DateTime StartTime
		{
			set{ _starttime=value;}
			get{return _starttime;}
		}
		/// <summary>
		/// 结束时间
		/// </summary>
		public DateTime OverTime
		{
			set{ _overtime=value;}
			get{return _overtime;}
		}
		/// <summary>
		/// 售量
		/// </summary>
		public int Sales
		{
			set{ _sales=value;}
			get{return _sales;}
		}
		/// <summary>
		/// 商品分类关键字
		/// </summary>
		public string ProductKey
		{
			set{ _productkey=value;}
			get{return _productkey;}
		}
		/// <summary>
		/// 是否热销
		/// </summary>
		public bool IsHot
		{
			set{ _ishot=value;}
			get{return _ishot;}
		}
		/// <summary>
		/// 联系人
		/// </summary>
		public string ProductMan
		{
			set{ _productman=value;}
			get{return _productman;}
		}
		/// <summary>
		/// 联系电话
		/// </summary>
		public string ProductPhone
		{
			set{ _productphone=value;}
			get{return _productphone;}
		}
		/// <summary>
		/// （拍摄\交易）地址
		/// </summary>
		public string ProductAddress
		{
			set{ _productaddress=value;}
			get{return _productaddress;}
		}
		/// <summary>
		/// 新旧程度
		/// </summary>
		public string ProductXinJiu
		{
			set{ _productxinjiu=value;}
			get{return _productxinjiu;}
		}
		/// <summary>
		/// 价格范围
		/// </summary>
		public string PriceRange
		{
			set{ _pricerange=value;}
			get{return _pricerange;}
		}
		#endregion Model

	}
}

