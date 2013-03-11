<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="HomePage" Title="在线正则表达式测试工具" ValidateRequest="false" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <span>网址：</span>
        <input type="text" value="http://news.baidu.com" class="url" onkeydown="if(event.keyCode==13)btnLoadHtml_onclick();"
            onclick='if(this.value==this.defaultValue){this.value="http://";selectStart(this,this.value.length);}'
            id="txtUrl" />
        <select id="lstEncoding">
            <option value="gb2312" selected="selected">gb2312</option>
            <option value="utf-8">utf-8</option>
        </select>
        <input type="checkbox" id="chkAutoMatch" />自动匹配
        <input type="button" value="读取" id="btnLoadHtml" onclick="return btnLoadHtml_onclick()" />
        <input type="button" style="display: none" value="保存" class="button" id="btnSave"
            onclick="return btnSave_onclick()" />
        <input type="button" value="正则表达式选项" class="button" id="btnOption" onclick="return btnOption_onclick()" />
    </div>
    <div class="pattern">
        <textarea rows="2" cols="20" class="pattern" id="txtPattern"><%=exp %></textarea>
    </div>
    <div class="replace">
        替换：<input type="text" class="replace" id="txtReplacePattern" value="$1" />
        <input type="button" value="匹配(Ctrl+M)" title="快捷键：F6或Ctrl+M" class="button" id="btnMatch"
            onclick="return btnMatch_onclick()" />
        <input type="button" value="替换(Ctrl+R)" title="快捷键：F7或Ctrl+R" class="button" id="btnReplace"
            onclick="return btnReplace_onclick()" />
        <input type="button" value="拆分(Ctrl+S)" title="快捷键：F8或Ctrl+S" class="button" id="btnSplit"
            onclick="return btnSplit_onclick()" />
    </div>
    <div class="in">
        <div style="float: left; width: 600px;">
            <div class="button" id="panelButton">
                <input type="button" id="btnSource" value="源文本" onclick="showPanel(0);" title="" />
                <input type="button" id="btnTextResult" value="文本结果" onclick="showPanel(1);" title="" />
                <input type="button" id="btnHtmlResult" value="HTML结果" onclick="showPanel(2);" title="" />
                <input type="button" id="btnCode" value="C#代码" onclick="showPanel(3);" title="在使用匹配、替换、拆分后查看C#代码" />
            </div>
            <div class="panel" id="panelDiv">
                <div id="divSource" class="source">
                    <textarea rows="2" cols="20" class="in" id="txtInput">东临碣石，以观沧海。
水河澹澹，山岛竦峙。
树木丛生，百草丰茂。
秋风萧瑟，洪波涌起。
日月之行，若出其中。
星汉灿烂，若出其里。
幸甚至哉，歌以咏志。</textarea>
                </div>
                <div id="divTextResult" class="textresult">
                    <textarea rows="2" cols="20" class="textresult" id="txtTextResult"></textarea>
                </div>
                <div id="divHtmlResult" class="html">
                </div>
                <div id="divCode" class="textresult">
                    <textarea rows="2" cols="20" class="textresult" id="txtCode"></textarea>
                </div>
            </div>
            <div id="divStatus" class="status">
            </div>
        </div>
        <div style="float: right;">
            <select size="10" class="matches" id="lstMatches" ondblclick="lstMatches_ondblclick()"
                onchange="return lstMatches_onchange()">
            </select>
        </div>
    </div>
    <div class="option" id="divOption">
        <div class="title">
            正则表达式选项</div>
        <table border="0">
            <tr>
                <td>
                    <span title="指定不区分大小写的匹配。">
                        <input type="checkbox" checked="checked" id="chkIgnoreCase" /><label>IgnoreCase</label></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span title="多行模式。更改 ^ 和 $ 的含义，使它们分别在任意一行的行首和行尾匹配，而不仅仅在整个字符串的开头和结尾匹配。">
                        <input type="checkbox" checked="checked" id="chkMultiline" /><label>Multiline</label></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span title="指定有效的捕获仅为形式为 (?<name>...) 的显式命名或编号的组。这使未命名的圆括号可以充当非捕获组，并且不会使表达式的语法 (?:...) 显得笨拙。">
                        <input type="checkbox" id="chkExplicitCapture" /><label>ExplicitCapture</label></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span title="指定单行模式。更改点 (.) 的含义，使它与每一个字符匹配（而不是与除 \n 之外的每个字符匹配）。 ">
                        <input type="checkbox" id="chkSingleline" /><label>Singleline</label></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span title="消除模式中的非转义空白并启用由 # 标记的注释。但是，IgnorePatternWhitespace 值不会影响或消除字符类中的空白。 ">
                        <input type="checkbox" id="chkIgnorePatternWhitespace" /><label>IgnorePatternWhitespace</label></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span title="指定搜索从右向左而不是从左向右进行。">
                        <input type="checkbox" id="chkRightToLeft" /><label>RightToLeft</label></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span title="为表达式启用符合 ECMAScript 的行为。该值只能与 IgnoreCase、Multiline 和 Compiled 值一起使用。该值与其他任何值一起使用均将导致异常。 ">
                        <input type="checkbox" id="chkECMAScript" /><label>ECMAScript</label></span>
                </td>
            </tr>
            <tr>
                <td>
                    <span title="指定忽略语言中的区域性差异。有关更多信息，请参见 在 RegularExpressions 命名空间中执行不区分区域性的操作。 ">
                        <input type="checkbox" id="chkCultureInvariant" /><label>CultureInvariant</label></span>
                </td>
            </tr>
        </table>
        <div class="title" style="display: none">
            杂项</div>
        <div style="display: none">
            <input id="JavaScript" type="radio" name="rdoLanguage" value="JavaScript" />JavaScript
            <input id="C#" type="radio" name="rdoLanguage" checked="checked" value="C#" />C#
            <input id="VB.NET" type="radio" name="rdoLanguage" value="VB.NET" />VB.NET
        </div>
        <div>
            <input type="button" onclick="document.getElementById('divOption').style.display='none';"
                value="隐藏" /></div>
    </div>
    <div id="divSaveDialog" class="savedialog">
        <div>
            标题:<input type="text" id="txtTitle" maxlength="64" />
        </div>
        <div>
            标签:<input type="text" id="txtTags" maxlength="128" style="width: 450px" />逗号或空格分隔
        </div>
        <div>
            描述:<textarea id="txtDescription" rows="3" cols="80"></textarea>
        </div>
        <div>
            匹配表达式:<textarea id="txtPattern1" rows="3" cols="80"></textarea>
        </div>
        <div>
            替换表达式:<input type="text" id="txtPattern2" maxlength="1024" />
        </div>
        <div>
            <input type="button" class="button" value="立即保存" id="btnQuickSave" onclick="btnQuickSave_onclick()" />
            <input type="button" class="button" value="取消" id="btnCancelSave" onclick="btnCancelSave_onclick()" /></div>
    </div>
    <div id="divLoginDialog" class="logindialog">
        <div class="line">
            为了方便以后修改，请先登录。</div>
        <div class="line">
            昵称或Email:<input type="text" id="txtID" maxlength="128" class="email" /></div>
        <div class="line">
            密码:<input type="password" id="txtPassword" maxlength="20" class="password" /></div>
        <div class="line">
            <input type="button" value="登录" id="btnLogin" onclick="btnLogin_onclick()" />还没有账户,请先<a
                href="Register.aspx" target="_blank">注册</a>。</div>
    </div>

    <script language="javascript" type="text/javascript">

        init();
        function init() {
            //取消回车提交 
            document.forms[0].onsubmit = function() { event.returnValue = false };

            var lstMatches = document.getElementById("lstMatches");
            if (lstMatches.selectedIndex >= 0) lstMatches.focus();

            //快捷键
            if (isIE()) {
                document.body.onkeydown = HotKey;
            }

            showPanel(0);
        }

        function HotKey() {
            //alert(event.keyCode);
            if (event.ctrlKey) {
                switch (event.keyCode) {
                    case 77: //ctrl+S
                        event.returnValue = false;
                        btnMatch_onclick();
                        break;
                    case 82: //ctrl+R
                        event.returnValue = false;
                        btnReplace_onclick();
                        break;
                    case 83: //ctrl+S
                        event.returnValue = false;
                        btnSplit_onclick();
                        break;
                    default:

                        break;
                }
            }
            else {
                switch (event.keyCode) {
                    case 117: //F6
                        event.returnValue = false;
                        btnMatch_onclick();
                        break;
                    case 118: //F7
                        event.returnValue = false;
                        btnReplace_onclick();
                        break;
                    case 119: //F8
                        event.returnValue = false;
                        btnSplit_onclick();
                        break;
                    default:

                        break;
                }
            }
        }
        function isIE() {
            return document.all != null ? true : false;
        }

        function selectStart(txt, start) {
            var r = txt.createTextRange();
            r.moveStart('character', txt.value.length);
            r.select();
        }

        function btnLoadHtml_onclick() {
            var txtUrl = document.getElementById("txtUrl");
            var lstEncoding = document.getElementById("lstEncoding");
            var btnLoadHtml = document.getElementById("btnLoadHtml");

            HomePage.LoadHtml(txtUrl.value, lstEncoding.options[lstEncoding.selectedIndex].value, btnLoadHtml_onclick_callback);
            btnLoadHtml.disabled = true;
            txtUrl.disabled = true;
            lstEncoding.disabled = true;
            btnLoadHtml.value = "读取中...";
            btnLoadHtml.blur();
        }
        function btnLoadHtml_onclick_callback(r) {
            var txtUrl = document.getElementById("txtUrl");
            var lstEncoding = document.getElementById("lstEncoding");
            var txtInput = document.getElementById("txtInput");
            var chkAutoMatch = document.getElementById("chkAutoMatch");
            var btnLoadHtml = document.getElementById("btnLoadHtml");

            txtInput.value = r.value;
            btnLoadHtml.disabled = false;
            txtUrl.disabled = false;
            lstEncoding.disabled = false;
            btnLoadHtml.value = "读取";
            if (chkAutoMatch.checked == true) btnMatch_onclick();
        }

        function getOption() {
            var option = document.getElementById("chkIgnoreCase").checked ? "1" : "";
            option += "|" + ((document.getElementById("chkMultiline").checked) ? "2" : "");
            option += "|" + ((document.getElementById("chkExplicitCapture").checked) ? "4" : "");
            option += "|" + ((document.getElementById("chkSingleline").checked) ? "16" : "");
            option += "|" + ((document.getElementById("chkIgnorePatternWhitespace").checked) ? "32" : "");
            option += "|" + ((document.getElementById("chkRightToLeft").checked) ? "64" : "");
            option += "|" + ((document.getElementById("chkECMAScript").checked) ? "256" : "");
            option += "|" + ((document.getElementById("chkCultureInvariant").checked) ? "512" : "");
            return option;
        }

        function btnMatch_onclick() {
            var divStatus = document.getElementById("divStatus");
            var txtInput = document.getElementById("txtInput");
            var txtPattern = document.getElementById("txtPattern");
            var lstMatches = document.getElementById("lstMatches");
            var divHtmlResult = document.getElementById("divHtmlResult");
            var txtTextResult = document.getElementById("txtTextResult");
            var rdoLanguage = document.forms[0].rdoLanguage;
            if (txtInput.value == "") {
                alert("没有输入要匹配的内容！");
                txtInput.focus();
                txtInput.select();
            }

            if (txtPattern.value == "") {
                alert("没有输入正则表达式！");
                txtPattern.focus();
                txtPattern.select();
            }

            divHtmlResult.innerHTML = "";
            txtTextResult.value = "";
            lstMatches.innerHTML = "";

            //更新代码
            showCode(1);

            var language;
            for (var i = 0; i < rdoLanguage.length; i++) {
                if (rdoLanguage[i].checked) language = rdoLanguage[i].value;
            }

            var result = HomePage.Match(txtInput.value, txtPattern.value, getOption(), language).value;

            if (result != "") {
                var matches = result.split("|");
                for (var i = 0; i < matches.length; i++) {
                    var m = matches[i].split(",");
                    var option = document.createElement("OPTION");
                    option.text = matches[i];
                    option.value = txtInput.value.substring(parseInt(m[2]), parseInt(m[2]) + parseInt(m[3]));
                    lstMatches.options[lstMatches.length] = option;
                }
                lstMatches.selectedIndex = 0;
                lstMatches_onchange();

                divStatus.innerHTML = "匹配结果：" + matches.length;
                showPanel(0);
            }
            else {
                divStatus.innerHTML = "没有匹配内容！";
                alert("没有匹配内容！");
            }
        }

        function btnReplace_onclick() {
            var txtInput = document.getElementById("txtInput");
            var txtPattern = document.getElementById("txtPattern");
            var txtReplacePattern = document.getElementById("txtReplacePattern");
            var txtTextResult = document.getElementById("txtTextResult");
            var divHtmlResult = document.getElementById("divHtmlResult");
            var rdoLanguage = document.forms[0].rdoLanguage;
            var lstMatches = document.getElementById("lstMatches");

            if (txtInput.value == "") {
                alert("没有输入要匹配的内容！");
                txtInput.focus();
                txtInput.select();
            }

            if (txtPattern.value == "") {
                alert("没有输入正则表达式！");
                txtPattern.focus();
                txtPattern.select();
            }

            divHtmlResult.innerHTML = "";
            txtTextResult.value = "";
            lstMatches.innerHTML = "";

            //更新代码
            showCode(2);


            var language;
            for (var i = 0; i < rdoLanguage.length; i++) {
                if (rdoLanguage[i].checked) language = rdoLanguage[i].value;
            }

            var result = HomePage.Replace(txtInput.value, txtPattern.value, txtReplacePattern.value, getOption(), language).value;
            divHtmlResult.innerHTML = result;
            txtTextResult.value = result;
            showPanel(1);
        }

        function btnSplit_onclick() {
            var txtInput = document.getElementById("txtInput");
            var txtPattern = document.getElementById("txtPattern");
            var txtTextResult = document.getElementById("txtTextResult");
            var divHtmlResult = document.getElementById("divHtmlResult");
            var lstMatches = document.getElementById("lstMatches");
            var rdoLanguage = document.forms[0].rdoLanguage;

            if (txtInput.value == "") {
                alert("没有输入要匹配的内容！");
                txtInput.focus();
                txtInput.select();
            }

            if (txtPattern.value == "") {
                alert("没有输入正则表达式！");
                txtPattern.focus();
                txtPattern.select();
            }

            divHtmlResult.innerHTML = "";
            txtTextResult.value = "";
            lstMatches.innerHTML = "";

            //更新代码
            showCode(3);


            var language;
            for (var i = 0; i < rdoLanguage.length; i++) {
                if (rdoLanguage[i].checked) language = rdoLanguage[i].value;
            }

            var result = HomePage.Split(txtInput.value, txtPattern.value, getOption(), language).value;

            if (result != "") {
                var matches = result.split("~$|$~");
                for (var i = 0; i < matches.length; i++) {
                    var m = matches[i].split(",");
                    var option = document.createElement("OPTION");
                    option.text = (i + 1).toString();
                    option.value = matches[i];
                    lstMatches.options[lstMatches.length] = option;
                }
                lstMatches.selectedIndex = 0;
                lstMatches_onchange();

                divStatus.innerHTML = "拆分结果：" + matches.length;
                showPanel(0);
            }
            else {
                divStatus.innerHTML = "没有拆分内容！";
                alert("没有拆分内容！");
            }
        }

        function lstMatches_onchange() {
            var lstMatches = document.getElementById("lstMatches");
            if (lstMatches.selectedIndex == -1) return;
            var divHtmlResult = document.getElementById("divHtmlResult");
            var txtTextResult = document.getElementById("txtTextResult");
            divHtmlResult.innerHTML = lstMatches.options[lstMatches.selectedIndex].value;
            txtTextResult.value = lstMatches.options[lstMatches.selectedIndex].value;

            var txtInput = document.getElementById("txtInput");

            var match = lstMatches.options[lstMatches.selectedIndex].text.split(",");
            if (match.length == 4) {
                var index = parseInt(match[2]);
                var length = parseInt(match[3]);
                selectTextAreaRange(txtInput, index, length);
            }
            var lstMatches = document.getElementById("lstMatches");
            if (lstMatches.selectedIndex >= 0) lstMatches.focus();
        }

        //在文本框中选中一段文字
        function selectTextAreaRange(txt, index, length) {
            if (isIE()) {
                //回车（\r\n）只需移动一位
                length -= countEnter(txt.value.substring(index, index + length));
                index -= countEnter(txt.value.substring(0, index));

                var r = txt.createTextRange();
                r.moveStart("character", index);

                var sel = r.duplicate();
                sel.moveStart("character", length);
                sel.setEndPoint("EndToStart", r);
                sel.select();
            }
            else {
                txt.selectionStart = index;
                txt.selectionEnd = index + length;
            }
        }

        //字符串中的回车数
        function countEnter(txt) {
            var p = /\r\n/igm;
            var m = txt.match(p);
            return m == null ? 0 : m.length;
        }

        function lstMatches_ondblclick() {
        }

        function btnOption_onclick() {
            var divOption = document.getElementById("divOption");
            if (divOption.style.display == "block")
                divOption.style.display = "none";
            else
                divOption.style.display = "block";
        }

        function showPanel(selectedIndex) {
            var panelDiv = document.getElementById("panelDiv");
            var panelButton = document.getElementById("panelButton");
            var effectiveIndex = 0;
            for (var i = 0; i < panelDiv.childNodes.length; i++) {
                if (panelDiv.childNodes[i].nodeName == "DIV") {
                    if (effectiveIndex == selectedIndex) {
                        panelDiv.childNodes[i].style.display = "block";
                    }
                    else {
                        panelDiv.childNodes[i].style.display = "none";
                    }
                    effectiveIndex++;
                }
                else {
                    continue;
                }
            }
            effectiveIndex = 0;
            for (var i = 0; i < panelButton.childNodes.length; i++) {
                if (panelButton.childNodes[i].nodeName == "INPUT") {
                    if (effectiveIndex == selectedIndex) {
                        panelButton.childNodes[i].disabled = true;
                        panelButton.childNodes[i].blur();
                    }
                    else {
                        panelButton.childNodes[i].disabled = false;
                    }
                    effectiveIndex++;
                }
                else {
                    continue;
                }
            }
        }

        function btnSave_onclick() {
            var divLoginDialog = document.getElementById("divLoginDialog");
            if (!checkLogin()) {
                showLoginDialog();
            }
            else {
                showSaveDialog();
            }
        }

        function btnQuickSave_onclick() {
            var txtPattern1 = document.getElementById("txtPattern1");
            var txtPattern2 = document.getElementById("txtPattern1");
            var txtTitle = document.getElementById("txtTitle");
            var txtTags = document.getElementById("txtTags");
            var txtDescription = document.getElementById("txtDescription");
            var btnQuickSave = document.getElementById("btnQuickSave");
            HomePage.SaveRegex(txtTitle.value, txtDescription.value, txtPattern1.value, txtPattern2.value, txtTags.value, btnQuickSave_onclick_callback);
            btnQuickSave.disabled = true;
            btnQuickSave.value = "正在保存...";
            btnQuickSave.blur();
        }

        function btnQuickSave_onclick_callback(r) {
            var btnQuickSave = document.getElementById("btnQuickSave");
            var result = r.value;
            debugger;
            if (result == "0") {
                alert("保存成功！");
            }
            else {
                alert("意外错误！");
            }
            btnQuickSave.disabled = false;
            btnQuickSave.value = "保存";
            closeSaveDialog();
        }

        function btnCancelSave_onclick() {
            var divSaveDialog = document.getElementById("divSaveDialog");
            divSaveDialog.style.display = "none";
        }

        function checkLogin() {
            return false;
        }

        function btnLogin_onclick() {
            var txtID = document.getElementById("txtID");
            var txtPassword = document.getElementById("txtPassword");
            if (HomePage.Login(txtID.value, txtPassword.value).value == "true") {
                closeLoginDialog();
                showSaveDialog();
            }
            else {
                alert("用户名或密码不正确！");
            }
        }
        function showLoginDialog() {
            divLoginDialog.style.position = "absolute";
            divLoginDialog.style.left = 0;
            divLoginDialog.style.top = 0;
            divLoginDialog.style.paddingLeft = (document.body.offsetWidth - 500) / 2;
            divLoginDialog.style.paddingTop = (document.body.offsetHeight - 300) / 2;
            divLoginDialog.style.display = "block";
        }
        function closeLoginDialog() {
            var divLoginDialog = document.getElementById("divLoginDialog");
            divLoginDialog.style.display = "none";
        }
        function showSaveDialog() {
            var divSaveDialog = document.getElementById("divSaveDialog");
            var txtPattern = document.getElementById("txtPattern");
            var txtReplacePattern = document.getElementById("txtReplacePattern");
            var txtPattern1 = document.getElementById("txtPattern1");
            var txtPattern2 = document.getElementById("txtPattern2");

            txtPattern1.value = txtPattern.value;
            txtPattern2.value = txtReplacePattern.value;

            divSaveDialog.style.position = "absolute";
            divSaveDialog.style.left = 0;
            divSaveDialog.style.top = 0;
            divSaveDialog.style.paddingLeft = (document.body.offsetWidth - 500) / 2;
            divSaveDialog.style.paddingTop = (document.body.offsetHeight - 300) / 2;
            divSaveDialog.style.display = "block";
        }
        function closeSaveDialog() {
            var divSaveDialog = document.getElementById("divSaveDialog");
            divSaveDialog.style.display = "none";
        }

        function showCode(mode) {
            var txtCode = document.getElementById("txtCode");
            var str = "";
            var pattern = document.getElementById("txtPattern").value.replace('"', '""');
            var replace = document.getElementById("txtReplacePattern").value;
            var option = "RegexOptions.None";
            if (document.getElementById("chkIgnoreCase").checked) option += " | RegexOptions.IgnoreCase";
            if (document.getElementById("chkMultiline").checked) option += " | RegexOptions.Multiline";
            if (document.getElementById("chkExplicitCapture").checked) option += " | RegexOptions.ExplicitCapture";
            if (document.getElementById("chkSingleline").checked) option += " | RegexOptions.Singleline";
            if (document.getElementById("chkIgnorePatternWhitespace").checked) option += " | RegexOptions.IgnorePatternWhitespace";
            if (document.getElementById("chkRightToLeft").checked) option += " | RegexOptions.RightToLeft";
            if (document.getElementById("chkECMAScript").checked) option += " | RegexOptions.ECMAScript";
            if (document.getElementById("chkCultureInvariant").checked) option += " | RegexOptions.CultureInvariant";
            switch (mode) {
                case 1:
                    str += 'string input="";\r\n';
                    str += 'Regex reg = new Regex(@"' + pattern + '", ' + option + ');\r\n';
                    str += 'MatchCollection mc = reg.Matches(input);\r\n';
                    str += 'for (int i = 0; i < mc.Count; i++)\r\n';
                    str += "{\r\n";
                    str += "\r\n";
                    str += "}\r\n";
                    break;
                case 2:
                    str += 'string input="";\r\n';
                    str += 'Regex reg = new Regex(@"' + pattern + '", ' + option + ');\r\n';
                    str += 'string result=reg.Replace(input, "' + replace + '");';
                    break;
                case 3:
                    str += 'string input="";\r\n';
                    str += 'Regex reg = new Regex(@"' + pattern + '", ' + option + ');\r\n';
                    str += 'string[] result=reg.Split(input);';
                    break;
            }
            txtCode.value = str;
        }
    </script>

</asp:Content>
