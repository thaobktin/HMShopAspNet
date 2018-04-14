using System;
using System.IO;
using System.Net;
using System.Collections.Generic;
using System.Text.RegularExpressions;


namespace HM.Util
{
    /// <summary>
    /// Summary description for LinkParsers
    /// </summary>
    public class LinkParsers
    {
        public LinkParsers()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        // Nice & handy non-caching Web request method
        public static string RunUrl(string url)
        {
            try
            {
                WebRequest request = WebRequest.Create(url);

                //HttpRequestCachePolicy noCachePolicy = new HttpRequestCachePolicy(HttpRequestCacheLevel.NoCacheNoStore);
                //request.CachePolicy = noCachePolicy;

                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                Stream dataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);

                string responseFromServer = reader.ReadToEnd();

                reader.Close();
                dataStream.Close();
                response.Close();

                return responseFromServer;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string[] GetHttpResponseHeader(string url)
        {
            string[] RetVal = new string[3];
            WebRequest request = WebRequest.Create(url);

            //HttpRequestCachePolicy noCachePolicy = new HttpRequestCachePolicy(HttpRequestCacheLevel.NoCacheNoStore);
            //request.CachePolicy = noCachePolicy;

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();

            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);

            string responseFromServer = reader.ReadToEnd();

            reader.Close();
            dataStream.Close();
            response.Close();

            string regexTitle = @"(?<=<title.*>)([\s\S]*)(?=</title>)";
            Regex TitleMatch = new Regex(regexTitle, RegexOptions.IgnoreCase);
            RetVal[0] = TitleMatch.Match(responseFromServer).Value.Trim();
            return RetVal;
        }
        public string GetTextBetween(string anchor, string trail, string source)
        {
            string retVal = string.Empty;
            int pos = source.IndexOf(anchor);
            if (pos > 1)
            {
                source = source.Substring(pos + anchor.Length);
                pos = source.IndexOf(trail); //" results";
                string value = source.Substring(0, pos);
                value = value.Replace(",", "");
                //value = value.Replace(".", "");
                retVal = value;
            }

            return retVal;
        }

        public int GetLinks(string searchURL, string anchor, string trail)
        {
            int count = 0;
            string serverResponse = RunUrl(searchURL);
            int pos = serverResponse.IndexOf(anchor);
            if (pos > 1)
            {
                serverResponse = serverResponse.Substring(pos + anchor.Length);
                pos = serverResponse.IndexOf(trail); //" results";
                string value = serverResponse.Substring(0, pos);
                value = value.Replace(",", "");
                value = value.Replace(".", "");
                count = Int32.Parse(value);
            }

            return count;
        }
        public string GetLinksText(string searchURL, string anchor, string trail)
        {
            string retVal = string.Empty;
            string serverResponse = RunUrl(searchURL);
            int pos = serverResponse.IndexOf(anchor);
            if (pos > 1)
            {
                serverResponse = serverResponse.Substring(pos + anchor.Length);
                pos = serverResponse.IndexOf(trail); //" results";
                string value = serverResponse.Substring(0, pos);
                value = value.Replace(",", "");
                value = value.Replace(".", "");
                retVal = value;
            }

            return retVal;
        }


        public string GetWebPageTitle(string url)
        {

            // Create a request to the url

            HttpWebRequest request = HttpWebRequest.Create(url) as HttpWebRequest;
            // If the request wasn't an HTTP request (like a file), ignore it
            if (request == null) return null;
            // Use the user's credentials
            request.UseDefaultCredentials = true;
            request.Method = "HEAD";
            // Obtain a response from the server, if there was an error, return nothing
            HttpWebResponse response = null;
            try { response = request.GetResponse() as HttpWebResponse; }
            catch (WebException) { return null; }
            // Regular expression for an HTML title
            string regex = @"(?<=<title.*>)([\s\S]*)(?=</title>)";
            // If the correct HTML header exists for HTML text, continue
            if (new List<string>(response.Headers.AllKeys).Contains("Content-Type"))
                if (response.Headers["Content-Type"].StartsWith("text/html"))
                {
                    // Download the page
                    WebClient web = new WebClient();
                    web.UseDefaultCredentials = true;
                    string page = web.DownloadString(url);
                    // Extract the title
                    Regex ex = new Regex(regex, RegexOptions.IgnoreCase);
                    return ex.Match(page).Value.Trim();

                }

            // Not a valid HTML page

            return null;

        }
    }
}