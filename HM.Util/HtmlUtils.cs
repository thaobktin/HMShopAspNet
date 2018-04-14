using System.Web;
using System.Web.UI.WebControls;


namespace HM.Util
{
    public class HtmlUtils
    {
        public static string OptimizeHtml(string content)
        {
            return content.Replace("\t", "").Replace("\r\n", " ");
        }

        public static string OutputHTML(string strInput)
        {
            return HttpUtility.HtmlEncode(strInput);
        }

        public static void ReturnHTMLEncodeForDataGrid(DataGrid dtg)
        {
            int count = dtg.Items.Count;
            int num2 = dtg.Columns.Count;
            for (int i = 0; i <= (count - 1); i++)
            {
                for (int j = 0; j <= (num2 - 1); j++)
                {
                    string text = dtg.Items[i].Cells[j].Text;
                    if (!text.Equals(string.Empty))
                    {
                        text = OutputHTML(text);
                        dtg.Items[i].Cells[j].Text = text;
                    }
                }
            }
        }
    }
}

