using System;
using System.Collections;
using System.Text;
using System.Web;
using System.Web.UI;


namespace HM.Control
{
    public class MessageBox
    {
        private static Hashtable m_executingPages = new Hashtable();

        private MessageBox()
        {
        }

        private static void ExecutingPage_Unload(object sender, EventArgs e)
        {
            Queue queue = (Queue) m_executingPages[HttpContext.Current.Handler];
            if (queue != null)
            {
                StringBuilder builder = new StringBuilder();
                int count = queue.Count;
                builder.Append("<script language='javascript'>");
                while (count-- > 0)
                {
                    string str = (string) queue.Dequeue();
                    builder.Append("alert( \"" + str.Replace("\n", @"\n").Replace("\"", "'") + "\" );");
                }
                builder.Append("</script>");
                m_executingPages.Remove(HttpContext.Current.Handler);
                HttpContext.Current.Response.Write(builder.ToString());
            }
        }

        public static void Show(string sMessage)
        {
            if (!m_executingPages.Contains(HttpContext.Current.Handler))
            {
                Page handler = HttpContext.Current.Handler as Page;
                if (handler != null)
                {
                    Queue queue = new Queue();
                    queue.Enqueue(sMessage);
                    m_executingPages.Add(HttpContext.Current.Handler, queue);
                    handler.Unload += new EventHandler(MessageBox.ExecutingPage_Unload);
                }
            }
            else
            {
                ((Queue) m_executingPages[HttpContext.Current.Handler]).Enqueue(sMessage);
            }
        }
    }
}

