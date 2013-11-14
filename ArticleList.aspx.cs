using System;
using System.Web.UI.WebControls;

using Kingshang.UI.WebControls.Kec;

public partial class ArticleList : System.Web.UI.Page
{
    protected KGridView gv;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //gv.DataSourceID = "ObjectDataSource1";
            //gv.DataBind();
        }
    }
    #region "分页"

    protected void gv_DataBound(object sender, EventArgs e)
    {
        GridView gv = (GridView)sender;
        GridViewRow pageRow = gv.BottomPagerRow;
        if (pageRow != null)
        {
            ObjectDataSource ods = (ObjectDataSource)gv.DataSource;
            Label lblCount = (Label)pageRow.FindControl("lblCount");
            //Label lblPageSize = (Label)pageRow.FindControl("lblPageSize");
            DropDownList lstPageSize = (DropDownList)pageRow.FindControl("lstPageSize");
            Label lblPageCount = (Label)pageRow.FindControl("lblPageCount");
            Label lblPageIndex = (Label)pageRow.FindControl("lblPageIndex");
            DropDownList lstPageList = (DropDownList)pageRow.FindControl("lstPageList");
            LinkButton lnkFirst = (LinkButton)pageRow.FindControl("lnkFirst");
            LinkButton lnkPrevious = (LinkButton)pageRow.FindControl("lnkPrevious");
            LinkButton lnkNext = (LinkButton)pageRow.FindControl("lnkNext");
            LinkButton lnkLast = (LinkButton)pageRow.FindControl("lnkLast");

            //记录总数
            //Article article = new Article();
            //lblCount.Text = Article.Count(lblCondition.Text).ToString();


            //(lblPageSize).Text = gv.PageSize.ToString();
            lstPageSize.SelectedValue = gv.PageSize.ToString();
            (lblPageCount).Text = gv.PageCount.ToString();
            (lblPageIndex).Text = string.Concat(gv.PageIndex + 1);
            for (int i = 1; i <= gv.PageCount; i++)
            {
                lstPageList.Items.Add(i.ToString());
                if (i == gv.PageIndex + 1) lstPageList.Items[gv.PageIndex].Selected = true;
            }
            if (gv.PageIndex == 0)
            {
                lnkFirst.Enabled = false;
                lnkPrevious.Enabled = false;
            }
            else
            {
                lnkFirst.Enabled = true;
                lnkPrevious.Enabled = true;
            }
            if (gv.PageIndex == gv.PageCount - 1)
            {
                lnkNext.Enabled = false;
                lnkLast.Enabled = false;
            }
            else
            {
                lnkNext.Enabled = true;
                lnkLast.Enabled = true;
            }

        }
    }

    protected void lstPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gv.PageSize = Convert.ToInt16(((DropDownList)(sender)).SelectedValue);
    }

    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //解决记录量大时,点尾页时会报PageIndex过大的错误
        if (e.NewPageIndex >= gv.PageCount) e.NewPageIndex = gv.PageCount - 1;
    }

    protected void lstPagelist_SelectedIndexChanged(object sender, EventArgs e)
    {
        gv.PageIndex = ((DropDownList)(sender)).SelectedIndex;
    }

    #endregion
    protected void gv1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
