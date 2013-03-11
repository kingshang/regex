using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxPro;
using System.Text.RegularExpressions;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Xml;
using System.IO;

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
