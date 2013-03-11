<%@ Page Title="字符串编解码" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true"
    CodeFile="Coder.aspx.cs" Inherits="Coder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="line">

        <textarea id="txtStr" class="content"></textarea>

    </div>
    <div class="line">
        字符类型：<select id="lstEncoding">
            <option value="gb2312" selected="selected">gb2312</option>
            <option value="utf-8">utf-8</option>
        </select>编码类型：<select id="lstType">
            <option value="html" selected="selected">html</option>
            <option value="url">url</option>
        </select>

    </div>
    <div class="line">
        <input type="button" class="button" value="编码" id="btnEncode" onclick="return btnEncode_onclick()" />
        <input type="button" class="button" value="解码" id="btnDecode" onclick="return btnDecode_onclick()" />
    </div>
    <div class="line">

        <textarea id="txtResult" class="content"></textarea>

    </div>

    <script language="javascript" type="text/javascript">
// <!CDATA[
        var txtStr = document.getElementById("txtStr");
        var lstEncoding = document.getElementById("lstEncoding");
        var lstType = document.getElementById("lstType");
        var ulError = document.getElementById("ulError");
        var btnEncode = document.getElementById("btnEncode");
        var btnDecode = document.getElementById("btnDecode");
        var txtResult = document.getElementById("txtResult");

        function btnEncode_onclick()
        {
            btnEncode.disabled = true;
            btnEncode.blur();
            btnEncode.value = "正在提交数据,请稍后...";
            Coder.Encode(txtStr.value, lstEncoding.options[lstEncoding.selectedIndex].value, lstType.options[lstType.selectedIndex].value, btnEncode_onclick_callback);
        }

        function btnEncode_onclick_callback(r)
        {
            btnEncode.disabled = false;
            btnEncode.value = "编码";
            txtResult.value = r.value;
        }

        function btnDecode_onclick()
        {
            btnDecode.disabled = true;
            btnDecode.blur();
            btnDecode.value = "正在提交数据,请稍后...";
            Coder.Decode(txtStr.value, lstEncoding.options[lstEncoding.selectedIndex].value, lstType.options[lstType.selectedIndex].value, btnDecode_onclick_callback);
        }

        function btnDecode_onclick_callback(r)
        {
            btnDecode.disabled = false;
            btnDecode.value = "解码";
            txtResult.value = r.value;
        }

// ]]>
    </script>

</asp:Content>
