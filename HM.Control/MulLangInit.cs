using System;
using System.Collections;
using System.Web;


namespace HM.Control
{	
	public class MulLangInit
	{		
		public static string DATA_KEYNAME = string.Empty;
		public static Hashtable DataLanguage
		{
			get
			{
				Hashtable retVal = null;
				try
				{
					if ( HttpContext.Current.Cache[DATA_KEYNAME] == null)
						retVal = null;
					else
						retVal = (Hashtable) HttpContext.Current.Cache[DATA_KEYNAME];
				}
				catch
				{
					retVal = null;
				}
				return retVal;
			}
		}		
	}
}
