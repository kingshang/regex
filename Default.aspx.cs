using System;
using System.Text.RegularExpressions;
using AjaxPro;
using System.Text;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Data;

using System.Xml;

public partial class HomePage : System.Web.UI.Page
{
    public string exp = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        AjaxPro.Utility.RegisterTypeForAjax(typeof(HomePage));


        if (!IsPostBack)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("~/Data/useful.xml"));
            int idx;
            if (int.TryParse(Request.QueryString["idx"], out idx))
            {
                if (idx >= 0 && idx < doc.DocumentElement.ChildNodes.Count)
                {
                    exp = doc.DocumentElement.ChildNodes[idx].Attributes["exp"].Value;
                }
            }
            else
            {
                exp = doc.DocumentElement.ChildNodes[0].Attributes["exp"].Value;
            }
        }
    }

    [AjaxMethod]
    public string LoadHtml(string url, string encoding)
    {
        System.Net.WebClient wc = new System.Net.WebClient();
        string result = System.Text.Encoding.GetEncoding(encoding).GetString(wc.DownloadData(new Uri(url)));
        //return Regex.Replace(result, "\r|\n","", RegexOptions.Multiline);
        return result;
    }

    [AjaxMethod]
    public string Match(string input, string pattern, string option, string language)
    {
        StringBuilder result = new StringBuilder();
        RegexOptions options = RegexOptions.None;
        foreach (string item in option.Split('|'))
        {
            if (item != string.Empty) options |= (RegexOptions)Convert.ToInt16(item);
        }
        Regex reg = new Regex(pattern, options);
        MatchCollection mc = reg.Matches(input);

        for (int i = 0; i < mc.Count; i++)
        {
            if (i > 0) result.Append("|");
            Match m = mc[i];
            //result.AppendFormat("{0}>位置：{1}，长度：{2}，值：{3}\r\n", i, m.Index, m.Length, m.Value);
            for (int j = 0; j < m.Groups.Count; j++)
            {
                Group g = mc[i].Groups[j];
                //result.AppendFormat("[{0},{1}]<{2},{3}>：{4}\r\n", i, j, g.Index, g.Length, g.Value);
                if (j > 0)
                {
                    result.Append("|");
                }
                result.AppendFormat("{0},{1},{2},{3}", i, j, g.Index, g.Length);
            }
        }
        //string[] names = Enum.GetNames(typeof(RegexOptions));
        //Array values = Enum.GetValues(typeof(RegexOptions));
        //for (int i = 0; i < names.Length; i++)
        //{
        //    result.AppendFormat("{0}:{1}\r\n", names.GetValue(i), Convert.ToInt16(values.GetValue(i)));
        //}
        return result.ToString();
    }

    [AjaxMethod]
    public string Replace(string input, string pattern, string replace, string option, string language)
    {
        RegexOptions options = RegexOptions.None;
        foreach (string item in option.Split('|'))
        {
            if (item != string.Empty) options |= (RegexOptions)Convert.ToInt16(item);
        }
        Regex reg = new Regex(pattern, options);
        return reg.Replace(input, replace);
    }

    [AjaxMethod]
    public string Split(string input, string pattern, string option, string language)
    {
        RegexOptions options = RegexOptions.None;
        foreach (string item in option.Split('|'))
        {
            if (item != string.Empty) options |= (RegexOptions)Convert.ToInt16(item);
        }
        Regex reg = new Regex(pattern, options);
        return string.Join("~$|$~", reg.Split(input));
    }
}
