using System;
using System.Web;
using System.Data;
using HM.Util;
using HM.Model;
using HM.Common;
using HM.Services;

namespace HMShop.Qwerty
{
    public partial class LoginFb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string id = HttpContext.Current.Request.Params["id"];
                string name = HttpContext.Current.Request.Params["name"];

                var userService = new UserService();
                var user = userService.ReadByAppId(id, Constant.TYPE_SOCIAL_FACEBOOK);
                if (user == null)
                {
                    user = new UserInfo
                    {
                        AppID = id,
                        UserName = name,
                        TypeSocial = ""
                    };
                    userService.Create(user);
                }
                this.Visible = false;
                AuthenUtils.LoginByInfo(PathConfig.ADMIN_PREFIX + id, true);
                int getVote = Convert.ToInt32(HttpContext.Current.Request.Params["getVote"]);
                if (getVote == 0)
                {
                    Response.Write(Constant.RESPONSE_SUCCESS);
                }
                else
                {
                    int contentId = Convert.ToInt32(HttpContext.Current.Request.Params["contentId"]);
                    var userInfo = userService.ReadByAppId(id, Constant.TYPE_SOCIAL_FACEBOOK);
                    //var dataVotes = VoteDB.GetVoteContentOfUser(userInfo.ID, contentId);
                    //Response.Write(StringHelper.DataTableToJSON(dataVotes).ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write(Constant.RESPONSE_FAIL + " .Exception: " + ex.Message);
            }

            Response.End();
        }
    }
}