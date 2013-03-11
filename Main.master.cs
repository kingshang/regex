using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using AjaxPro;
using System.Text;
using System.Net;
using System.Text.RegularExpressions;
using System.IO;
using System.Collections.Generic;
using System.Xml;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Kingshang.RegexTool.Coact;

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

    [AjaxMethod(HttpSessionStateRequirement.ReadWrite)]
    public string Login(string id, string password)
    {
        Database db = DatabaseFactory.CreateDatabase();
        password = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(password, System.Web.Configuration.FormsAuthPasswordFormat.SHA1.ToString());
        using (DbCommand cmd = db.GetStoredProcCommand("Users_Login", new object[] { id, password, "" }))
        {
            db.ExecuteNonQuery(cmd);
            if (Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value) == 1)
            {
                CUser.CurrentUserName = cmd.Parameters["@UserName"].Value.ToString();
                return "true";
            }
            else
            {
                return "false";
            }
        }
    }

    [AjaxMethod(HttpSessionStateRequirement.ReadWrite)]
    public string GetLoginName()
    {
        return CUser.CurrentUserName;
    }
}
