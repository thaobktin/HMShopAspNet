using System.Web.UI;
using HM.Model;


namespace HM.Control
{
    public class AdminControl : UserControl
    {
        protected string BackUrl
        {
            get { return CurrentPage.BackUrl; }
            set { CurrentPage.BackUrl = value; }
        }

        protected MainUserInfo CurrentAdminInfo
        {
            get { return CurrentPage.CurrAdmin; }
        }

        private AdminPage CurrentPage
        {
            get { return (AdminPage) Page; }
        }

        protected string CurrentUrl
        {
            get { return CurrentPage.CurrentUrl; }
            set { CurrentPage.CurrentUrl = value; }
        }
    }
}