using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HM.Util
{
    public class ExportExcelHelper
    {
        public static void Export(string fileName, GridView gv, bool gridLine)
        {
            Export(fileName, gv, false, string.Empty);
        }

        /// <summary>
        /// Export Excel to Girdview
        /// </summary>
        /// <param name="fileName">ten file</param>
        /// <param name="gv">Gridview</param>
        /// <param name="gridLine">True: hien thi GirdLine; False: Khong hien thi GirdLine</param>
        public static void Export(string fileName, GridView gv, bool gridLine, string title)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader(
                "content-disposition", string.Format("attachment; filename={0}", fileName));
            HttpContext.Current.Response.ContentType = "application/ms-excel";

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    //  Create a table to contain the grid
                    Table table = new Table();
                    if (gridLine)
                    {
                        gv.GridLines = GridLines.Both;
                        htw.AddAttribute(HtmlTextWriterAttribute.Border, "1");
                    }
                    else
                    {
                        gv.GridLines = gv.GridLines;
                        htw.AddAttribute(HtmlTextWriterAttribute.Border, gv.GridLines.ToString());
                    }

                    //  include the gridline settings
                    gv.RenderBeginTag(htw);
                    // Create Title for GridView When Export Excel 
                    if (!string.IsNullOrEmpty(title))
                    {
                        htw.Write("<tr><td colspan='" + gv.Columns.Count + "' align='center' style='font-size: 15px;height: 50px;  height:50px;padding-top: 5px;font-weight: bold;vertical-align: middle;'><b>");
                        htw.Write(title.ToUpper());
                        htw.Write("</b></td></tr>");
                        gv.RenderControl(htw);
                    }



                    //  add the header row to the table
                    if (gv.HeaderRow != null)
                    {
                        ExportExcelHelper.PrepareControlForExport(gv.HeaderRow);
                        gv.HeaderRow.RenderControl(htw);
                    }
                    //  add each of the data rows to the table
                    foreach (GridViewRow row in gv.Rows)
                    {
                        ExportExcelHelper.PrepareControlForExport(row);
                        row.RenderControl(htw);
                    }

                    //  add the footer row to the table
                    if (gv.FooterRow != null)
                    {
                        ExportExcelHelper.PrepareControlForExport(gv.FooterRow);
                        gv.FooterRow.RenderControl(htw);
                    }

                    //  render the table into the htmlwriter
                    //table.RenderControl(htw);
                    gv.RenderEndTag(htw);
                    //  render the htmlwriter into the response
                    HttpContext.Current.Response.Write(sw.ToString());
                    HttpContext.Current.Response.End();
                }
            }
        }

        /// <summary>
        /// Export Excel to Girdview
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="gv"></param>
        /// <param name="gridLine"></param>
        /// <param name="title"></param>
        /// <param name="reportDate"></param>
        /// <param name="vehicleGroup"></param>
        /// <param name="vehiclePlates"></param>
        public static void Export(string fileName, GridView gv, bool gridLine, string title, string reportDate, string vehicleGroup, string vehiclePlates)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader(
                "content-disposition", string.Format("attachment; filename={0}", fileName));
            HttpContext.Current.Response.ContentType = "application/ms-excel";

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    gv.Style.Add("font-family", "Times New Roman; Times, serif;");
                    gv.Style.Add("font-size", "12px");
                    gv.Style.Add("text-align", "center");
                    gv.HeaderRow.Style.Add("font-size", "13px");
                    gv.HeaderRow.Style.Add("font-family", "Times New Roman; Times, serif;");
                    gv.HeaderRow.Style.Add("background-color", "#C5D9F1");
                    gv.HeaderRow.Style.Add("height", "40");
                    gv.HeaderRow.Style.Add("width", "50");

                    for (int i = 1; i < gv.Columns.Count; i++)
                    {
                        gv.Columns[i].HeaderStyle.Width = 50;
                    }
                    //  Create a table to contain the grid
                    //Table table = new Table();
                    if (gridLine)
                    {
                        gv.GridLines = GridLines.Both;
                        htw.AddAttribute(HtmlTextWriterAttribute.Border, "1");
                    }
                    else
                    {
                        gv.GridLines = gv.GridLines;
                        htw.AddAttribute(HtmlTextWriterAttribute.Border, gv.GridLines.ToString());
                    }

                    //  include the gridline settings
                    gv.RenderBeginTag(htw);
                    // Create Title for GridView When Export Excel 
                    if (!string.IsNullOrEmpty(title))
                    {
                        htw.AddStyleAttribute(HtmlTextWriterStyle.FontFamily, "Time News Roman");
                        htw.AddStyleAttribute(HtmlTextWriterStyle.FontSize, "14px");
                        string titleStyle = string.Format("<tr><td colspan='{0}' align='center' style='font-family:Times New Roman, Times, serif;font-size: 20px; font-weight:bold ;height: 100px;  height:30px;padding-top: 5px;' >", gv.Columns.Count);
                        htw.Write(titleStyle);
                        htw.Write(title);
                        htw.Write("</td></tr>");
                        if (!string.IsNullOrEmpty(reportDate))
                        {
                            string reportDateStyle = string.Format("<tr><td colspan='{0}' align='center' style='font-family:Times New Roman, Times, serif;font-size: 14px;height: 100px;  height:20px;padding-top: 5px;' >", gv.Columns.Count);
                            htw.Write(reportDateStyle);
                            htw.Write(reportDate);
                            htw.Write("</td></tr>");
                        }
                        if (!string.IsNullOrEmpty(vehicleGroup))
                        {
                            string vehicleGroupStyle = string.Format("<tr><td colspan='{0}' align='center' style='font-family:Times New Roman, Times, serif;font-size: 14px;height: 100px;  height:20px;padding-top: 5px;' >", gv.Columns.Count);
                            htw.Write(vehicleGroupStyle);
                            htw.Write(vehicleGroup);
                            htw.Write("</td></tr>");
                        }
                        if (!string.IsNullOrEmpty(vehiclePlates))
                        {
                            string vehiclePlatesStyle = string.Format("<tr><td colspan='{0}' align='center' style='font-family:Times New Roman, Times, serif;font-size: 14px;height: 100px;  height:20px;padding-top: 5px;' >", gv.Columns.Count);
                            htw.Write(vehiclePlatesStyle);
                            htw.Write(vehiclePlates);
                            htw.Write("</td></tr>");
                        }
                        //gv.RenderControl(htw);
                    }

                    //  add the header row to the table
                    if (gv.HeaderRow != null)
                    {
                        ExportExcelHelper.PrepareControlForExport(gv.HeaderRow);
                        gv.HeaderRow.RenderControl(htw);
                    }
                    //  add each of the data rows to the table
                    foreach (GridViewRow row in gv.Rows)
                    {
                        htw.AddStyleAttribute(HtmlTextWriterStyle.TextAlign, "center");
                        htw.AddStyleAttribute(HtmlTextWriterStyle.VerticalAlign, "middle");
                        ExportExcelHelper.PrepareControlForExport(row);
                        row.RenderControl(htw);
                    }

                    //  add the footer row to the table
                    if (gv.FooterRow != null)
                    {
                        ExportExcelHelper.PrepareControlForExport(gv.FooterRow);
                        gv.FooterRow.RenderControl(htw);
                    }

                    //  render the table into the htmlwriter
                    //table.RenderControl(htw);
                    gv.RenderEndTag(htw);
                    //  render the htmlwriter into the response
                    HttpContext.Current.Response.Write(sw.ToString());
                    HttpContext.Current.Response.End();
                }
            }
        }

        /// <summary>
        /// Export Excel to Girdview
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="gv"></param>
        /// <param name="gridLine"></param>
        /// <param name="title"></param>
        /// <param name="reportDate"></param>
        /// <param name="vehicleGroup"></param>
        /// <param name="vehiclePlates"></param>
        public static void Export(string fileName, string title, string reportDate, string vehicleGroup, string vehiclePlates, string summary, string content)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader(
                "content-disposition", string.Format("attachment; filename={0}", fileName));
            HttpContext.Current.Response.ContentType = "application/ms-excel";

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    string table = "<table border='1' cellspacing='0' rules='all' style='border-collapse:collapse; font-family:Times New Roman; Times, serif; font-size:12px; text-align:center;'>";
                    htw.Write(table);
                    // Create Title for GridView When Export Excel 
                    if (!string.IsNullOrEmpty(title))
                    {
                        htw.AddStyleAttribute(HtmlTextWriterStyle.FontFamily, "Time News Roman");
                        htw.AddStyleAttribute(HtmlTextWriterStyle.FontSize, "14px");
                        string titleStyle = string.Format("<tr><td align='center' style='font-family:Times New Roman, Times, serif;font-size: 20px; font-weight:bold ; height: 30px; width: 1000px; padding-top: 5px;' >");
                        htw.Write(titleStyle);
                        htw.Write(title);
                        htw.Write("</td></tr>");
                        if (!string.IsNullOrEmpty(reportDate))
                        {
                            string reportDateStyle = string.Format("<tr><td align='center' style='font-family:Times New Roman, Times, serif; font-size: 14px; height: 20px; padding-top: 5px;' >");
                            htw.Write(reportDateStyle);
                            htw.Write(reportDate);
                            htw.Write("</td></tr>");
                        }
                        if (!string.IsNullOrEmpty(vehicleGroup))
                        {
                            string vehicleGroupStyle = string.Format("<tr><td align='center' style='font-family:Times New Roman, Times, serif; font-size: 14px; height: 20px; padding-top: 5px;' >");
                            htw.Write(vehicleGroupStyle);
                            htw.Write(vehicleGroup);
                            htw.Write("</td></tr>");
                        }
                        if (!string.IsNullOrEmpty(vehiclePlates))
                        {
                            string vehiclePlatesStyle = string.Format("<tr><td align='center' style='font-family:Times New Roman, Times, serif; font-size: 14px; height: 20px; padding-top: 5px;' >");
                            htw.Write(vehiclePlatesStyle);
                            htw.Write(vehiclePlates);
                            htw.Write("</td></tr>");
                        }
                        if (!string.IsNullOrEmpty(summary))
                        {
                            string summaryStyle = string.Format("<tr><td align='center' style='font-family:Times New Roman, Times, serif; font-size: 12px; height: 20px; padding-top: 5px;' >");
                            htw.Write(summaryStyle);
                            htw.Write(summary);
                            htw.Write("</td></tr>");
                        }
                        if (!string.IsNullOrEmpty(content))
                        {
                            string contentStyle = string.Format("<tr><td rowspan='{0}' style='font-family:Times New Roman, Times, serif; font-size: 12px; line-height: 10px; padding-top: 5px; vertical-align: top;' >", Convert.ToInt32(content.Length / 200));
                            htw.Write(contentStyle);
                            htw.Write(content);
                            htw.Write("</td></tr>");
                        }
                    }
                    htw.Write("</table>");
                    //  render the htmlwriter into the response
                    HttpContext.Current.Response.Write(sw.ToString());
                    HttpContext.Current.Response.End();
                }
            }
        }

        /// <summary>
        /// Replace any of the contained controls with literals
        /// </summary>
        /// <param name="control"></param>
        private static void PrepareControlForExport(Control control)
        {
            for (int i = 0; i < control.Controls.Count; i++)
            {
                Control current = control.Controls[i];
                if (current is LinkButton)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as LinkButton).Text));
                }
                else if (current is ImageButton)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as ImageButton).AlternateText));
                }
                else if (current is HyperLink)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as HyperLink).Text));
                }
                else if (current is DropDownList)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as DropDownList).SelectedItem.Text));
                }
                else if (current is CheckBox)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as CheckBox).Checked ? "True" : "False"));
                }
                else if (current is Image)
                {
                    control.Controls.Remove(current);
                    control.Controls.AddAt(i, new LiteralControl((current as Image).AlternateText));
                }

                if (current.HasControls())
                {
                    ExportExcelHelper.PrepareControlForExport(current);
                }
            }
        }
    }
}

