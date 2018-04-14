using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HM.Util
{
    /// <summary>
    /// Class tien ich lam viec voi UserAgent (Mobile Device, Spider Agent)
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  28/9/2012   created
    /// </Modified>
    public class UserAgentHelper
    {
        /// <summary>
        /// The spider contains.
        /// </summary>
        private static readonly string[] spiderContains = {
                                                        "abachoBOT", "abcdatos_botlink", "ah-ha.com crawler", "antibot", 
                                                        "appie", "AltaVista-Intranet", "Acoon Robot", "Atomz", 
                                                        "Arachnoidea", "AESOP_com_SpiderMan", "AxmoRobot", 
                                                        "ArchitextSpider", "AlkalineBOT", "Aranha", "asterias",
                                                        "Baidu","Bingbot","Buscaplus Robi", "CanSeek", "ChristCRAWLER", 
                                                        "Clushbot", "Crawler", "CrawlerBoy", "DeepIndex", "DefaultCrawler", 
                                                        "DittoSpyder", "DIIbot", "EZResult", "EARTHCOM.info", "EuripBot", 
                                                        "ESISmartSpider", "FAST-WebCrawler", "FyberSearch", 
                                                        "Findexa Crawler", "Fluffy", "Googlebot", "geckobot", 
                                                        "GenCrawler", "GeonaBot", "getRAX", "Gulliver", "Hubater", 
                                                        "ia_archiver", "Slurp", "Scooter", "Mercator", "RaBot", "Jack", 
                                                        "Speedy Spider", "moget", "Toutatis", "IlTrovatore-Setaccio", 
                                                        "IncyWincy", "UltraSeek", "InfoSeek Sidewinder", "Mole2", 
                                                        "MP3Bot", "Knowledge.com", "kuloko-bot", "LNSpiderguy", 
                                                        "Linknzbot", "lookbot", "MantraAgent", "NetResearchServer", 
                                                        "Lycos", "JoocerBot", "HenryTheMiragoRobot", "MojeekBot", 
                                                        "mozDex", "MSNBOT", "Navadoo Crawler", "ObjectsSearch", 
                                                        "OnetSzukaj", "PicoSearch", "PJspider", "nttdirectory_robot", 
                                                        "maxbot.com", "Openfind", "psbot", "QweeryBot", "StackRambler", 
                                                        "SeznamBot", "Search-10", "Scrubby", "speedfind ramBot xtreme", 
                                                        "Kototoi", "SearchByUsa", "Searchspider", "SightQuestBot", 
                                                        "Spider_Monkey", "Surfnomore", "teoma", "UK Searcher Spider", 
                                                        "Nazilla", "MuscatFerret", "ZyBorg", "WIRE WebRefiner", "WSCbot", 
                                                        "Yandex", "Yellopet-Spider", "YBSbot", "OceanSpiders", 
                                                        "MozSpider"
                                                      };

        /// <summary>
        /// Tests if the user agent is a mobile device.
        /// </summary>
        /// <param name="userAgent">
        /// </param>
        /// <returns>
        /// The is mobile device.
        /// </returns>
        public static bool IsMobileDevice(string mobileUserAgents, string userAgent)
        {
            var mobileContains = mobileUserAgents.Split(',').Where(m => !string.IsNullOrEmpty(m)).Select(m => m.Trim().ToLowerInvariant());
            return !string.IsNullOrEmpty(userAgent) && mobileContains.Any(s => userAgent.IndexOf(s, StringComparison.OrdinalIgnoreCase) > 0);
        }

        /// <summary>
        /// Validates if the useragent is a search engine spider
        /// </summary>
        /// <param name="userAgent">
        /// </param>
        /// <returns>
        /// The is search engine spider.
        /// </returns>
        public static bool IsSearchEngineSpider(string userAgent)
    {
        return !string.IsNullOrEmpty(userAgent) && spiderContains.Any(x => userAgent.ToLowerInvariant().Contains(x.ToLowerInvariant()));
    }

        /// <summary>
        /// Validates if the useragent is a search engine spider
        /// </summary>
        /// <param name="userAgent">
        /// </param>
        /// <returns>
        /// The is search engine spider.
        /// </returns>
        public static string SearchEngineSpiderName(string userAgent)
        {
            return (!string.IsNullOrEmpty(userAgent)) ? spiderContains.FirstOrDefault(x => userAgent.ToLowerInvariant().Contains(x.ToLowerInvariant())) : null;
        }

    }
}
