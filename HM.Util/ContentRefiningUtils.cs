using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;


namespace HM.Util
{
    public class ContentRefiningUtils
    {
        public static string refine_content(string content)
        {
            int hyphen = 0;
            int ques = 0;
            int quot = 0;
            int punc = 0;
            int worderror = 0;
            int num = 0;
            List<string> paragraph = ContentRefiningUtils.contentTolist(normalize_text_p(content), out hyphen, out ques, out quot, out punc, out worderror, out num);

            if (quot > 1)
                paragraph = ContentRefiningUtils.combine_quotation(paragraph);


            if (ques > 4 && hyphen > 4 && hyphen - ques / 2 > ques)
                paragraph = ContentRefiningUtils.combine_question_sen(paragraph, 2);
            else if (ques > 4 && hyphen > 4)
                paragraph = ContentRefiningUtils.combine_question_sen(paragraph, 1);


            if (num > 2)
                paragraph = ContentRefiningUtils.list_num_content_sentence(paragraph);


            if (worderror > 3)
                paragraph = ContentRefiningUtils.combine_error_words(paragraph);


            if (punc > 2)
                paragraph = ContentRefiningUtils.list_hyphen_content_sentence(paragraph);


            paragraph = ContentRefiningUtils.split_head_sentence(paragraph);
            string finalcontent = ContentRefiningUtils.listTocontent(paragraph);


            return spaces(finalcontent);
        }



        public static List<string> contentTolist(string content, out int num_hyphen, out int num_ques, out int num_quot, out int num_punc, out int num_werror, out int num_num)
        {
            List<string> list = new List<string>();
            string[] list_sentence = content.Split(new string[] { "\n" }, StringSplitOptions.RemoveEmptyEntries);
            int hyphen = 0;
            int ques = 0;
            int quot = 0;
            int punc = 0;
            int worderror = 0;
            int num = 0;

            foreach (string sen in list_sentence)
            {
                string sentrim = sen.Trim();
                if (sentrim.StartsWith("Ảnh:")) continue;
                if (sentrim == string.Empty) continue;
                list.Add(sentrim + " ");


                if (sen.StartsWith("- ")) hyphen++;
                if (sen.EndsWith("? ")) ques++;
                if (number_of_quotations(sen) == 1) quot++;
                if (sen.StartsWith("- ") || sen.StartsWith("• ")) punc++;
                if (!sen.EndsWith(". ") && sen.Length < 10) worderror++;
                if (Regex.IsMatch(sen, @"^[0-9]+")) num++;


            }

            num_hyphen = hyphen;
            num_ques = ques;
            num_quot = quot;
            num_punc = punc;
            num_werror = worderror;
            num_num = num;


            return list;
        }
        public static string listTocontent(List<string> list)
        {
            StringBuilder combine = new StringBuilder();
            foreach (string sen in list)
            {
                //combine.Append(sen + "<br>");
                combine.Append(quote_marks(sen));
            }
            return combine.ToString();
        }


        public static List<string> combine_quotation(List<string> list_sentence)    // case " "
        {
            int length = list_sentence.Count;
            List<string> list_sentence_2 = new List<string>();
            int i = 0;
            try
            {
                while (i < list_sentence.Count)
                {
                    if (number_of_quotations(list_sentence[i]) == 1)
                    {
                        StringBuilder combined_sentence_quotation = new StringBuilder();
                        combined_sentence_quotation.Append(list_sentence[i]);
                        int count = 0;
                        bool check = true;
                        if (i + 1 != length)
                        {
                            while (number_of_quotations(list_sentence[i + 1]) != 1)
                            {
                                combined_sentence_quotation.Append(list_sentence[i + 1]);
                                count++;
                                i++;
                                if (count > 6 || i == length - 1)   //max combine sentence = 6
                                {
                                    check = false;
                                    break;
                                }
                            }
                        }
                        else check = false;
                        if (check)
                        {
                            combined_sentence_quotation.Append(list_sentence[i + 1]);
                            list_sentence_2.Add(combined_sentence_quotation.ToString());
                            i++;
                        }
                        else
                        {
                            i = i - count;
                            list_sentence_2.Add(list_sentence[i]);
                        }


                    }
                    else
                        list_sentence_2.Add(list_sentence[i]);

                    i++;
                }
            }
            catch
            {
                return list_sentence;//do nothing
            }
            return list_sentence_2;
        }



        public static List<string> combine_question_sen(List<string> list_sentence, int type)    // case " "
        {
            int length = list_sentence.Count;
            List<string> list_sentence_2 = new List<string>();
            int i = 0;
            try
            {
                if (type == 2)
                {
                    while (i < length)
                    {
                        if (list_sentence[i].StartsWith("- "))
                        {
                            StringBuilder combined_sentence_quotation = new StringBuilder();
                            combined_sentence_quotation.Append(list_sentence[i]);

                            int count = 0;
                            bool chek = true;
                            if (i + 1 != length)
                            {
                                while (!list_sentence[i + 1].StartsWith("- "))
                                {
                                    combined_sentence_quotation.Append(list_sentence[i + 1]);
                                    i++;
                                    count++;
                                    if (count > 4 || i == length - 1) //1~sen0 sen1 sen2 ? // 2~sen0 sen1 sen2 sen 3 ? //max = 4 sen?
                                    {
                                        chek = false;
                                        break;
                                    }
                                }
                            }
                            else chek = false;
                            if (chek)
                            {
                                if (combined_sentence_quotation.ToString().EndsWith("? "))
                                    list_sentence_2.Add("<p><em>" + combined_sentence_quotation.ToString() + "</em></p>");
                                else
                                    list_sentence_2.Add("<p>" + combined_sentence_quotation.ToString() + "</p>");
                            }
                            else
                            {
                                i = i - count;
                                list_sentence_2.Add(list_sentence[i]);
                            }


                        }
                        else
                            list_sentence_2.Add(list_sentence[i]);

                        i++;
                    }
                }
                else
                {
                    while (i < length)
                    {
                        if (list_sentence[i].StartsWith("- "))
                        {
                            if (list_sentence[i].EndsWith("? "))
                            {
                                list_sentence_2.Add("<p><em>" + list_sentence[i] + "</em></p>");
                            }
                            else
                            {
                                StringBuilder combined_sentence_quotation = new StringBuilder();
                                combined_sentence_quotation.Append(list_sentence[i]);

                                int count = 0;
                                bool chek = true;
                                if (i + 1 != length)
                                {
                                    while (!list_sentence[i + 1].EndsWith("? "))
                                    {
                                        combined_sentence_quotation.Append(list_sentence[i + 1]);
                                        i++;
                                        count++;
                                        if (count > 5 || i == length - 1) //1~sen0 sen1 sen2 ? // 2~sen0 sen1 sen2 sen 3 ? //max = 4 sen?
                                        {
                                            chek = false;
                                            break;
                                        }
                                    }
                                }
                                else chek = false;
                                if (chek)
                                {
                                    combined_sentence_quotation.Append(list_sentence[i + 1]);
                                    list_sentence_2.Add("<p><em>" + combined_sentence_quotation.ToString() + "</em></p>");
                                    i++;
                                }
                                else
                                {
                                    i = i - count;
                                    list_sentence_2.Add(list_sentence[i]);
                                }

                            }
                        }
                        else
                            list_sentence_2.Add(list_sentence[i]);

                        i++;
                    }
                }
            }
            catch
            {
                return list_sentence;//do nothing
            }

            return list_sentence_2;
        }

        public static List<string> combine_error_words(List<string> list_sentence)
        {
            int length = list_sentence.Count;
            List<string> list_sentence_2 = new List<string>();
            int i = 1;
            try
            {
                list_sentence_2.Add(list_sentence[0]);
                while (i < list_sentence.Count)
                {
                    if (list_sentence[i].Length < 10)
                    {
                        StringBuilder combined_sentence_quotation = new StringBuilder();
                        list_sentence_2.RemoveAt(list_sentence_2.Count - 1);
                        combined_sentence_quotation.Append(list_sentence[i - 1]);
                        combined_sentence_quotation.Append(list_sentence[i]);

                        int count = 0;
                        bool check = true;
                        if (i + 1 != length)
                        {
                            while (!list_sentence[i + 1].EndsWith(". "))
                            {
                                combined_sentence_quotation.Append(list_sentence[i + 1]);
                                count++;
                                i++;
                                //if (count > 2 || i == length - 1)         //paragharp of 1 + 3 follow sentences 
                                if (i == length - 1)
                                {
                                    check = true;
                                    break;
                                }
                                if (count > 7)
                                {
                                    check = false;
                                    break;
                                }

                            }
                        }
                        else check = false;
                        if (check)
                        {
                            combined_sentence_quotation.Append(list_sentence[i + 1]);
                            list_sentence_2.Add(combined_sentence_quotation.ToString());
                            i++;
                        }
                        else
                        {
                            i = i - count;
                            list_sentence_2.Add(list_sentence[i]);
                        }


                    }
                    else
                        list_sentence_2.Add(list_sentence[i]);

                    i++;
                }
            }
            catch
            {
                return list_sentence;//do nothing
            }

            return list_sentence_2;
        }


        public static List<string> list_hyphen_content_sentence(List<string> list_sentence)
        {
            int length = list_sentence.Count;
            List<string> list_sentence_2 = new List<string>();
            int i = 0;
            try
            {
                while (i < list_sentence.Count)
                {
                    if (list_sentence[i].StartsWith("- ") || list_sentence[i].StartsWith("• "))
                    {
                        StringBuilder combined_sentence_quotation = new StringBuilder();
                        combined_sentence_quotation.Append(list_sentence[i]);
                        int count = 0;
                        bool check = true;
                        if (i + 1 != length)
                        {
                            while (!list_sentence[i + 1].StartsWith("- ") && !list_sentence[i + 1].StartsWith("• ") && list_sentence[i + 1].EndsWith(". "))
                            {
                                combined_sentence_quotation.Append(list_sentence[i + 1]);
                                count++;
                                i++;
                                //if (count > 2 || i == length - 1)         //paragharp of 1 + 3 follow sentences 
                                if (i == length - 1)
                                {
                                    check = true;
                                    break;
                                }
                                if (count > 2)
                                {
                                    check = false;
                                    break;
                                }

                            }
                        }
                        else check = false;
                        if (check)
                        {
                            list_sentence_2.Add(combined_sentence_quotation.ToString() + "<br>");
                        }
                        else
                        {
                            i = i - count;
                            list_sentence_2.Add(list_sentence[i]);
                        }


                    }
                    else
                        list_sentence_2.Add(list_sentence[i]);

                    i++;
                }
            }
            catch
            {
                return list_sentence;//do nothing
            }

            return list_sentence_2;
        }


        public static string bold_sentence(string input)
        {
            try
            {
                if (!input.EndsWith(". ")) return "<strong>" + input + "</strong><br><br>";
                else
                {
                    Regex space = new Regex(@"[\s]");
                    var ind_space = space.Match(input, 0, 4).Index;
                    string replace = input.Substring(0, ind_space);
                    return ("<strong>" + replace + "</strong>" + input.Substring(replace.Length));
                }
            }
            catch { return input; }
        }
        public static List<string> list_num_content_sentence(List<string> list_sentence)
        {
            int length = list_sentence.Count;
            List<string> list_sentence_2 = new List<string>();
            int i = 0;
            try
            {
                while (i < list_sentence.Count)
                {
                    if (Regex.IsMatch(list_sentence[i], @"^[0-9]+"))
                    {
                        StringBuilder combined_sentence_quotation = new StringBuilder();

                        if (list_sentence[i].Length < 5)
                        {
                            combined_sentence_quotation.Append(bold_sentence(list_sentence[i] + list_sentence[i + 1]));
                            i++;
                        }
                        else
                            combined_sentence_quotation.Append(bold_sentence(list_sentence[i]));



                        int count = 0;
                        bool check = true;
                        if (i + 1 != length)
                        {
                            while (!Regex.IsMatch(list_sentence[i + 1], @"^[0-9]+") && list_sentence[i + 1].EndsWith(". "))
                            {
                                combined_sentence_quotation.Append(list_sentence[i + 1]);
                                count++;
                                i++;
                                if (count > 2)             //paragharp of 1 + 3 follow sentences //long = 3 sen
                                {
                                    check = true;
                                    break;
                                }
                                if (i == length - 1)
                                {
                                    check = false;
                                    break;
                                }
                            }
                        }
                        else check = false;
                        if (check)
                        {
                            list_sentence_2.Add("<p>" + combined_sentence_quotation.ToString() + "</p>");
                        }
                        else
                        {
                            i = i - count;
                            list_sentence_2.Add(list_sentence[i]);
                        }


                    }
                    else
                        list_sentence_2.Add(list_sentence[i]);

                    i++;
                }
            }
            catch
            {
                return list_sentence;//do nothing
            }

            return list_sentence_2;
        }


        public static List<string> split_head_sentence(List<string> list_sentence)    // case " "
        {
            List<string> list_sentence_2 = new List<string>();
            List<string> list_sentence_3 = new List<string>();
            int list_1_length = list_sentence.Count;
            int i = 0;
            try
            {
                while (i < list_1_length - 1)
                {
                    string sen = list_sentence[i];
                    int sen_length = sen.Length;

                    if ((!sen.EndsWith(". ") && !sen.StartsWith("<") && !sen.EndsWith(">") && sen_length > 6 && sen_length < 200))
                    {
                        list_sentence_2.Add("<p><strong>" + sen + "</strong></p>");
                    }
                    else
                    {
                        list_sentence_2.Add(sen);
                    }

                    i++;
                }

                if (list_sentence.Count > 2)
                {
                    string last = list_sentence[list_1_length - 1];
                    //if (!last.Equals("từ_khóa", StringComparison.CurrentCultureIgnoreCase))
                    if (!list_sentence[list_1_length - 2].EndsWith("<br>"))
                        list_sentence_2.Add("<br>" + last);
                    else
                        list_sentence_2.Add(last);
                }
            }
            catch
            {
                list_sentence_2 = list_sentence; //do nothing 
            }


            ////////////////////////////////////////////////////////////////////

            int j = 0;
            int length = list_sentence_2.Count;
            try
            {
                while (j < length)
                {
                    if (!list_sentence_2[j].StartsWith("<") && !list_sentence_2[j].EndsWith(">"))
                    {
                        StringBuilder combined_sentence = new StringBuilder();
                        combined_sentence.Append(list_sentence_2[j]);
                        int count = 0;
                        bool check = true;
                        if (j + 1 != length)
                        {
                            while (!list_sentence_2[j + 1].StartsWith("<") && !list_sentence_2[j + 1].EndsWith(">"))
                            {
                                combined_sentence.Append(list_sentence_2[j + 1]);
                                count++;
                                j++;
                                if (count > 1)             //paragharp of 1 + 2 follow sentences 
                                {
                                    check = true;
                                    break;
                                }
                                if (j == length - 1)
                                {
                                    check = true;
                                    break;
                                }
                            }
                        }
                        else check = false;
                        if (check)
                        {
                            list_sentence_3.Add("<p>" + combined_sentence.ToString() + "</p>");
                        }
                        else
                        {
                            j = j - count;
                            list_sentence_3.Add(list_sentence_2[j]);
                        }

                    }
                    else
                        list_sentence_3.Add(list_sentence_2[j]);

                    j++;
                }
            }
            catch
            {
                return list_sentence_2;//do nothing
            }


            return list_sentence_3;
        }






        public static string spaces(string sentence)
        {
            return System.Text.RegularExpressions.Regex.Replace(sentence, @"\s+", " ");
        }

        public static string normalize_text(string sentence)
        {
            sentence = sentence.Replace("' '", "\"");
            sentence = sentence.Replace(" .", ".");
            sentence = sentence.Replace(" ,", ",");
            sentence = sentence.Replace("‘ ", "‘");
            sentence = sentence.Replace(" ’", "’");
            sentence = sentence.Replace("“ ", "“"); // “ ” == " "
            sentence = sentence.Replace(" ”", "”");
            sentence = sentence.Replace("\'", "\""); //' == "
            sentence = sentence.Replace("( ", "(");
            sentence = sentence.Replace(" )", ")");
            sentence = sentence.Replace(" :", ":");
            sentence = sentence.Replace(" ;", ";");
            sentence = sentence.Replace(" ?", "?");
            sentence = sentence.Replace(" !", "!");
            sentence = sentence.Replace(" …", "…");
            sentence = sentence.Replace(" /", "/");
            sentence = quote_marks(sentence);
            sentence = sentence.Replace("_", " ");
            sentence = Regex.Replace(sentence, @"\s+", " ");
            return sentence;

        }

        public static string normalize_text_p(string sentence)
        {
            sentence = sentence.Replace("' '", "\"");
            sentence = sentence.Replace(" .", ".");
            sentence = sentence.Replace(" ,", ",");
            sentence = sentence.Replace("‘ ", "‘");
            sentence = sentence.Replace(" ’", "’");
            sentence = sentence.Replace("“", "\"").Replace("”", "\"");
            sentence = sentence.Replace("\'", "\""); //' == "
            sentence = sentence.Replace("( ", "(");
            sentence = sentence.Replace(" )", ")");
            sentence = sentence.Replace(" :", ":");
            sentence = sentence.Replace(" ;", ";");
            sentence = sentence.Replace(" ?", "?");
            sentence = sentence.Replace(" !", "!");
            sentence = sentence.Replace(" …", "…");
            sentence = sentence.Replace(" /", "/");
            //sentence = quote_marks(sentence);
            sentence = sentence.Replace("_", " ");

            return sentence;

        }

        static string quote_marks(string sentence)
        {
            Boolean a = true;
            StringBuilder sb = new StringBuilder();
            sentence = sentence.Replace("\" ", "\"").Replace(" \"", "\"");//.Replace(" \'", "\'").Replace("\' ", "\'"); //bo dau cach o 2 ben quotation mark  
            for (int i = 0; i < sentence.Length; i++)
            {
                if (sentence[i].CompareTo('"') == 0) //|| sentence[i].CompareTo('\'') == 0)
                {
                    if (a)
                    {
                        sb.Append(" " + sentence[i]);
                        a = false;
                    }
                    else
                    {
                        sb.Append(sentence[i] + " ");
                        a = true;
                    }
                }
                else
                {
                    sb.Append(sentence[i]);
                }
            }
            return sb.ToString();
        }

        static int number_of_quotations(string sentence)
        {
            int num_quote = 0;
            foreach (char ch in sentence)
            {
                if (ch == '"')
                    num_quote++;
            }
            if (num_quote % 2 == 0)
                return 0;
            return 1;
        }



        public static string get_first_sentence(string sentence)
        {
            int max_word = 10;
            string headline = "";
            int index_cut = 0;

            string[] puncs = { " .", " ,", " ;", " :", " ?", " !", " …" };
            foreach (var dau in puncs)
            {
                index_cut = sentence.IndexOf(dau);
                if (140 > index_cut && index_cut > 15)
                {
                    headline = sentence.Substring(0, index_cut);
                    break;
                }
            }


            if (139 < index_cut || index_cut < 16)
            {
                StringBuilder ghep = new StringBuilder();
                int max = 0;
                string[] sens = sentence.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

                if (sens.Length > max_word) max = max_word;
                else max = sens.Length;

                for (int i = 0; i < max; i++)
                {
                    ghep.Append(sens[i] + " ");
                }

                headline = ghep.ToString();
            }



            return headline;
        }


    }
}