using System;


namespace HM.Control
{
	public class MLLinkButton : System.Web.UI.WebControls.LinkButton, BaseControl
	{
		private string _languageKey = string.Empty;
		public string LanguageKey
		{
			get { return _languageKey;}
			set { _languageKey = value;}
		}
		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad (e);
			if (( MulLangInit.DataLanguage == null) || ( MulLangInit.DataLanguage[LanguageKey] == null) )
				this.Text = LanguageKey;
			else
				this.Text = MulLangInit.DataLanguage[LanguageKey].ToString();
		}
	}
}
