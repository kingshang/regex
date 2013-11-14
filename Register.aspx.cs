using System;
using System.Web;

using AjaxPro;
using System.Text.RegularExpressions;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Data;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AjaxPro.Utility.RegisterTypeForAjax(typeof(Register));
        if (!IsPostBack)
        {

        }
    }

    [AjaxMethod]
    public string SignUp(string email, string name, string password)
    {
        if (!Regex.IsMatch(email, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
        {
            return "1";
        }

        if (email.Length > 128)
        {
            return "2";
        }
        if (name.Length > 32)
        {
            return "2";
        }
        if (password.Length > 20)
        {
            return "2";
        }

        string ip = HttpContext.Current.Request.UserHostAddress;
        password = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(password, System.Web.Configuration.FormsAuthPasswordFormat.SHA1.ToString()).ToLower();
        Database db = DatabaseFactory.CreateDatabase();
        using (DbCommand cmd = db.GetStoredProcCommand("Users_Insert", new object[] { email, name, password, ip }))
        {
            db.ExecuteNonQuery(cmd);
            return cmd.Parameters["@RETURN_VALUE"].Value.ToString();
        }
    }
}
