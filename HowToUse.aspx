<%@ Page Language="C#" MasterPageFile="~/main.master" Title="如何使用在线正则表达式测试工具"
    %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="helpcontent">
        <h1 style="text-align: center">
            使用帮助</h1>
        <p class="paragraph">
            正则表达式大大简化了我们在大文本内容搜索、分析、过滤方面的工作,但由于各种强大而难记的符号和规则的存在，不太容易上手；另一方面，我们经常需要大量反复测试某个表达式的准确性，开发这个工具的目的就是为了解决这些问题。</p>
        <ul style="line-height: 45px;">
            <li>
                <h2>
                    主要功能说明</h2>
                <ul style="list-style-type: decimal" style="line-height: 20px; font-size: 14px">
                    <li>
                        <h4>
                            正则表达式选项</h4>
                        <ul>
                            <li><span style="font-weight: bold">正则表达式选项按钮</span><br />
                                点击在右侧显示或隐藏正则表达式选项。</li>
                            <li><span style="font-weight: bold">隐藏按钮</span><br />
                                点击隐藏正则表达式选项。</li>
                            <li><span style="font-weight: bold">选项说明</span><br />
                                鼠标停在选项上面时会显示选项的详细说明,更多请查看<a href="Referrence.aspx" target="_blank">正则表达式参考</a>。
                            </li>
                        </ul>
                    </li>
                    <li>
                        <h4>
                            匹配</h4>
                        <ul>
                            <li><span style="font-weight: bold">匹配表达式输入框</span><br />
                                即中间的多行文本框。</li>
                            <li><span style="font-weight: bold">匹配按钮</span><br />
                                点击使用匹配表达式匹配源文本中的内容。为方便选择，所有子匹配结果显示在右边的选择列表中。</li>
                        </ul>
                    </li>
                    <li>
                        <h4>
                            替换</h4>
                        <ul>
                            <li><span style="font-weight: bold">替换表达式</span><br />
                                用于在匹配结果中替换。</li>
                            <li><span style="font-weight: bold">替换按钮</span><br />
                                点击使用匹配表达式和替换表达式匹配和替换源文本，在文本结果和HTML结果中显示相应内容。</li>
                        </ul>
                    </li>
                    <li>
                        <h4>
                            拆分</h4>
                        <ul>
                            <li><span style="font-weight: bold">拆分按钮</span><br />
                                点击使用匹配表达式拆分源文本，右边的选择列表显示所有拆分结果。</li>
                        </ul>
                    </li>
                    <li>
                        <h4>
                            结果视图</h4>
                        使用按钮：源文本、文本结果、HTML结果切换视图，在按钮下方显示相应内容。
                        <ul>
                            <li><span style="font-weight: bold">源文本</span>
                                <br />
                                在这里输入要匹配的内容。 </li>
                            <li><span style="font-weight: bold">文本结果</span>
                                <br />
                                这里显示每个子匹配文本结果。</li>
                            <li><span style="font-weight: bold">HTML结果</span>
                                <br />
                                这里显示每个子匹配HTML结果。 </li>
                            <li><span style="font-weight: bold">子匹配或拆分结果选择列表</span>
                                <br />
                                即右边的选择框。当使用匹配时，这里将显示每个子匹配,四组数字分别代表:子匹配序号，分组序号，起始位置，匹配长度。选择其中某项时，源文本中的相应结果会被选择，文本结果和ＨＴＭＬ结果中显示对应的内容，使用上下箭头可以快速选择。
                                当使用拆分时，列表中显示从１开始的结果序号，选择其中某项时，显示其文本结果和ＨＴＭＬ结果，使用上下箭头可以快速选择。 </li>
                        </ul>
                    </li>
                    <li>
                        <h4>
                            读取HTML</h4>
                        <ul>
                            <li><span style="font-weight: bold">网址框</span><br />
                                这里输入要分析网页地址。</li>
                            <li><span style="font-weight: bold">编码选择</span><br />
                                选择网页内容编码，大部分国内网站都使用gb2312编码，部分不能正常显示请使用utf-8。</li>
                            <li><span style="font-weight: bold">自动匹配</span><br />
                                选中时，读取完内容后自动匹配。 </li>
                            <li><span style="font-weight: bold">读取</span><br />
                                使用异步读取，有时由于网络超时会出现按钮一直不可用的状况，请刷新页面，请注意，刷新页面时当前内容不保存。</li>
                        </ul>
                    </li>
                    <li>
                        <h4>
                            快捷键(仅IE支持)</h4>
                        <ul>
                            <li>匹配 F5或CTRL+M</li><li>替换 F6或CTRL+R</li><li>拆分 F7或CTRL+S</li><li>在子匹配或拆分结果中切换 上下箭头</li></ul>
                    </li>
                </ul>
            </li>
            <li>
                <h2>
                    相关资料</h2>
            </li>
        </ul>
    </div>
</asp:Content>
