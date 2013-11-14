using System;
using System.Web;

using AjaxPro;
using System.Text.RegularExpressions;
using System.Xml;
using System.IO;

public partial class Offer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility.RegisterTypeForAjax(typeof(Offer));
        if (!IsPostBack)
        {
        }
    }

    [AjaxMethod]
    public string Post(string name, string email, string content)
    {
        if (name.Length > 32)
        {
            return "1";
        }
        if (!Regex.IsMatch(email, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
        {
            return "2";
        }

        if (email.Length > 128)
        {
            return "2";
        }
        if (content.Length > 3000)
        {
            return "3";
        }

        string ip = HttpContext.Current.Request.UserHostAddress;
        //Database db = DatabaseFactory.CreateDatabase();
        //using (DbCommand cmd = db.GetStoredProcCommand("Suggests_Insert", new object[] { name, email, content, ip }))
        //{
        //    db.ExecuteNonQuery(cmd);
        //    return cmd.Parameters["@RETURN_VALUE"].Value.ToString();
        //}

        XmlDocument doc = new XmlDocument(); ;
        string xmlfile = Server.MapPath("/Data/offer.xml");
        if (!File.Exists(xmlfile))
        {
            doc.AppendChild(doc.CreateXmlDeclaration("1.0", "utf-8", "yes"));
            doc.AppendChild(doc.CreateElement("suggests"));
        }
        else
        {
            doc.Load(xmlfile);
        }
        XmlElement e = doc.CreateElement("suggest");
        e.Attributes.Append(doc.CreateAttribute("name")).Value = name;
        e.Attributes.Append(doc.CreateAttribute("email")).Value = email;
        e.Attributes.Append(doc.CreateAttribute("content")).Value = content;
        e.Attributes.Append(doc.CreateAttribute("ip")).Value = ip;
        doc.DocumentElement.AppendChild(e);
        doc.Save(xmlfile);

        return "0";
    }
}
