using System;
using System.Web;

using AjaxPro;

public partial class Coder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility.RegisterTypeForAjax(typeof(Coder));
        if (!IsPostBack)
        {
        }
    }

    [AjaxMethod]
    public string Encode(string str, string encoding, string type)
    {
        switch (type)
        {
            case "url":
                return HttpUtility.UrlEncode(str, System.Text.Encoding.GetEncoding(encoding));
            default:
                return HttpUtility.HtmlEncode(str);
        }
    }

    [AjaxMethod]
    public string Decode(string str, string encoding, string type)
    {
        switch (type)
        {
            case "url":
                return HttpUtility.UrlDecode(str, System.Text.Encoding.GetEncoding(encoding));
            default:
                return HttpUtility.HtmlDecode(str);
        }
    }
}
