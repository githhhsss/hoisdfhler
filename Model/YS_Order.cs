using System;
namespace YS_WEB.Model
{
	/// <summary>
	/// YS_Order:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class YS_Order
	{
		public YS_Order()
		{}
		#region Model
		private int _id;
		private int _userid;
		private string _username;
		private string _deliveryname;
		private string _deliverphone;
		private string _deliversheng;
		private string _delivercity;
		private string _deliverzipcode;
		private string _deliveraddress;
		private decimal _price;
		private decimal _promotion;
        private YS_Enum.OrderState _state;
		private DateTime _addtime;
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
		/// 收货人
		/// </summary>
		public string DeliveryName
		{
			set{ _deliveryname=value;}
			get{return _deliveryname;}
		}
		/// <summary>
		/// 收货电话
		/// </summary>
		public string DeliverPhone
		{
			set{ _deliverphone=value;}
			get{return _deliverphone;}
		}
		/// <summary>
		/// 省
		/// </summary>
		public string DeliverSheng
		{
			set{ _deliversheng=value;}
			get{return _deliversheng;}
		}
		/// <summary>
		/// 市
		/// </summary>
		public string DeliverCity
		{
			set{ _delivercity=value;}
			get{return _delivercity;}
		}
		/// <summary>
		/// 邮编
		/// </summary>
		public string DeliverZipCode
		{
			set{ _deliverzipcode=value;}
			get{return _deliverzipcode;}
		}
		/// <summary>
		/// 收货地址
		/// </summary>
		public string DeliverAddress
		{
			set{ _deliveraddress=value;}
			get{return _deliveraddress;}
		}
		/// <summary>
		/// 总价
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
		/// 订单状态：0默认，1待支付，2已支付/待发货，3已发货/待签收，4已完成
		/// </summary>
        public YS_Enum.OrderState State
		{
			set{ _state=value;}
			get{return _state;}
		}
		/// <summary>
		/// 添加时间
		/// </summary>
		public DateTime AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		#endregion Model

	}
}

