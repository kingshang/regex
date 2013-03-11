<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Useful.aspx.cs"
    Inherits="Useful" Title="����������ʽ"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="right" style="height: 30px; line-height: 30px;">
        <a href="AddExpression.aspx" style="width: 100%">���</a></div>
    <asp:ListView ID="lv" runat="server" DataSourceID="XmlDataSource1" Style="margin-right: 0px"
        GroupItemCount="1">
        <LayoutTemplate>
            <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                <tr runat="server" id="groupPlaceholder">
                </tr>
            </table>
        </LayoutTemplate>
        <GroupTemplate>
            <tr runat="server" id="groupPlaceholder">
                <td runat="server" id="itemPlaceholder">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server" id="itemPlaceholder">

                <ul style="list-style-type: none; border-top: dashed 1px #cccccc; padding: 3px; width: 100%;
                    line-height: 25px;">
                    <li>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�⣺<asp:Literal ID="Literal1"
                        runat="server" Text='<%# Eval("title") %>'></asp:Literal>
                        <a href='Default.aspx?idx=<%# Container.DataItemIndex %>' style="padding-left: 10px;">����</a></li>
                    <li>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����<asp:Literal ID="Literal2"
                        runat="server" Text='<%# Eval("description") %>'></asp:Literal></li>
                    <li>��&nbsp;&nbsp;��&nbsp;&nbsp;ʽ��<asp:Literal ID="Literal3" Mode="Encode" runat="server"
                        Text='<%# Eval("exp") %>'></asp:Literal></li>
                    <li>ƥ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�䣺<asp:Literal ID="Literal4"
                        runat="server" Text='<%# Eval("match") %>'></asp:Literal></li>
                    <li>��&nbsp;&nbsp;ƥ&nbsp;&nbsp;�䣺<asp:Literal ID="Literal5" runat="server" Text='<%# Eval("unmatch") %>'></asp:Literal></li>
                    <li>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ߣ�<asp:Literal ID="Literal6"
                        runat="server" Text='<%# Eval("author") %>'></asp:Literal></li>
                    <li>����ʱ�䣺<asp:Literal ID="Literal7" runat="server" Text='<%# Eval("date") %>'></asp:Literal></li>
                </ul>

            </td>
        </ItemTemplate>
    </asp:ListView>
    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lv" PageSize="5">
        <Fields>
            <asp:TemplatePagerField>
                <PagerTemplate>
                    <asp:Label ID="Label1" runat="server" Text=' <%# "�� " + Container.TotalRowCount +" ����¼ ��ǰ�� "  +(Container.StartRowIndex/Container.PageSize+1)+   "/" + (System.Math.Ceiling(1.0*Container.TotalRowCount/Container.PageSize)) +" ҳ" %> '>
                    </asp:Label>
                </PagerTemplate>
            </asp:TemplatePagerField>
            <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowLastPageButton="True" />
        </Fields>
    </asp:DataPager>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/Data/useful.xml">
    </asp:XmlDataSource>
</asp:Content>
