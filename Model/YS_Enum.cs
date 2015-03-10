using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace YS_WEB.Model
{
    public class YS_Enum
    {
        /// <summary>
        /// 用户类型
        /// </summary>
        public enum UserType
        {
            默认 = 0,
            商城用户 = 1,
            管理员 = 2,
            公司机构 = 3
        }
        /// <summary>
        /// 产品类型
        /// </summary>
        public enum ProductType
        {
            默认 = 0,
            器材 = 1,
            二手 = 2,
            拍摄外单 = 3,
            职位 = 4,
            其他 = 5
        }
        /// <summary>
        /// 产品状态
        /// </summary>
        public enum ProductState
        {
            默认 = 0,
            在售 = 1,
            下架 = 2
        }
        /// <summary>
        /// 订单状态
        /// </summary>
        public enum OrderState
        {
            默认 = 0,
            待支付 = 1,
            已支付 = 2,
            已发货 = 3,
            已完成 = 4
        }
    }
}
