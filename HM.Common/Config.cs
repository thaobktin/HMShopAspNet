using System;
using System.Configuration;

namespace HM.Common
{
    public class PathConfig
    {
        public const string ADMIN_PREFIX = "HM_Qwerty_";
        public const string ADMIN_EMAIL = "thaond@com.vn";  //shopadmin

        public const string ADMIN_PATH = "/Qwerty/"; // "/Qwerty/"
        public const string ADMIN_CMD = "/Qwerty/Default.aspx?cmd=";
        public const string ADMIN_ACCESSDENY = "/Qwerty/Default.aspx?cmd=accessdeny";

        public const string SYSTEM_PATH = "/Qwerty/Systems/";
        public const string ORDER_PATH = "/Qwerty/Orders/";

        public const string PREFIX = "HM_";
        public const string PATH = "/"; //"/HMShop/"
    }

    public class SessionConfig
    {
        public const string ADMIN_INFO = "ADMIN_INFO";
        public const string ADMIN_BACK_URL = "AdminBackUrl";
        public const string ADMIN_CURRENT_URL = "AdminCurrentUrl";

        public const string USER_INFO = "USER_INFO";
        public const string BACK_URL = "BackUrl";
        public const string CURRENT_URL = "CurrentUrl";
    }

    public class CmdConfig
    {
        public const string CMD_ROOT = "cmd";

        public const string SYSTEM_CMD = "system_cmd";
        public const string SYSTEM_MANAGEMENT = "system_management";
        public const string SYSTEM_USER_ROLE = "system_userrole";
        public const string SYSTEM_GROUP_ROLE = "system_grouprole";
        public const string SYSTEM_GROUP_USER = "system_groupuser";

        //Product
        public const string PRODUCT_LIST_PRODUCT = "product_listproduct";
        public const string PRODUCT_THUMB_PRODUCT = "product_thumbproduct";
        public const string PRODUCT_DETAIL_PRODUCT = "product_detailproduct";

        //Order
        public const string ORDER_LIST_ORDER = "order_listorder";
        public const string ORDER_DETAIL_ORDER = "order_detailorder";
        public const string ORDER_SALE_REPORT = "order_salereport";
        public const string ORDER_SHIPMENT = "order_shipment";

        public const string ACCESS_DENY = "accessdeny";
    }

    public class AlertConfig
    {
        public const string DELETE_CONFIRM = "return confirm(' Bạn đã chắc chắn ? ');";
        public const string UPDATE_ERROR = "<font color='red'> Có lỗi trong quá trình cập nhật !</font>";
        public const string CREATE_SUCCESS = "<font color='blue'> Thêm mới thành công !</font>";
        public const string UPDATE_SUCCESS = "<font color='blue'> Cập nhật thành công !</font>";
    }
    
}