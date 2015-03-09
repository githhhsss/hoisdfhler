using System;
namespace YS_WEB.Model
{
	/// <summary>
	/// YS_Recharge:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class YS_Recharge
	{
		public YS_Recharge()
		{}
		#region Model
		private int _id;
		private int _userid;
		private string _username;
		private decimal _rechargemoney;
		private DateTime _rechargetime;
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
		/// 
		/// </summary>
		public decimal RechargeMoney
		{
			set{ _rechargemoney=value;}
			get{return _rechargemoney;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime RechargeTime
		{
			set{ _rechargetime=value;}
			get{return _rechargetime;}
		}
		#endregion Model

	}
}

