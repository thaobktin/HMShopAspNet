using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HM.Util;

namespace HMShop.LogPages
{
    public partial class HttpErrorPage : System.Web.UI.Page
    {
        protected HttpException httpEx = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Create safe error messages.
            string generalErrorMsg = "A problem has occurred on this web site. Please try again. " +
                "If this error continues, please contact support.";
            //string httpErrorMsg = "An HTTP error occurred. Page Not found. Please try again.";
            string unhandledErrorMsg = "The error was unhandled by application code.";
            
            // Determine where error was handled.
            string errorHandler = Request.QueryString["handler"];
            if (errorHandler == null)
            {
                errorHandler = "Page was error.";
            }

            // Get the last error from the server.
            Exception ex = Server.GetLastError();
            // If the exception no longer exists, create a generic exception.
            if (ex == null)
            {
                ex = new Exception(unhandledErrorMsg);
            }

            httpEx = (HttpException)Server.GetLastError();
            int httpCode;

            // Display safe error message.
            FriendlyErrorMsg.Text = generalErrorMsg;

            if (httpEx == null)
            {
                // Show error details to only you (developer). LOCAL ACCESS ONLY.
                //if (Request.IsLocal)
                //{
                // Show local access details.
                DetailedErrorPanel.Visible = true;
                // Detailed Error Message.
                ErrorDetailedMsg.Text = errorHandler;

                // Show where the error was handled.
                ErrorHandler.Text = errorHandler;
                //}
            }
            else
            {
                httpCode = httpEx.GetHttpCode();
                // Filter for Error Codes and set text
                if (httpCode >= 400 && httpCode < 500)
                    httpEx = new HttpException(httpCode, "Safe message for 4xx HTTP codes.", httpEx);
                else if (httpCode > 499)
                    httpEx = new HttpException(httpEx.ErrorCode, "Safe message for 5xx HTTP codes.", httpEx);
                else
                    httpEx = new HttpException(httpCode, "Safe message for unexpected HTTP codes.", httpEx);

                // Show local access details.
                DetailedErrorPanel.Visible = true;
                // Show Inner Exception fields for local access
                if (httpEx.InnerException != null)
                {
                    InnerTrace.Text = ex.InnerException.StackTrace;
                    InnerMessage.Text = string.Format("HTTP {0}: {1}",
                      httpCode, httpEx.InnerException.Message);
                }
                else
                {
                    InnerMessage.Text = ex.GetType().ToString();
                    if (ex.StackTrace != null)
                    {
                        InnerTrace.Text = ex.StackTrace.ToString().TrimStart();
                    }
                }
            } 
        }

        void Page_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            if (ex is ObjectDisposedException)
            {
                //Log this Exception
            }
            else
            {
                throw new HttpUnhandledException("Unhandle Exception", ex);
            }
        }
    }
}