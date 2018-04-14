using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HM.Util
{
    /// <summary>
    /// Class contain active with form
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  17/2/2012   created
    /// </Modified>
    public class FormHelper
    {
        #region Clear controls in form.

        /// <summary>
        /// clear value of all (TextBox, HiddenField) (controls of Microsoft).
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  17/2/2012   created
        /// </Modified>
        public static void EmptyTextBox(Control container, Control controlFocus)
        {
            foreach (Control c in container.Controls)
            {
                if (c.GetType() == typeof(TextBox))
                {
                    ((TextBox)c).Text = string.Empty;
                }

                else if (c.GetType() == typeof(HiddenField))
                {
                    ((HiddenField)c).Value = string.Empty;
                }

                //Recursive.
                else if (c.HasControls())
                {
                    EmptyTextBox(c, controlFocus);
                }
                controlFocus.Focus();
            }
        }

        /// <summary>
        /// Remove all item or set SelectedIndex of DropDownList (controls of Microsoft).
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <param name="hasRemoveItems">true: Remove all item of DropDownList otherwise: only set SelectIndex = 0, khong remove cac items.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  17/2/2012   created
        /// </Modified>
        public static void EmptyDropDownList(Control container, bool hasRemoveItems)
        {
            foreach (Control c in container.Controls)
            {
                if (c.GetType() == typeof(DropDownList))
                {
                    if (hasRemoveItems == true)
                    {
                        ((DropDownList)c).Items.Clear();
                    }

                    ((DropDownList)c).SelectedIndex = 0;
                }

                //Recursive.
                else if (c.HasControls())
                {
                    EmptyDropDownList(c, hasRemoveItems);
                }
            }
        }

        /// <summary>
        /// clear value of all (TextBox, HiddenField) set SelectIndex = 0 for all DropDownList (controls of Microsoft).
        /// </summary>
        /// <param name="parent">The parent.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  17/2/2012   created
        /// </Modified>
        public static void EmptyForm(Control container, Control controlFocus)
        {
            foreach (Control c in container.Controls)
            {
                if (c.GetType() == typeof(TextBox))
                {
                    ((TextBox)c).Text = string.Empty;
                }
                else if (c.GetType() == typeof(DropDownList))
                {
                    if (((DropDownList)c).Visible)
                    {
                        ((DropDownList)c).SelectedIndex = 0;
                    }
                }

                else if (c.GetType() == typeof(HiddenField))
                {
                    ((HiddenField)c).Value = string.Empty;
                }

                //Recursive.
                else if (c.HasControls())
                {
                    EmptyForm(c, controlFocus);
                }

                controlFocus.Focus();
            }
        }

        #endregion

        #region Alert ra cau thong bao

        /// <summary>
        /// Raise 1 message in client side.
        /// </summary>
        /// <param name="alert">Noi dung cua message.</param>
        /// <param name="page">Control chua message dang khi (o day la page)</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  17/2/2012   created
        /// </Modified>
        public static void Alert(string alert, System.Web.UI.Page page)
        {
            page.ClientScript.RegisterStartupScript(typeof(string), Guid.NewGuid().ToString(), string.Format("alert('{0}');", alert.Replace("'", "''")), true);
        }

        /// <summary>
        /// Raise 1 message in client side.
        /// </summary>
        /// <param name="alert">Noi dung cua message.</param>
        /// <param name="userControl">Control chua message dang khi (o day la UserControl)</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/17/2012  created
        /// </Modified>
        public static void Alert(string alert, System.Web.UI.UserControl userControl)
        {
            userControl.Page.ClientScript.RegisterStartupScript(typeof(string), Guid.NewGuid().ToString(), string.Format("alert('{0}');", alert.Replace("'", "''")), true);
        }

        /// <summary>
        /// Alerts the message in UpdatePanel.
        /// </summary>
        /// <param name="alert">The alert.</param>
        /// <param name="updatePanel">The update panel.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  23/3/2012   created
        /// </Modified>
        public static void AlertMessage(string alert, UpdatePanel updatePanel)
        {
            ScriptManager.RegisterStartupScript(updatePanel, updatePanel.GetType(), Guid.NewGuid().ToString(), string.Format("alert('{0}');", alert.Replace("'", "''")), true);
        }

        /// <summary>
        /// Alerts the message in page contains UpdatePanel.
        /// </summary>
        /// <param name="alert">The alert.</param>
        /// <param name="page">The page.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  23/3/2012   created
        /// </Modified>
        public static void AlertMessage(string alert, System.Web.UI.Page page)
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), string.Format("alert('{0}');", alert.Replace("'", "''")), true);
        }

        /// <summary>
        /// Alerts the message in UserControl contains UpdatePanel.
        /// </summary>
        /// <param name="alert">The alert.</param>
        /// <param name="userControl">The user control.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  23/3/2012   created
        /// </Modified>
        public static void AlertMessage(string alert, System.Web.UI.UserControl userControl)
        {
            ScriptManager.RegisterStartupScript(userControl, userControl.GetType(), Guid.NewGuid().ToString(), string.Format("alert('{0}');", alert.Replace("'", "''")), true);
        }

        /// <summary>
        /// Bac minhnx test
        /// </summary>
        /// <param name="alert"></param>
        /// <param name="page"></param>
        public static void AlertBoxMessage(string alert, System.Web.UI.Page page)
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), string.Format("bootbox.alert('{0}');", alert.Replace("'", "''")), true);
        }

        /// <summary>
        /// Bac minhnx test
        /// </summary>
        /// <param name="alert"></param>
        /// <param name="page"></param>
        public static void AlertBoxMessage(string alert, System.Web.UI.UserControl userControl)
        {
            ScriptManager.RegisterStartupScript(userControl, userControl.GetType(), Guid.NewGuid().ToString(), string.Format("bootbox.alert('{0}');", alert.Replace("'", "''")), true);
        }

        #endregion

        #region Get va Set Form


        /// <summary>
        /// Gets value from control to business object
        /// </summary>
        /// <param name="container">The container.</param>
        /// <param name="obj">The obj.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  17/2/2012   created
        /// </Modified>
        public static void GetForm(Control container, object obj)
        {
            //1. Duyet qua va gan cac gia tri vao 1 Dictionary.
            //2. Duyet qua gia tri trong dictionary roi gan cac gia tri cho object.
            PropertyInfo[] pros = obj.GetType().GetProperties();
            IDictionary<string, object> dicResult = new Dictionary<string, object>();
            foreach (PropertyInfo p in pros)
            {
                dicResult.Add(p.Name, null);
            }

            GetForm(container, dicResult);

            foreach (PropertyInfo p1 in pros)
            {
                if (dicResult[p1.Name] != null)
                {
                    try
                    {
                        if (p1.PropertyType == typeof(Guid))
                        {
                            p1.SetValue(obj, new Guid(dicResult[p1.Name].ToString()), null);
                        }
                        else
                        {
                            p1.SetValue(obj, (dicResult[p1.Name] != null) ? Convert.ChangeType(dicResult[p1.Name], p1.PropertyType) : null, null);
                        }
                    }
                    catch { }
                }
            }
        }

        /// <summary>
        ///  Get value from control to business object
        /// </summary>
        /// <param name="container">The container.</param>
        /// <param name="dicResult">The dic result.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  27/2/2012   created
        /// </Modified>
        private static void GetForm(Control container, IDictionary<string, object> dicResult)
        {
            //1. Duyet qua gia tri trong dictionary roi gan cac gia tri cho object.
            string id = container.ID;
            if (!string.IsNullOrEmpty(id))
            {
                int startIndex = 0;
                while (startIndex < id.Length && char.IsLower(id[startIndex]))
                {
                    startIndex++;
                }
                if (dicResult.ContainsKey(id.Substring(startIndex)))
                {
                    string key = id.Substring(startIndex);

                    if (container.GetType() == typeof(TextBox))
                    {
                        dicResult[key] = (container as TextBox).Text;
                    }
                    else if (container.GetType() == typeof(Label))
                    {
                        dicResult[key] = (container as Label).Text;
                    }
                    else if (container.GetType() == typeof(Literal))
                    {
                        dicResult[key] = (container as Literal).Text;
                    }
                    else if (container.GetType() == typeof(DropDownList))
                    {
                        dicResult[key] = (container as DropDownList).SelectedValue;
                    }
                    else if (container.GetType() == typeof(RadioButton))
                    {
                        dicResult[key] = (container as RadioButton).Checked;
                    }
                    else if (container.GetType() == typeof(RadioButtonList))
                    {
                        dicResult[key] = (container as RadioButtonList).SelectedValue;
                    }
                    else if (container.GetType() == typeof(CheckBox))
                    {
                        dicResult[key] = (container as CheckBox).Checked;
                    }
                    else if (container.GetType() == typeof(CheckBoxList))
                    {
                        dicResult[key] = (container as CheckBoxList).SelectedValue;
                    }

                }

                foreach (Control control in container.Controls)
                {
                    GetForm(control, dicResult);
                }
            }
        }

        /// <summary>
        /// Set cac gia tru tu object toi cac controls.
        /// </summary>
        /// <param name="container">The container.</param>
        /// <param name="obj">The obj.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  17/2/2012   created
        /// </Modified>
        public static void SetForm(Control container, object obj)
        {
            PropertyInfo[] pros = obj.GetType().GetProperties();
            IDictionary<string, object> dicResult = new Dictionary<string, object>();
            foreach (PropertyInfo p in pros)
            {
                dicResult.Add(p.Name, p.GetValue(obj, null));
            }

            SetForm(container, dicResult);
        }

        /// <summary>
        /// Set value from business object to controls
        /// </summary>
        /// <param name="container">The container.</param>
        /// <param name="dicResult">The dic result.</param>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  17/2/2012   created
        /// </Modified>
        private static void SetForm(Control container, IDictionary<string, object> dicResult)
        {
            string id = container.ID;
            if (!string.IsNullOrEmpty(id))
            {
                int startIndex = 0;
                while (startIndex < id.Length && char.IsLower(id[startIndex]))
                {
                    startIndex++;
                }
                if (dicResult.ContainsKey(id.Substring(startIndex)))
                {
                    string key = id.Substring(startIndex);
                    if (container.GetType() == typeof(TextBox))
                    {
                        (container as TextBox).Text = (dicResult[key] != null) ? dicResult[key].ToString() : "";
                    }
                    else if (container.GetType() == typeof(Label))
                    {
                        (container as Label).Text = (dicResult[key] != null) ? dicResult[key].ToString() : "";
                    }
                    else if (container.GetType() == typeof(Literal))
                    {
                        (container as Literal).Text = (dicResult[key] != null) ? dicResult[key].ToString() : "";
                    }
                    else if (container.GetType() == typeof(DropDownList))
                    {
                        (container as DropDownList).SelectedValue = (dicResult[key] != null) ? dicResult[key].ToString() : "";
                    }
                    else if (container.GetType() == typeof(RadioButton))
                    {
                        (container as RadioButton).Checked = ((dicResult[key] != null) && ((bool)Convert.ChangeType(dicResult[key], typeof(bool))));
                    }
                    else if (container.GetType() == typeof(RadioButtonList))
                    {
                        (container as RadioButtonList).SelectedValue = (dicResult[key] != null) ? dicResult[key].ToString() : "";

                    }
                    else if (container.GetType() == typeof(CheckBox))
                    {
                        (container as CheckBox).Checked = ((dicResult[key] != null) && ((bool)Convert.ChangeType(dicResult[key], typeof(bool))));
                    }
                    else if (container.GetType() == typeof(CheckBoxList))
                    {
                        (container as CheckBoxList).SelectedValue = (dicResult[key] != null) ? dicResult[key].ToString() : "";
                    }

                }

                foreach (Control c in container.Controls)
                {
                    SetForm(c, dicResult);
                }
            }
        }

        #endregion

        /// <summary>
        /// Check Phone Number
        /// </summary>
        /// Create by: Tuyenvt  (09/04/2013)
        /// <param name="phoneNumber"></param>
        /// <returns>True: Thỏa mãn, False: Không thỏa mãn</returns>
        public static bool CheckPhoneNumber(string phoneNumber, bool SIM)
        {
            if (SIM)
            {
                // Số điện thoại [10:12]
                if (phoneNumber.Trim().Length >= 12 || phoneNumber.Trim().Length < 10) return false;
            }
            else
                // Số điện thoại [6:12]
                if (phoneNumber.Trim().Length >= 12 || phoneNumber.Trim().Length < 6) return false;

            // Số điện thoại phải có "0" ở trước
            if (!phoneNumber.Trim().Substring(0, 1).Equals("0")) return false;
            return true;
        }

        /// <summary>
        /// Check số điện thoại không phải là số SIM
        /// </summary>
        /// Create by: Tuyenvt  (09/04/2013)
        /// <param name="PhoneNumber"></param>
        /// <returns></returns>
        public static bool CheckPhoneNumber(string PhoneNumber)
        {
            return CheckPhoneNumber(PhoneNumber, false);
        }

        /// <summary>
        /// Lấy Index Column theo Header Gridview
        /// </summary>
        /// Create by: Tuyenvt  (09/04/2013)
        /// <param name="grid">GridView</param>
        /// <param name="name">Column Header</param>
        /// <returns></returns>
        public static int GetColumnIndexByNameHeader(GridView grid, string name)
        {
            foreach (DataControlField col in grid.Columns)
            {
                if (col.HeaderText.Equals(name, StringComparison.InvariantCultureIgnoreCase))
                {
                    return grid.Columns.IndexOf(col);
                }
            }
            return -1;
        }
    }
}
