using System;

using AjaxPro;
using System.Text;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Data;

public partial class MainMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility.RegisterTypeForAjax(typeof(MainMaster));
    }

    [AjaxMethod]
    public string GetFontFamily()
    {
        StringBuilder str = new StringBuilder();
        foreach (System.Drawing.FontFamily font in System.Drawing.FontFamily.Families)
        {
            if (str.ToString() == string.Empty)
            {
                str.Append(font.Name);
            }
            else
            {
                str.Append("|" + font.Name);
            }
        }
        return str.ToString();
    }
}
