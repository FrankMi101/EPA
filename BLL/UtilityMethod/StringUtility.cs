using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class StringUtility
    {
        public static string SummarizeText(string text, int maxLength = 25)
        {
            if (text.Length < maxLength)
                return text;
            var words = text.Split(' ');
            var totalCharacters = 0;
            var summaryWords = new List<string>();
            foreach (var word in words)
            {
                summaryWords.Add(word);
                totalCharacters += word.Length + 1;
                if (totalCharacters > maxLength)
                    break;
            }
            return string.Join(" ", summaryWords) + "...";
        }
        public static  IDictionary<string , string> GetQueryStringDictionary(string OptionStr)
        {

            return EncryptionSTR.AppQueryString.GetQueryStringDictionary(OptionStr);
         // IDictionary<string, string> keyValueList = new Dictionary<string, string>();
         //   if (OptionStr != "")
         //   {
         //       string[] OptionStrs = new string[] { "" };
         //       OptionStrs = OptionStr.Split('&');
         //       foreach (var oneString in OptionStrs)
         //       {
         //           string[] onePara = new string[] { "" };
         //           onePara = oneString.Split('=');
         //           if (onePara[0].ToString() != "") 
         //          keyValueList.Add(onePara[0].ToString(), onePara[1].ToString());
         //       }

            
         //   }
         //return keyValueList;

        }
        public static string GetValueFromQueryString(string objStr, IDictionary<string, string> keyValueList)
        {
            return EncryptionSTR.AppQueryString.GetValueFromQueryString(objStr,keyValueList);

            //string reValue = "";
            //for (int i = 0; i < keyValueList.Count; i++)
            //{
            //    if (keyValueList.ElementAt(i).Key == objStr)
            //        reValue = keyValueList.ElementAt(i).Value;
            //}
            //return reValue;
        }
    }
}
