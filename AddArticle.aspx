<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="AddArticle.aspx.cs"
    Inherits="AddArticle" Title="添加文章" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="line">
        <span class="label">标题</span>
        <input type="text" id="txtTitle" maxlength="128" style="width: 600px" /></div>
    <div class="line">
        <span class="label">作者</span>
        <input type="text" id="txtAuthor" maxlength="32" style="width: 100px" /></div>
    <div class="line">

        <textarea id="txtContent" style="width: 100%; height: 300px"></textarea></div>
    <div>

        <ul id="ulError" class="error">
        </ul>

    </div>
    <div class="line">
        <input type="submit" value="保存" class="button" id="btnOK" /></div>

    <script language="javascript">
        var txtTitle = document.getElementById("txtTitle");
        var txtAuthor = document.getElementById("txtAuthor");
        var txtContent = document.getElementById("txtContent");
        var btnOK = document.getElementById("btnOK");
        document.forms[0].onsubmit = function()
        {
            if (txtTitle.value == "")
            {
                writeError("标题不能为空！");
                return false;
            }
            if (txtAuthor.value == "")
            {
                writeError("作者不能为空！");
                return false;
            }
            if (txtContent.value == "")
            {
                writeError("内容不能为空！");
                return false;
            }
            AddArticle.Insert(txtTitle.value, txtAuthor.value, txtContent.value, Insert_callback);
            btnOK.value = "正在保存...";
            btnOK.disabled = true;
            btnOK.blur();

        }
        function Insert_callback(r)
        {
            txtTitle.value = "";
            txtAuthor.value = "";
            txtContent.value = "";
            btnOK.value = "保存";
            btnOK.disabled = false;
        }
    </script>

</asp:Content>
