using System;
namespace YS_WEB.Model
{
	/// <summary>
	/// YS_User:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class YS_User
	{
		public YS_User()
		{}
		#region Model
		private int _id;
		private string _username;
		private string _readname;
		private string _password;
		private string _address;
		private DateTime _birthday;
		private string _e_mail;
		private int _usertype;
		private string _question;
		private string _answer;
		private string _headimg;
		private int _score;
		private string _company;
		private string _companytype;
		private string _companygm;
		private string _companywebadderss;
		private decimal _mymoney;
		/// <summary>
		/// 自增ID
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
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
		/// 真实名称
		/// </summary>
		public string ReadName
		{
			set{ _readname=value;}
			get{return _readname;}
		}
		/// <summary>
		/// 密码
		/// </summary>
		public string Password
		{
			set{ _password=value;}
			get{return _password;}
		}
		/// <summary>
		/// 地址
		/// </summary>
		public string Address
		{
			set{ _address=value;}
			get{return _address;}
		}
		/// <summary>
		/// 生日
		/// </summary>
		public DateTime Birthday
		{
			set{ _birthday=value;}
			get{return _birthday;}
		}
		/// <summary>
		/// E_Mail
		/// </summary>
		public string E_Mail
		{
			set{ _e_mail=value;}
			get{return _e_mail;}
		}
		/// <summary>
		/// 用户类型：0（默认），1商城用户，2管理员,3公司机构
		/// </summary>
		public int UserType
		{
			set{ _usertype=value;}
			get{return _usertype;}
		}
		/// <summary>
		/// 找回密码问题
		/// </summary>
		public string Question
		{
			set{ _question=value;}
			get{return _question;}
		}
		/// <summary>
		/// 找回密码答案
		/// </summary>
		public string Answer
		{
			set{ _answer=value;}
			get{return _answer;}
		}
		/// <summary>
		/// 头像地址
		/// </summary>
		public string HeadImg
		{
			set{ _headimg=value;}
			get{return _headimg;}
		}
		/// <summary>
		/// 积分
		/// </summary>
		public int Score
		{
			set{ _score=value;}
			get{return _score;}
		}
		/// <summary>
		/// 公司简介
		/// </summary>
		public string Company
		{
			set{ _company=value;}
			get{return _company;}
		}
		/// <summary>
		/// 公司类型
		/// </summary>
		public string CompanyType
		{
			set{ _companytype=value;}
			get{return _companytype;}
		}
		/// <summary>
		/// 公司规模
		/// </summary>
		public string CompanyGM
		{
			set{ _companygm=value;}
			get{return _companygm;}
		}
		/// <summary>
		/// 公司网址
		/// </summary>
		public string CompanyWebAdderss
		{
			set{ _companywebadderss=value;}
			get{return _companywebadderss;}
		}
		/// <summary>
		/// 余额
		/// </summary>
		public decimal MyMoney
		{
			set{ _mymoney=value;}
			get{return _mymoney;}
		}
		#endregion Model

	}
}

