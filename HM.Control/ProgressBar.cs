using System;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace HM.Control
{
    public class ProgressBar : WebControl
    {
        private string barImageUrl = "";
        private int cellCount = 20;
        private string fillImageUrl = "";
        private string imageGeneratorUrl = "";
        private int percentage = 0;

        public ProgressBar()
        {
            this.BackColor = Color.LightGray;
            this.ForeColor = Color.Blue;
            this.BorderColor = Color.Empty;
            base.Width = Unit.Pixel(100);
            base.Height = Unit.Pixel(0x10);
        }

        protected override void Render(HtmlTextWriter output)
        {
            if (this.Width.Type != UnitType.Pixel)
            {
                throw new ArgumentException("The width must be in pixels");
            }
            int num = (int) this.Width.Value;
            if (this.ImageGeneratorUrl != "")
            {
                string str = "";
                if (this.BorderColor != Color.Empty)
                {
                    str = "&bc=" + ColorTranslator.ToHtml(this.BorderColor);
                }
                output.Write(string.Format("<img src='{0}?w={1}&h={2}&p={3}&fc={4}&bk={5}{6}' border='0' width='{1}' height='{2}'>", new object[] { this.ImageGeneratorUrl, num, this.Height.ToString(), this.Percentage, ColorTranslator.ToHtml(this.ForeColor), ColorTranslator.ToHtml(this.BackColor), str }));
            }
            else
            {
                if (this.BorderColor != Color.Empty)
                {
                    output.Write("<table border='0' cellspacing='0' cellpadding='1' bgColor='" + ColorTranslator.ToHtml(this.BorderColor) + "'><tr><td>");
                }
                if (this.BarImageUrl == "")
                {
                    output.Write(string.Concat(new object[] { "<table border='0' cellspacing='0' cellpadding='0' height='", this.Height, "' bgColor='", ColorTranslator.ToHtml(this.BackColor), "'><tr>" }));
                    int num2 = num / this.cellCount;
                    int num3 = 0;
                    int percentageStep = this.PercentageStep;
                    string str3 = "";
                    if (this.Page.Request.Browser.Browser.ToUpper() == "NETSCAPE")
                    {
                        if (this.FillImageUrl != "")
                        {
                            str3 = string.Concat(new object[] { "<img src='", this.FillImageUrl, "' border='0' width='", num2, "'>" });
                        }
                        else
                        {
                            str3 = "&nbsp;";
                        }
                    }
                    int num5 = 0;
                    while (num5 < this.cellCount)
                    {
                        string str2;
                        if (num3 < this.percentage)
                        {
                            str2 = " bgColor='" + ColorTranslator.ToHtml(this.ForeColor) + "'";
                        }
                        else
                        {
                            str2 = "";
                        }
                        if (num5 == 0)
                        {
                            output.Write(string.Concat(new object[] { "<td height='", this.Height, "' width='", num2, "'", str2, ">", str3, "</td>" }));
                        }
                        else
                        {
                            output.Write(string.Concat(new object[] { "<td width='", num2, "'", str2, ">", str3, "</td>" }));
                        }
                        num5++;
                        num3 += percentageStep;
                    }
                    output.Write("</tr></table>");
                }
                else
                {
                    int num6 = (int) ((((double) this.percentage) / 100.0) * num);
                    output.Write(string.Concat(new object[] { "<table border='0' cellpadding='0' cellSpacing='0' bgColor='", ColorTranslator.ToHtml(this.BackColor), "'><tr><td width='", num, "'>" }));
                    output.Write(string.Concat(new object[] { "<img src='", this.BarImageUrl, "' width='", num6, "' height='", this.Height, "'>" }));
                    output.Write("</td></tr></table>");
                }
                if (this.BorderColor != Color.Empty)
                {
                    output.Write("</td></tr></table>");
                }
            }
        }

        public string BarImageUrl
        {
            get
            {
                return this.barImageUrl;
            }
            set
            {
                this.barImageUrl = value;
            }
        }

        public string FillImageUrl
        {
            get
            {
                return this.fillImageUrl;
            }
            set
            {
                this.fillImageUrl = value;
            }
        }

        public string ImageGeneratorUrl
        {
            get
            {
                return this.imageGeneratorUrl;
            }
            set
            {
                this.imageGeneratorUrl = value;
            }
        }

        public int Percentage
        {
            get
            {
                return this.percentage;
            }
            set
            {
                if (value > 100)
                {
                    this.percentage = 100;
                }
                else if (value < 0)
                {
                    this.percentage = 0;
                }
                else
                {
                    this.percentage = value;
                }
            }
        }

        public int PercentageStep
        {
            get
            {
                return (100 / this.cellCount);
            }
            set
            {
                if ((100 % value) != 0)
                {
                    throw new ArgumentException("The percentage step value must be divisible by 100");
                }
                this.cellCount = 100 / value;
            }
        }
    }
}

