<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="用户注册"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="line">已经有一个账户,点击<a href="Login.aspx" >登录</a>。</div>
<div class="line">Email:<input id="txtEmail" class="email" type="text" maxlength="128" /></div>
<div class="line">昵称:<input id="txtName" class="name" type="text" maxlength="32" /></div>
<div class="line">密码:<input id="txtPassword" class="password" type="password" maxlength="20" /></div>
<div class="line">重复密码:<input id="txtConfirmPassword" class="password" type="password" maxlength="20" /></div>
<ul id="ulError" class="error"></ul>
    
<div  class="line"><input id="btnOK" class="register" type="button" value="注册" onclick="return btnOK_onclick()"/> <a href="GetBackPassword.aspx">忘记密码?</a></div>
<script type="text/javascript" language="javascript">
function btnOK_onclick()
{
    var txtEmail=document.getElementById("txtEmail");
    var txtName=document.getElementById("txtName");
    var txtPassword=document.getElementById("txtPassword");
    var txtConfirmPassword=document.getElementById("txtConfirmPassword");
    var ulError=document.getElementById("ulError");
    var btnOK=document.getElementById("btnOK");
    
    ulError.innerHTML="";
    
    var p=/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ig;
    if(txtName.value=="")
    {
        writeError("请输入Email！");
    }
    else if(!p.test(txtEmail.value))
    {
        writeError("Email格式不正确！");
    }
    
    if(txtName.value=="")
    {
        writeError("请输入昵称！");
    }
    
    if(txtPassword.value=="")
    {
        writeError("请输入密码！");
    }
    
    if(txtConfirmPassword.value!=txtPassword.value)
    {
        writeError("两次输入的密码不一致！");
    }
    
    if(ulError.innerHTML!="")return false;
    
    btnOK.disabled=true;
    btnOK.blur();
    btnOK.value="正在提交数据,请稍后...";
    Register.SignUp(txtEmail.value,txtName.value,txtPassword.value,btnOK_onclick_callback);
}

function btnOK_onclick_callback(r)
{
    var btnOK=document.getElementById("btnOK");
    switch(parseInt(r.value))
    {
        case 0:
            alert("注册成功！");
            location="default.aspx";
            break;
        case 1:
            writeError("Email已存在！");
            break;
        case 2:
            writeError("昵称已存在！");
            break;
        default:
            writeError("意外错误！");
            break;
    }
    btnOK.disabled=false;
    btnOK.value="注册";
}
</script>
</asp:Content>

