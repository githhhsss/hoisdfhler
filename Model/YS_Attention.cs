using System;
namespace YS_WEB.Model
{
	/// <summary>
	/// YS_Attention:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class YS_Attention
	{
		public YS_Attention()
		{}
		#region Model
		private int _id;
		private int _attentionid;
		private string _attentionname;
		private int _beconcernedid;
		private string _beconcernedname;
		private DateTime _attentiontime;
		/// <summary>
		/// 自增ID
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 关注者ID
		/// </summary>
		public int AttentionID
		{
			set{ _attentionid=value;}
			get{return _attentionid;}
		}
		/// <summary>
		/// 关注者名称
		/// </summary>
		public string AttentionName
		{
			set{ _attentionname=value;}
			get{return _attentionname;}
		}
		/// <summary>
		/// 被关注者ID
		/// </summary>
		public int BeConcernedID
		{
			set{ _beconcernedid=value;}
			get{return _beconcernedid;}
		}
		/// <summary>
		/// 被关注者名称
		/// </summary>
		public string BeConcernedName
		{
			set{ _beconcernedname=value;}
			get{return _beconcernedname;}
		}
		/// <summary>
		/// 关注时间
		/// </summary>
		public DateTime AttentionTime
		{
			set{ _attentiontime=value;}
			get{return _attentiontime;}
		}
		#endregion Model

	}
}

