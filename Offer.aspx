<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Offer.aspx.cs"
    Inherits="Offer" Title="建议与BUG"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="line">
        <span class="label">昵称:</span><input type="text" id="txtName" class="name" maxlength="32" /></div>
    <div class="line">
        <span class="label">Email:</span><input type="text" id="txtEmail" class="email" maxlength="128" /></div>
    <div class="line">
        <span class="label">建议与BUG:</span><textarea id="txtContent" class="content" maxlength="3000"></textarea></div>

    <ul id="ulError" class="error">
    </ul>

    <div class="line">
        <input type="button" class="button" value="发送" id="btnOK" onclick="return btnOK_onclick()" /></div>

    <script language="javascript" type="text/javascript">
// <!CDATA[

        function btnOK_onclick()
        {
            var txtName = document.getElementById("txtName");
            var txtEmail = document.getElementById("txtEmail");
            var txtContent = document.getElementById("txtContent");
            var ulError = document.getElementById("ulError");
            var btnOK = document.getElementById("btnOK");

            ulError.innerHTML = "";

            var p = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ig;
            if (txtName.value == "")
            {
                writeError("请输入Email！");
            }
            else if (!p.test(txtEmail.value))
            {
                writeError("Email格式不正确！");
            }

            if (txtName.value == "")
            {
                writeError("请输入昵称！");
            }

            if (txtContent.value == "")
            {
                writeError("请输入建议与BUG！");
            }

            if (ulError.innerHTML != "") return false;

            btnOK.disabled = true;
            btnOK.blur();
            btnOK.value = "正在提交数据,请稍后...";
            Offer.Post(txtName.value, txtEmail.value, txtContent.value, btnOK_onclick_callback);
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
                    location = "default.aspx";
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
