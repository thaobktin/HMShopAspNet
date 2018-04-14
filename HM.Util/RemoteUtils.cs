using System.IO;
using System.Net;


namespace HM.Util
{
    public class RemoteUtils
    {
        public static string GetDataFromUrl(string requestURL, int timeOut)
        {
            WebRequest request = WebRequest.Create(requestURL);
            request.Timeout = timeOut;
            StreamReader reader = new StreamReader(request.GetResponse().GetResponseStream());
            return reader.ReadToEnd();
        }
    }
}

