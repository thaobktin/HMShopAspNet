using System;
using System.Web;
using System.Text;
using System.Text.RegularExpressions;
using System.Data;
using System.Linq;
using System.Drawing;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Reflection;
using System.Security.Cryptography;

namespace HM.Util
{
    public class StringHelper
    {
        public static int LangID
        {
            get
            {
                if (HttpContext.Current.Session["LangID"] != null) return (int)HttpContext.Current.Session["LangID"];
                else return 1;
            }
            set
            {
                HttpContext.Current.Session["LangID"] = value;
            }
        }
        public static int ZoneSelected
        {
            get
            {
                if (HttpContext.Current.Session["ZoneSelected"] != null)
                    return (int)HttpContext.Current.Session["ZoneSelected"];
                else return 0;
            }
            set
            {
                HttpContext.Current.Session["ZoneSelected"] = value;
            }
        }
        public static string StringCut(string input, int NumberOfWords)
        {
            string[] words = input.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            string output = "";
            if (words.Length > NumberOfWords)
            {
                for (int i = 0; i < NumberOfWords; i++)
                {
                    output += words[i] + " ";
                }
                return (output + "...");
            }
            else return input;
        }
        public static string RemoveGoogleAds(string Input)
        {
            Input = Input.Replace("google_ad_", string.Empty);
            Input = Input.Replace("GA_google", string.Empty);
            Input = Input.Replace("GS_google", string.Empty);
            Input = Input.Replace("GA_google", string.Empty);
            Input = Input.Replace("http://partner.googleadservices.com/gampad/google_service.js", string.Empty);
            Input = Input.Replace("http://pagead2.googlesyndication.com/pagead/show_ads.js", string.Empty);
            return Input;
        }
        private static string ReplaceFirst(string haystack, string needle, string replacement)
        {
            int pos = haystack.IndexOf(needle);
            if (pos < 0) return haystack;
            return haystack.Substring(0, pos) + replacement + haystack.Substring(pos + needle.Length);
        }
        private static string ReplaceAll(string haystack, string needle, string replacement)
        {
            int pos;
            // Avoid a possible infinite loop
            if (needle == replacement) return haystack;
            while ((pos = haystack.IndexOf(needle)) > 0)
                haystack = haystack.Substring(0, pos) + replacement + haystack.Substring(pos + needle.Length);
            return haystack;
        }
        public static string StripTags(string Input, string[] AllowedTags, string replacement)
        {
            Regex StripHTMLExp = new Regex(@"(<\/?[^>]+>)");
            string Output = Input;

            foreach (Match Tag in StripHTMLExp.Matches(Input))
            {
                string HTMLTag = Tag.Value.ToLower();
                bool IsAllowed = false;

                foreach (string AllowedTag in AllowedTags)
                {
                    int offset = -1;

                    // Determine if it is an allowed tag
                    // "<tag>" , "<tag " and "</tag"
                    if (offset != 0) offset = HTMLTag.IndexOf('<' + AllowedTag + '>');
                    if (offset != 0) offset = HTMLTag.IndexOf('<' + AllowedTag + ' ');
                    if (offset != 0) offset = HTMLTag.IndexOf("</" + AllowedTag);

                    // If it matched any of the above the tag is allowed
                    if (offset == 0)
                    {
                        IsAllowed = true;
                        break;
                    }
                }

                // Remove tags that are not allowed
                if (!IsAllowed) Output = ReplaceFirst(Output, Tag.Value, replacement);
            }

            return Output;
        }
        public static string StripTagsAndAttributes(string Input, string[] AllowedTags)
        {
            /* Remove all unwanted tags first */
            string Output = StripTags(Input, AllowedTags, "");

            /* Lambda functions */
            MatchEvaluator HrefMatch = m => m.Groups[1].Value + "href..;,;.." + m.Groups[2].Value;
            MatchEvaluator ClassMatch = m => m.Groups[1].Value + "class..;,;.." + m.Groups[2].Value;
            MatchEvaluator UnsafeMatch = m => m.Groups[1].Value + m.Groups[4].Value;

            /* Allow the "href" attribute */
            Output = new Regex("(<a.*)href=(.*>)").Replace(Output, HrefMatch);

            /* Allow the "class" attribute */
            Output = new Regex("(<a.*)class=(.*>)").Replace(Output, ClassMatch);

            /* Remove unsafe attributes in any of the remaining tags */
            Output = new Regex(@"(<.*) .*=(\'|\""|\w)[\w|.|(|)]*(\'|\""|\w)(.*>)").Replace(Output, UnsafeMatch);

            /* Return the allowed tags to their proper form */

            return Output;
        }
        public static string RemoveVietnamese(string Input)
        {
            try
            {
                char[] Thga = "aáàạảãâấầậẩẫăắằặẳẵ".ToCharArray();
                char[] Thge = "eéèẹẻẽêếềệểễeeeeee".ToCharArray();
                char[] Thgo = "oóòọỏõôốồộổỗơớờợởỡ".ToCharArray();
                char[] Thgu = "uúùụủũưứừựửữuuuuuu".ToCharArray();
                char[] Thgi = "iíìịỉĩiiiiiiiiiiii".ToCharArray();
                char[] Thgd = "dđdddddddddddddddd".ToCharArray();
                char[] Thgy = "yýỳỵỷỹyyyyyyyyyyyy".ToCharArray();
                char[] HoaA = "AÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ".ToCharArray();
                char[] HoaE = "EÉÈẸẺẼÊẾỀỆỂỄEEEEEE".ToCharArray();
                char[] HoaO = "OÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ".ToCharArray();
                char[] HoaU = "UÚÙỤỦŨƯỨỪỰỬỮUUUUUU".ToCharArray();
                char[] HoaI = "IÍÌỊỈĨIIIIIIIIIIII".ToCharArray();
                char[] HoaD = "DĐDDDDDDDDDDDDDDDD".ToCharArray();
                char[] HoaY = "YÝỲỴỶỸYYYYYYYYYYYY".ToCharArray();
                for (int i = 1; i < Thga.Length; i++)
                {
                    Input = Input.Replace(Thga[i], Thga[0]);
                    Input = Input.Replace(Thge[i], Thge[0]);
                    Input = Input.Replace(Thgo[i], Thgo[0]);
                    Input = Input.Replace(Thgu[i], Thgu[0]);
                    Input = Input.Replace(Thgi[i], Thgi[0]);
                    Input = Input.Replace(Thgd[i], Thgd[0]);
                    Input = Input.Replace(Thgy[i], Thgy[0]);
                    Input = Input.Replace(HoaA[i], HoaA[0]);
                    Input = Input.Replace(HoaE[i], HoaE[0]);
                    Input = Input.Replace(HoaO[i], HoaO[0]);
                    Input = Input.Replace(HoaU[i], HoaU[0]);
                    Input = Input.Replace(HoaI[i], HoaI[0]);
                    Input = Input.Replace(HoaD[i], HoaD[0]);
                    Input = Input.Replace(HoaY[i], HoaY[0]);
                }

                Input = Input.Replace(":", "");
                Input = Input.Replace("?", "");
                Input = Input.Replace(",", "");
                Input = Input.Replace(".", "");
                Input = Input.Replace(":", "");
                Input = Input.Replace("”", "");
                Input = Input.Replace("“", "");
                Input = Input.Replace("&", "");
                Input = Input.Replace("#", "");
                Input = Input.Replace("$", "");
                Input = Input.Replace("@", "");
                Input = Input.Replace("!", "");
                Input = Input.Replace("(", "");
                Input = Input.Replace(")", "");
                Input = Input.Replace(";", "");
                Input = Input.Replace("<", "");
                Input = Input.Replace(">", "");
                Input = Input.Replace("\"", "");
                Input = Input.Replace("\n", "");
                Input = Input.Replace("\r", "");
                Input = Input.Replace("/", "-");
                Input = Input.Replace("'", "");
                Input = Input.Replace("`", "");
                Input = Input.Replace("é", "e");
                Input = Input.Replace("*", "e");
                Input = Input.Replace(" - ", "-");
                Input = Input.Replace(" ", "-");
                Input = HttpUtility.UrlEncode(Input);
                Input = Input.Replace("%", "");
            }
            catch (Exception ex)
            {
                Input = ex.Message;
            }

            return Input;
        }
        public static string RemoveSpace(string input)
        {
            input = input.Replace("<p></p>", "");
            input = Regex.Replace(input, @"</p>(\s*)<br>", "</p>");
            input = Regex.Replace(input, @"<p>(\s*)<br>", "<p>");
            input = Regex.Replace(input, @"<div>(\s*)<br>", "<div>");
            input = Regex.Replace(input, @"<br>(\s*)</p>", "</p>");
            input = Regex.Replace(input, @"<br>(\s*)</div>", "</div>");
            input = Regex.Replace(input, @"<p>(\s*)</p>", "");

            return input;
        }
        public static string RefineContentBody(string input)
        {
            input = Regex.Replace(input, @"<iframe(.+?)></iframe>", "");
            input = input.Replace("/avatar.aspx", "http://www.baomoi.com/avatar.aspx");
            input = input.Replace("width='400'", "");
            string[] inputSplit = input.Split(new string[] { "</h4>" }, StringSplitOptions.RemoveEmptyEntries);
            if (inputSplit.Length == 2) input = inputSplit[1];
            return input;
        }
        public static string TrimAuthor(string input)
        {
            bool DidIt = false;
            string[] Strippers = { "|", "—", "--", "-" };
            foreach (string Stripper in Strippers)
            {
                if (DidIt == true) break;

                if (input.Contains(Stripper))
                {
                    int Position = input.IndexOf(Stripper) + 1;
                    if (Position < 40)
                    {
                        input = input.Substring(Position).Trim();
                    }
                }
            }

            return input;
        }
        public static string TimeRunCalculator(DateTime ContentCreateDate)
        {
            string retVal = string.Empty;
            bool HasHour = false;
            bool HasDay = false;
            DateTime Now = DateTime.Now;
            TimeSpan PassedTime = Now - ContentCreateDate;
            int TotalMinutes = Convert.ToInt32(PassedTime.TotalMinutes);
            if (TotalMinutes > 60) HasHour = true;
            if (TotalMinutes > 1440) HasDay = true;
            if (HasDay)
            {
                double temp = TotalMinutes / 1440;
                int DayCount = (int)Math.Floor(temp);
                TotalMinutes = TotalMinutes - DayCount * 1440;
                temp = TotalMinutes / 60;
                int HourCount = (int)Math.Floor(temp);
                TotalMinutes = TotalMinutes - HourCount * 60;
                retVal = "Đăng " + DayCount.ToString() + " ngày " + HourCount.ToString() + " giờ " + TotalMinutes.ToString() + " phút trước";
            }
            else if (HasHour && !HasDay)
            {
                double temp = TotalMinutes / 60;
                int HourCount = (int)Math.Floor(temp);
                TotalMinutes = TotalMinutes - HourCount * 60;
                retVal = "Đăng " + HourCount.ToString() + " giờ " + TotalMinutes.ToString() + " phút trước";
            }
            else if (!HasDay && !HasHour)
            {
                retVal = "Đăng " + TotalMinutes.ToString() + " phút trước";
            }

            return retVal;
        }
        public static int CheckNumeric(string InputValue)
        {
            try
            {
                return Convert.ToInt32(InputValue);
            }
            catch
            {
                return -1;
            }
        }
        public static string getUrlContent(string zoneUrl, string headline, int contentId)
        {
            return "/" + zoneUrl + "/" + RemoveVietnamese(headline.Trim()) + "-" + contentId;
        }
        public static string getUrlAuthor(string fullName, int authorId)
        {
            return "/" + StringHelper.RemoveVietnamese(fullName.Trim()) + "-" + authorId;
        }
        public static object DataTableToJSON(DataTable table)
        {
            var list = new List<Dictionary<string, object>>();

            foreach (DataRow row in table.Rows)
            {
                var dict = new Dictionary<string, object>();

                foreach (DataColumn col in table.Columns)
                {
                    dict[col.ColumnName] = (Convert.ToString(row[col]));
                }
                list.Add(dict);
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(list);
        }
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        public static Image ScaleImage(Image image, int maxWidth, int maxHeight)
        {
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);

            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);

            var newImage = new Bitmap(newWidth, newHeight);

            using (var graphics = Graphics.FromImage(newImage))
                graphics.DrawImage(image, 0, 0, newWidth, newHeight);

            return newImage;
        }
        public static Bitmap CropImage(Image originalImage, Rectangle sourceRectangle, Rectangle? destinationRectangle = null)
        {
            if (destinationRectangle == null)
            {
                destinationRectangle = new Rectangle(Point.Empty, sourceRectangle.Size);
            }

            var croppedImage = new Bitmap(destinationRectangle.Value.Width,
                destinationRectangle.Value.Height);
            using (var graphics = Graphics.FromImage(croppedImage))
            {
                graphics.DrawImage(originalImage, destinationRectangle.Value,
                    sourceRectangle, GraphicsUnit.Pixel);
            }
            return croppedImage;
        }
        public static string SubDateTimeWithCurrent(DateTime time)
        {
            DateTime current = DateTime.Now;
            TimeSpan span = current.Subtract(time);
            if (span.Days>0)
            {
                return span.Days + " days ago";
            }
            else
            {
                if (span.Hours > 0)
                {
                    return span.Hours + " hours ago";
                }
                else
                {
                    return span.Minutes + "Minutes ago";
                }
            }
        }

        /// <summary>
        /// Bo cac tag html, tra ve thuan text.
        /// </summary>
        /// <param name="text">The text.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/9/2012   created
        /// </Modified>
        public static string StripHtml(string text)
        {
            string ret = string.Empty;
            try
            {
                string s = RemoveMultipleWhitespace(text.Trim());
                string strip = Regex.Replace(s, @"<(.|\n)*?>", string.Empty);

                if (!string.IsNullOrEmpty(strip))
                {
                    ret = strip;
                }
                else
                {
                    ret = EncodeHTMLTag(text);
                }
            }
            catch { }

            return ret;
        }

        /// <summary>
        /// Removes the script tag.
        /// </summary>
        /// <param name="strData">Doan text can remove</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/9/2012   created
        /// </Modified>
        public static string RemoveScriptTag(string strData)
        {
            strData = Regex.Replace(strData, "<script.*?</script>", "", RegexOptions.Singleline | RegexOptions.IgnoreCase);
            return strData;
        }

        /// <summary>
        /// Removes the HTML va javascript tag.
        /// </summary>
        /// <param name="text">Doan text can remove</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/9/2012   created
        /// </Modified>
        public static string RemoveHtmlJavascriptTag(string text)
        {
            string ret = "";
            try
            {
                text = HttpContext.Current.Server.HtmlDecode(text);
                Regex re = new Regex(@"<script\s[^>]*>.*?</script>|<\s*(?!/?(?:br?|i|p|u)\b[^>]*>)[^>]*>", RegexOptions.IgnoreCase | RegexOptions.Singleline);

                ret = re.Replace(text, string.Empty);
            }
            catch
            {
                text = "";
            }

            return ret;
        }

        /// <summary>
        /// Kiem tra xem doan text co chua cac the html ko?
        /// </summary>
        /// <param name="text">The text.</param>
        /// <returns>
        ///   <c>true</c> doan ma co chua the html ; otherwise <c>false</c>.
        /// </returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/9/2012   created
        /// </Modified>
        public static bool IsContainsHTMLTag(string text)
        {
            Regex regex = new Regex(@"<(.|\n)*?>", RegexOptions.IgnoreCase);

            return regex.IsMatch(text);
        }

        /// <summary>
        /// Encodes the HTML tag.
        /// </summary>
        /// <param name="text">Doan text can encode.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  2/9/2012   created
        /// </Modified>
        public static string EncodeHTMLTag(string text)
        {
            if (text.IndexOf('<') >= 0)
            {
                return HttpUtility.HtmlEncode(text);
            }
            return text;
        }

        /// <summary>
        /// Replaces the single quotes.
        /// fix quotes for SQL insertion...
        /// </summary>
        /// <param name="text">The text.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  15/8/2012   created
        /// </Modified>
        public static string ReplaceSingleQuotes(string text)
        {
            string result = string.Empty;
            if (string.IsNullOrEmpty(text))
            {
                return result;
            }
            result = text.Replace("'", "''").Trim();

            return result;
        }

        /// <summary>
        /// Removes multiple single quote ' characters from a string.
        /// </summary>
        /// <param name="text">
        /// </param>
        /// <returns>
        /// The remove multiple single quotes.
        /// </returns>
        public static string RemoveMultipleSingleQuotes(string text)
        {
            string result = String.Empty;
            if (String.IsNullOrEmpty(text))
            {
                return result;
            }

            var r = new Regex(@"\'");
            return r.Replace(text, @"'");
        }

        /// <summary>
        /// Removes multiple whitespace characters from a string.
        /// </summary>
        /// <param name="text">
        /// </param>
        /// <returns>
        /// The remove multiple whitespace.
        /// </returns>
        public static string RemoveMultipleWhitespace(string text)
        {
            string result = String.Empty;
            if (String.IsNullOrEmpty(text))
            {
                return result;
            }

            var r = new Regex(@"\s+");
            return r.Replace(text, @" ");
        }

        /// <summary>
        /// Bo tat ca khoang trang khoang trang trong chuoi truyen vao
        /// 29R2 7314 -> 29R27314
        /// </summary>
        /// <param name="text">
        /// </param>
        /// <returns>
        /// The remove multiple whitespace.
        /// </returns>
        public static string RemoveWhitespace(string text)
        {
            string result = String.Empty;
            if (String.IsNullOrEmpty(text))
            {
                return result;
            }

            var r = new Regex(@"\s+");
            return r.Replace(text, string.Empty);
        }

        /// <summary>
        /// Truncates a string with the specified limits and adds (...) to the end if truncated
        /// </summary>
        /// <param name="input">
        /// input string
        /// </param>
        /// <param name="limit">
        /// max size of string
        /// </param>
        /// <returns>
        /// truncated string
        /// </returns>
        public static string Truncate(string input, int limit)
        {
            string output = input;

            if (String.IsNullOrEmpty(input))
            {
                return null;
            }

            // Check if the string is longer than the allowed amount
            // otherwise do nothing
            if (output.Length > limit && limit > 0)
            {
                // cut the string down to the maximum number of characters
                output = output.Substring(0, limit);

                // Check if the space right after the truncate point 
                // was a space. if not, we are in the middle of a word and 
                // need to cut out the rest of it
                if (input.Substring(output.Length, 1) != " ")
                {
                    int lastSpace = output.LastIndexOf(" ");

                    // if we found a space then, cut back to that space
                    if (lastSpace != -1)
                    {
                        output = output.Substring(0, lastSpace);
                    }
                }

                // Finally, add the "..."
                output += "...";
            }

            return output;
        }

        /// <summary>
        /// Truncates a string with the specified limits by adding (...) to the middle
        /// </summary>
        /// <param name="input">
        /// input string
        /// </param>
        /// <param name="limit">
        /// max size of string
        /// </param>
        /// <returns>
        /// truncated string
        /// </returns>
        public static string TruncateMiddle(string input, int limit)
        {
            if (String.IsNullOrEmpty(input))
            {
                return null;
            }

            string output = input;
            const string middle = "...";

            // Check if the string is longer than the allowed amount
            // otherwise do nothing
            if (output.Length > limit && limit > 0)
            {
                // figure out how much to make it fit...
                int left = (limit / 2) - (middle.Length / 2);
                int right = limit - left - (middle.Length / 2);

                if ((left + right + middle.Length) < limit)
                {
                    right++;
                }
                else if ((left + right + middle.Length) > limit)
                {
                    right--;
                }

                // cut the left side
                output = input.Substring(0, left);

                // add the middle
                output += middle;

                // add the right side...
                output += input.Substring(input.Length - right, right);
            }

            return output;
        }

        /// <summary>
        /// Bo xung tag <br/> vao chuoi html
        /// </summary>
        /// <param name="input">The input.</param>
        /// <param name="limit">The limit.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  16/1/2013   created
        /// </Modified>
        public static string AppendBreak(string input, int limit)
        {
            string output = input;
            if (!string.IsNullOrEmpty(input))
            {
                string[] values = EnumerateByLength(input, limit).ToArray();
                if (values != null && values.Length > 1)
                {
                    return string.Join("<br/>", values);
                }
            }
            return output;
        }

        /// <summary>
        /// Tach chuoi theo do dai
        /// </summary>
        /// <param name="text"></param>
        /// <param name="length"></param>
        /// <returns></returns>
        protected static IEnumerable<string> EnumerateByLength(string text, int length)
        {
            int index = 0;
            while (index < text.Length)
            {
                int charCount = Math.Min(length, text.Length - index);
                yield return text.Substring(index, charCount);
                index += length;
            }
        }

        /// <summary>
        /// Cắt khoảng trắng
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string TrimSpace(string str)
        {
            if (str == null) return string.Empty;
            string sT = str.TrimEnd().TrimStart();

            while (sT.Contains("  "))
            {
                sT = sT.Remove(sT.IndexOf("  "), 1);
            }
            return sT;
        }

        /// <summary>
        /// encrypt password
        /// </summary>
        /// <param name="Password"></param>
        /// <returns></returns>
        public static string EncryptPassword(string Password)
        {
            System.Text.UnicodeEncoding encoding = new System.Text.UnicodeEncoding();
            byte[] hashBytes = encoding.GetBytes(Password);

            //Compute the SHA-1 hash
            SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();

            byte[] cryptPassword = sha1.ComputeHash(hashBytes);

            return BitConverter.ToString(cryptPassword);
        }

        /// <summary>
        /// Lay ra ten va gia tri cua tung thuoc tinh cua doi tuong
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj">The obj.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  13/9/2012   created
        /// </Modified>
        public static string GetValueProperties<T>(T obj) where T : class
        {
            StringBuilder sb = new StringBuilder();

            PropertyInfo[] pros = obj.GetType().GetProperties();

            sb.AppendLine(string.Format("BEGIN:{0}", obj.GetType().Name.ToUpper()));
            foreach (PropertyInfo p in pros)
            {
                sb.AppendFormat("[{0}:{1}]", p.Name, p.GetValue(obj, null));
                sb.AppendLine();
            }
            sb.AppendLine(string.Format("END:{0}", obj.GetType().Name.ToUpper()));
            return sb.ToString();
        }

        /// <summary>
        /// Lay ra ten va gia tri cua cac thuoc tinh trong object
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list">The list.</param>
        /// <returns></returns>
        /// <Modified>
        /// Name     Date         Comments
        /// trungtq  13/9/2012   created
        /// </Modified>
        public static string GetValueProperties<T>(List<T> list) where T : class
        {
            StringBuilder sb = new StringBuilder();
            if (list != null && list.Count > 0)
            {
                foreach (T item in list)
                {
                    sb.Append(GetValueProperties<T>(item));
                }
            }
            return sb.ToString();
        }
    }
}
