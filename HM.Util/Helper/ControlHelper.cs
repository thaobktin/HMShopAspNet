using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.IO;
using System.Web;

namespace HM.Util
{
    /// <summary>
    /// Provides helper functions for using and accessing controls.
    /// </summary>
    public static class ControlHelper
    {
        /// <summary>
        /// Finds a control recursively (forward only) using <paramref name="isControl"/> function.
        /// </summary>
        /// <param name="sourceControl">
        /// Control to start search from.
        /// </param>
        /// <param name="isControl">
        /// Function to test if we found the control.
        /// </param>
        /// <returns>
        /// List of controls found
        /// </returns>
        public static List<Control> ControlListRecursive(Control sourceControl, Func<Control, bool> isControl)
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (isControl == null)
            {
                throw new ArgumentNullException("isControl", "isControl is null.");
            }

            var list = new List<Control>();

            var withParents = (from c in sourceControl.Controls.Cast<Control>().AsQueryable()
                               where c.HasControls()
                               select c).ToList();

            // recusively call this function looking for controls...
            withParents.ForEach(x => list.AddRange(ControlListRecursive(x, isControl)));

            // add controls from this level...
            list.AddRange(ControlListNoParents(sourceControl, isControl));

            // return the lot...
            return list;
        }

        /// <summary>
        /// Finds a control recursively (forward only) using <paramref name="isControl"/> function.
        /// </summary>
        /// <param name="sourceControl">
        /// Control to start search from.
        /// </param>
        /// <param name="isControl">
        /// Function to test if we found the control.
        /// </param>
        /// <returns>
        /// List of controls found
        /// </returns>
        private static List<Control> ControlListNoParents(Control sourceControl, Func<Control, bool> isControl)
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (isControl == null)
            {
                throw new ArgumentNullException("isControl", "isControl is null.");
            }

            return (from c in sourceControl.Controls.Cast<Control>().AsQueryable()
                    where !c.HasControls()
                    select c).Where(isControl).ToList();
        }

        /// <summary>
        /// The find control recursive reverse.
        /// </summary>
        /// <param name="sourceControl">
        /// The source control.
        /// </param>
        /// <param name="id">
        /// The id.
        /// </param>
        /// <returns>
        /// </returns>
        public static Control FindControlRecursiveReverse(Control sourceControl, string id)
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (String.IsNullOrEmpty(id))
            {
                throw new ArgumentException("id is null or empty.", "id");
            }

            Control foundControl = sourceControl.FindControl(id);

            if (foundControl != null)
            {
                return foundControl;
            }
            else if (sourceControl.Parent != null)
            {
                return FindControlRecursiveReverse(sourceControl.Parent, id);
            }

            return null;
        }

        /// <summary>
        /// The find control recursive both.
        /// </summary>
        /// <param name="sourceControl">
        /// The source control.
        /// </param>
        /// <param name="id">
        /// The id.
        /// </param>
        /// <returns>
        /// </returns>
        public static Control FindControlRecursiveBoth(Control sourceControl, string id)
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (String.IsNullOrEmpty(id))
            {
                throw new ArgumentException("id is null or empty.", "id");
            }

            Control found = FindControlRecursiveReverse(sourceControl, id);
            if (found != null)
            {
                return found;
            }

            found = FindControlRecursive(sourceControl, id);
            return found;
        }

        /// <summary>
        /// The find control as.
        /// </summary>
        /// <param name="sourceControl">
        /// The source control.
        /// </param>
        /// <param name="id">
        /// The id.
        /// </param>
        /// <typeparam name="T">
        /// </typeparam>
        /// <returns>
        /// </returns>
        public static T FindControlAs<T>(Control sourceControl, string id) where T : class
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (String.IsNullOrEmpty(id))
            {
                throw new ArgumentException("id is null or empty.", "id");
            }

            Control foundControl = sourceControl.FindControl(id);
            if (foundControl != null && foundControl is T)
            {
                return foundControl.ToClass<T>();
            }

            return null;
        }

        /// <summary>
        /// The find control recursive as.
        /// </summary>
        /// <param name="sourceControl">
        /// The source control.
        /// </param>
        /// <param name="id">
        /// The id.
        /// </param>
        /// <typeparam name="T">
        /// </typeparam>
        /// <returns>
        /// </returns>
        public static T FindControlRecursiveAs<T>(Control sourceControl, string id) where T : class
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (String.IsNullOrEmpty(id))
            {
                throw new ArgumentException("id is null or empty.", "id");
            }

            Control foundControl = FindControlRecursive(sourceControl, id);
            if (foundControl != null && foundControl is T)
            {
                return foundControl.ToClass<T>();
            }

            return null;
        }

        /// <summary>
        /// The find control recursive reverse as.
        /// </summary>
        /// <param name="sourceControl">
        /// The source control.
        /// </param>
        /// <param name="id">
        /// The id.
        /// </param>
        /// <typeparam name="T">
        /// </typeparam>
        /// <returns>
        /// </returns>
        public static T FindControlRecursiveReverseAs<T>(Control sourceControl, string id) where T : class
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (String.IsNullOrEmpty(id))
            {
                throw new ArgumentException("id is null or empty.", "id");
            }

            Control foundControl = FindControlRecursiveReverse(sourceControl, id);
            if (foundControl != null && foundControl is T)
            {
                return foundControl.ToClass<T>();
            }

            return null;
        }

        /// <summary>
        /// The find control recursive both as.
        /// </summary>
        /// <param name="sourceControl">
        /// The source control.
        /// </param>
        /// <param name="id">
        /// The id.
        /// </param>
        /// <typeparam name="T">
        /// </typeparam>
        /// <returns>
        /// </returns>
        public static T FindControlRecursiveBothAs<T>(Control sourceControl, string id) where T : class
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (String.IsNullOrEmpty(id))
            {
                throw new ArgumentException("id is null or empty.", "id");
            }

            Control foundControl = FindControlRecursiveBoth(sourceControl, id);

            if (foundControl != null && foundControl is T)
            {
                return foundControl.ToClass<T>();
            }

            return null;
        }

        /// <summary>
        /// Find Wizard Control - Find a control in a wizard
        /// </summary>
        /// <param name="wizardControl">
        /// Wizard control
        /// </param>
        /// <param name="id">
        /// ID of target control
        /// </param>
        /// <returns>
        /// A control reference, if found, null, if not
        /// </returns>
        public static Control FindWizardControlRecursive(Wizard wizardControl, string id)
        {
            if (wizardControl == null)
            {
                throw new ArgumentNullException("wizardControl", "wizardControl is null.");
            }

            if (String.IsNullOrEmpty(id))
            {
                throw new ArgumentException("id is null or empty.", "id");
            }

            Control foundControl = null;

            for (int i = 0; i < wizardControl.WizardSteps.Count; i++)
            {
                for (int j = 0; j < wizardControl.WizardSteps[i].Controls.Count; j++)
                {
                    foundControl = FindControlRecursive(wizardControl.WizardSteps[i].Controls[j], id);
                    if (foundControl != null)
                    {
                        break;
                    }
                }

                if (foundControl != null)
                {
                    break;
                }
            }

            return foundControl;
        }

        /// <summary>
        /// Find Wizard Control - Find a control in a wizard, is recursive
        /// </summary>
        /// <param name="sourceControl">
        /// Source/Root Control
        /// </param>
        /// <param name="id">
        /// ID of target control
        /// </param>
        /// <returns>
        /// A Control, if found; null, if not
        /// </returns>
        public static Control FindControlRecursive(Control sourceControl, string id)
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (String.IsNullOrEmpty(id))
            {
                throw new ArgumentException("id is null or empty.", "id");
            }

            Control foundControl = sourceControl.FindControl(id);

            if (foundControl == null)
            {
                if (sourceControl.HasControls())
                {
                    foreach (Control tmpCtr in sourceControl.Controls)
                    {
                        // Check all child controls of sourceControl
                        foundControl = FindControlRecursive(tmpCtr, id);
                        if (foundControl != null)
                        {
                            break;
                        }
                    }
                }
            }

            return foundControl;
        }

        /// <summary>
        /// Finds all controls in <paramref name="sourceControl"/> of type T.
        /// </summary>
        /// <param name="sourceControl">
        /// Control to search within.
        /// </param>
        /// <typeparam name="T">Type to Find and Return
        /// </typeparam>
        /// <returns>
        /// List of type T with controls.
        /// </returns>
        /// <exception cref="ArgumentNullException">
        /// </exception>
        public static List<T> FindControlType<T>(Control sourceControl)
        {
            if (sourceControl == null)
            {
                throw new ArgumentNullException("sourceControl", "sourceControl is null.");
            }

            if (sourceControl.HasControls())
            {
                // get all controls of type T as a list...
                return sourceControl.Controls.Cast<Control>().Where(x => x.GetType() == typeof(T)).Cast<T>().ToList();
            }

            // return nothing found...
            return new List<T>();
        }

        /// <summary>
        /// The make css include control.
        /// </summary>
        /// <param name="href">
        /// The href.
        /// </param>
        /// <returns>
        /// </returns>
        public static HtmlLink MakeCssIncludeControl(string href)
        {
            var stylesheet = new HtmlLink();
            stylesheet.Href = href;
            stylesheet.Attributes.Add("rel", "stylesheet");
            stylesheet.Attributes.Add("type", "text/css");

            return stylesheet;
        }

        /// <summary>
        /// The make css control.
        /// </summary>
        /// <param name="css">
        /// The style information to add to the control.
        /// </param>
        /// <returns>
        /// </returns>
        public static HtmlGenericControl MakeCssControl(string css)
        {
            var style = new HtmlGenericControl();
            style.TagName = "style";
            style.Attributes.Add("type", "text/css");
            style.InnerText = css;

            return style;
        }

        /// <summary>
        /// The make a javascript include control.
        /// </summary>
        /// <param name="href">
        /// The href to the javascript script file.
        /// </param>
        /// <returns>
        /// </returns>
        public static HtmlGenericControl MakeJsIncludeControl(string href)
        {
            var js = new HtmlGenericControl();
            js.TagName = "script";
            js.Attributes.Add("type", "text/javascript");
            js.Attributes.Add("src", href);

            return js;
        }

        /// <summary>
        /// Creates a <see cref="HtmlMeta"/> control for keywords.
        /// </summary>
        /// <param name="keywords">keywords that go inside the meta</param>
        /// <returns><see cref="HtmlMeta"/> control</returns>
        public static HtmlMeta MakeMetaKeywordsControl(string keywords)
        {
            HtmlMeta meta = new HtmlMeta
              {
                  Name = "keywords",
                  Content = keywords
              };

            return meta;
        }

        /// <summary>
        /// Creates a <see cref="HtmlMeta"/> control for description.
        /// </summary>
        /// <param name="description">description that go inside the meta</param>
        /// <returns><see cref="HtmlMeta"/> control</returns>
        public static HtmlMeta MakeMetaDiscriptionControl(string description)
        {
            HtmlMeta meta = new HtmlMeta
            {
                Name = "description",
                Content = description
            };

            return meta;
        }

        /// <summary>
        /// The add style attribute size.
        /// </summary>
        /// <param name="control">
        /// The control.
        /// </param>
        /// <param name="width">
        /// The width.
        /// </param>
        /// <param name="height">
        /// The height.
        /// </param>
        public static void AddStyleAttributeSize(WebControl control, string width, string height)
        {
            if (control == null)
            {
                throw new ArgumentNullException("control", "control is null.");
            }

            if (String.IsNullOrEmpty(width))
            {
                throw new ArgumentException("width is null or empty.", "width");
            }

            if (String.IsNullOrEmpty(height))
            {
                throw new ArgumentException("height is null or empty.", "height");
            }

            control.Attributes.Add("style", String.Format("width: {0}; height: {1};", width, height));
        }

        /// <summary>
        /// The add style attribute width.
        /// </summary>
        /// <param name="control">
        /// The control.
        /// </param>
        /// <param name="width">
        /// The width.
        /// </param>
        public static void AddStyleAttributeWidth(WebControl control, string width)
        {
            if (control == null)
            {
                throw new ArgumentNullException("control", "control is null.");
            }

            if (String.IsNullOrEmpty(width))
            {
                throw new ArgumentException("width is null or empty.", "width");
            }

            control.Attributes.Add("style", String.Format("width: {0};", width));
        }

        /// <summary>
        /// The add style attribute height.
        /// </summary>
        /// <param name="control">
        /// The control.
        /// </param>
        /// <param name="height">
        /// The height.
        /// </param>
        public static void AddStyleAttributeHeight(WebControl control, string height)
        {
            if (control == null)
            {
                throw new ArgumentNullException("control", "control is null.");
            }

            if (String.IsNullOrEmpty(height))
            {
                throw new ArgumentException("height is null or empty.", "height");
            }

            control.Attributes.Add("style", String.Format("height: {0};", height));
        }

        /// <summary>
        /// The add on click confirm dialog.
        /// </summary>
        /// <param name="control">
        /// The control.
        /// </param>
        /// <param name="message">
        /// The message.
        /// </param>
        public static void AddOnClickConfirmDialog(object control, string message)
        {
            if (control == null)
            {
                throw new ArgumentNullException("control", "control is null.");
            }

            if (String.IsNullOrEmpty(message))
            {
                throw new ArgumentException("message is null or empty.", "message");
            }

            AddOnClickConfirmDialog((WebControl)control, message);
        }

        /// <summary>
        /// The add on click confirm dialog.
        /// </summary>
        /// <param name="control">
        /// The control.
        /// </param>
        /// <param name="message">
        /// The message.
        /// </param>
        public static void AddOnClickConfirmDialog(WebControl control, string message)
        {
            if (control == null)
            {
                throw new ArgumentNullException("control", "control is null.");
            }

            if (String.IsNullOrEmpty(message))
            {
                throw new ArgumentException("message is null or empty.", "message");
            }

            control.Attributes["onclick"] = String.Format("return confirm('{0}');", message);
        }

        /// <summary>
        /// Gets the UserControl from URL.
        /// </summary>
        /// <param name="context">The context.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  8/5/2012   created
        /// </Modified>
        public static Control GetControl(string controlName)
        {
            UserControl userctrl = null;
            using (var dummyPage = new Page())
            {
                userctrl = dummyPage.LoadControl(controlName) as UserControl;
            }
            // Loaded user control is returned
            return userctrl;
        }

        /// <summary>
        /// Renders the UserControl to string.
        /// </summary>
        /// <param name="controlName">Name of the control.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  8/5/2012   created
        /// </Modified> 
        public static string RenderUserControlToString(string controlName)
        {
            Page page = new Page();
            Control control = page.LoadControl(controlName);
            page.Controls.Add(control);

            StringWriter writer = new StringWriter();
            HttpContext.Current.Server.Execute(page, writer, false);
            return writer.ToString();
        }
    }
}