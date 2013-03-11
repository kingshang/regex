<%@ Page Title="添加正则表达式" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true"
    CodeFile="AddExpression.aspx.cs" Inherits="AddExpression" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="line">
        <span class="label">标题:</span><input type="text" id="txtTitle" class="name" maxlength="100" /></div>
    <div>
        <span class="label">描述:</span><textarea id="txtDescription" class="content" maxlength="100"></textarea></div>
    <div class="line">
        <span class="label">表达式:</span><input type="text" id="txtExp" class="name" maxlength="100" /></div>
    <div class="line">
        <span class="label">匹配:</span><input type="text" id="txtMatch" class="name" maxlength="100" /></div>
    <div class="line">
        <span class="label">不匹配:</span><input type="text" id="txtUnMatch" class="name" maxlength="100" /></div>
    <div class="line">
        <span class="label">作者:</span><input type="text" id="txtAuthor" class="name" maxlength="100" /></div>

    <ul id="ulError" class="error">
    </ul>

    <div class="line">
        <input type="button" class="button" value="发送" id="btnOK" onclick="return btnOK_onclick()" /></div>

    <script language="javascript" type="text/javascript">
// <!CDATA[

        function btnOK_onclick()
        {
            var txtTitle = document.getElementById("txtTitle");
            var txtDescription = document.getElementById("txtDescription");
            var txtExp = document.getElementById("txtExp");
            var txtMatch = document.getElementById("txtMatch");
            var txtUnMatch = document.getElementById("txtUnMatch");
            var txtAuthor = document.getElementById("txtAuthor");
            var ulError = document.getElementById("ulError");
            var btnOK = document.getElementById("btnOK");

            ulError.innerHTML = "";

            if (txtTitle.value == "")
            {
                writeError("请输入标题！");
            }

            if (txtExp.value == "")
            {
                writeError("请输入表达式！");
            }

            if (txtAuthor.value == "")
            {
                writeError("请输入作者！");
            }

            if (ulError.innerHTML != "") return false;

            btnOK.disabled = true;
            btnOK.blur();
            btnOK.value = "正在提交数据,请稍后...";
            AddExpression.Post(txtTitle.value, txtDescription.value, txtExp.value, txtMatch.value, txtUnMatch.value, txtAuthor.value, btnOK_onclick_callback);
        }

        function btnOK_onclick_callback(r)
        {
            var btnOK = document.getElementById("btnOK");
            btnOK.disabled = false;
            btnOK.value = "发送";
            var result = r.value;
            switch (parseInt(r.value))
            {
                case 0:
                    alert("发送成功,谢谢参与！");
                    location = "Useful.aspx";
                    break;
                default:
                    writeError("意外错误！");
                    break;
            }
        }
        function writeError(msg)
        {
            var ulError = document.getElementById("ulError");
            ulError.innerHTML += '<li class="errorline">' + msg + '</li>';
        }
// ]]>
    </script>

</asp:Content>
