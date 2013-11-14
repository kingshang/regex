using System;

using AjaxPro;

using System.Xml;
using System.IO;

public partial class AddExpression : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Utility.RegisterTypeForAjax(typeof(AddExpression));
        if (!IsPostBack)
        {
        }
    }

    [AjaxMethod]
    public string Post(string title, string description, string exp, string match, string unmatch, string author)
    {
        XmlDocument doc = new XmlDocument(); ;
        string xmlfile = Server.MapPath("/Data/useful.xml");
        if (!File.Exists(xmlfile))
        {
            doc.AppendChild(doc.CreateXmlDeclaration("1.0", "utf-8", "yes"));
            doc.AppendChild(doc.CreateElement("regs"));
        }
        else
        {
            doc.Load(xmlfile);
        }
        XmlElement e = doc.CreateElement("reg");
        e.Attributes.Append(doc.CreateAttribute("title")).Value = title;
        e.Attributes.Append(doc.CreateAttribute("description")).Value = description;
        e.Attributes.Append(doc.CreateAttribute("match")).Value = match;
        e.Attributes.Append(doc.CreateAttribute("unmatch")).Value = unmatch;
        e.Attributes.Append(doc.CreateAttribute("author")).Value = author;
        e.Attributes.Append(doc.CreateAttribute("date")).Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        e.Attributes.Append(doc.CreateAttribute("exp")).Value = exp;

        if (doc.DocumentElement.ChildNodes.Count > 0)
            doc.DocumentElement.InsertBefore(e, doc.DocumentElement.ChildNodes[0]);
        else
            doc.DocumentElement.AppendChild(e);

        doc.Save(xmlfile);

        return "0";
    }
}
