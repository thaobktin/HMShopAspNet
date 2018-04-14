﻿using System.Text.RegularExpressions;

namespace HM.Util
{
    /// <summary>
    /// The validation helper.
    /// </summary>
    public static class ValidationHelper
    {
        /// <summary>
        /// The is valid email.
        /// </summary>
        /// <param name="email">
        /// The email.
        /// </param>
        /// <returns>
        /// The is valid email.
        /// </returns>
        public static bool IsValidEmail(string email)
        {
            return Regex.IsMatch(email, @"^([0-9a-z]+[-._+&])*[0-9a-z]+@([-0-9a-z]+[.])+[a-z]{2,6}$", RegexOptions.IgnoreCase);
        }

        /// <summary>
        /// The is valid url.
        /// </summary>
        /// <param name="url">
        /// The url.
        /// </param>
        /// <returns>
        /// The is valid url.
        /// </returns>
        public static bool IsValidURL(string url)
        {
            return Regex.IsMatch(url, @"^(http|https|ftp)\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&%\$#\=~])*[^\.\,\)\(\s]$");
        }

        /// <summary>
        /// The is valid int.
        /// </summary>
        /// <param name="intstr">
        /// The intstr.
        /// </param>
        /// <returns>
        /// The is valid int.
        /// </returns>
        public static bool IsValidInt(string intstr)
        {
            int value;
            return int.TryParse(intstr, out value);
        }
    }
}