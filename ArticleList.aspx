<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="ArticleList.aspx.cs"
    Inherits="ArticleList" Title="��������" %>

<%@ Register assembly="Kec" namespace="KingShang.Kec" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="����" />
    <asp:Label ID="lblCondition" runat="server" Visible="False"></asp:Label>
    <asp:GridView ID="gv" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan"
        BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="100%"
        AutoGenerateColumns="False" AllowPaging="True" OnDataBound="gv_DataBound" 
        onselectedindexchanged="gv1_SelectedIndexChanged">
        <FooterStyle BackColor="Tan" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ArticleID" DataNavigateUrlFormatString="ShowArticle.aspx?ArticleID={0}"
                DataTextField="Title" HeaderText="����" />
            <asp:BoundField DataField="LastUpdated" DataFormatString="{0:yyyy-MM-dd}" HeaderText="ʱ��">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <PagerTemplate>
            <div align="right">
                ��
                <asp:Label ID="lblCount" runat="server"></asp:Label>
                ����¼ ÿҳ
                <asp:DropDownList ID="lstPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstPageSize_SelectedIndexChanged">
                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                </asp:DropDownList>
                �� ��
                <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                ҳ ��ǰ��
                <asp:Label ID="lblPageIndex" runat="server"></asp:Label>
                ҳ
                <asp:LinkButton ID="lnkFirst" runat="server" CommandArgument="First" CommandName="Page">��ҳ</asp:LinkButton>
                <asp:LinkButton ID="lnkPrevious" runat="server" CommandArgument="Prev" CommandName="Page">��һҳ</asp:LinkButton>
                ת����
                <asp:DropDownList ID="lstPageList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstPagelist_SelectedIndexChanged">
                </asp:DropDownList>
                ҳ
                <asp:LinkButton ID="lnkNext" runat="server" CommandArgument="Next" CommandName="Page">��һҳ</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lnkLast" runat="server" CommandArgument="Last" CommandName="Page">βҳ</asp:LinkButton>&nbsp;
            </div>
        </PagerTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="Article">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblCondition" Name="condition" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
