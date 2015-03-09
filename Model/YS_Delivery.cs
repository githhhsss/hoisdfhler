using System;
namespace YS_WEB.Model
{
	/// <summary>
	/// YS_Delivery:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class YS_Delivery
	{
		public YS_Delivery()
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
		public int UserID
		{
			set{ _userid=value;}
			get{return _userid;}
		}
		/// <summary>
		/// 
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
		#endregion Model

	}
}

