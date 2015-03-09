using System;
namespace YS_WEB.Model
{
	/// <summary>
	/// YS_Key:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class YS_Key
	{
		public YS_Key()
		{}
		#region Model
		private int _id;
		private string _keyname;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 关键字
		/// </summary>
		public string KeyName
		{
			set{ _keyname=value;}
			get{return _keyname;}
		}
		#endregion Model

	}
}

