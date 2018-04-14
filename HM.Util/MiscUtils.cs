using System;
using System.Web.UI.WebControls;


namespace HM.Util
{
    public class MiscUtils
    {
        public static void FillIndex(DropDownList dropIndex, int max, int selected)
        {
            dropIndex.Items.Clear();
            for (int i = 0; i <= max; i++)
            {
                ListItem item = new ListItem(i.ToString(), i.ToString());
                if (i == selected)
                {
                    item.Selected = true;
                }
                else
                {
                    item.Selected = false;
                }
                dropIndex.Items.Add(item);
            }
        }

        public static void FillIndex(DropDownList dropIndex, int min, int max, int selected)
        {
            dropIndex.Items.Clear();
            for (int i = min; i <= max; i++)
            {
                ListItem item = new ListItem(i.ToString(), i.ToString());
                if (i == selected)
                {
                    item.Selected = true;
                }
                else
                {
                    item.Selected = false;
                }
                dropIndex.Items.Add(item);
            }
        }

        public static void SetSelected(ListItemCollection lstItems, string selectedValue)
        {
            ListItem item = lstItems.FindByValue(selectedValue);
            if (item != null)
            {
                item.Selected = true;
            }
        }

        public static string StringIndent(int level)
        {
            string str = string.Empty;
            for (int i = 0; i < level; i++)
            {
                str = str + ".....";
            }
            return str;
        }
    }
}

