<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>电商管理系统</title>
    <link href="../../content/css/page/login.css" rel="stylesheet" type="text/css" >
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <script type="text/javascript" src="easyui/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/js/ajaxform.js"></script>
</head>

<body>

<div class="second_body">
    <form action="loginbyid" method="post" id="form1">
        <div class="logo"></div>
        <div class="title-zh">电商管理系统</div>
        <div class="message"></div>
        <table border="0" style="width:300px;">
            <tr>
                <td style="white-space:nowrap; padding-bottom: 5px;width:55px;">用户名：</td>
                <td colspan="2"><input type="text" id="name" name="name" class="login" /></td>
            </tr>
            <tr>
                <td class="lable" style="white-space:nowrap; letter-spacing: 0.5em; vertical-align: middle">密码：</td>
                <td colspan="2"><input type="password" id="pass" name="pass" class="login"  /></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><input type="checkbox"  /><span>系统记住我</span></td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
    <%--
                        <input type="submit" value="登录" class="login_button" onclick="$('#form1').submit()"/>
    --%>
                    <input type="button" value="登录" class="login_button" onclick="loginaccount()"/>
                    <input type="button" value="注册" class="login_button" onclick="showmain()" />
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="win" closed="true" class="easyui-window" title="Login" style="width:300px;height:180px;">
    <form style="padding:10px 20px 10px 40px;">
        <p>name: <input type="text" id="account" name="account"></p>
        <p>pass: <input type="password" id="password" name="password"></p>
        <div style="padding:5px;text-align:center;">
            <a href="#" class="easyui-linkbutton" icon="icon-ok" onclick="buttonok()">Ok</a>
            <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="buttoncancel()">Cancel</a>
        </div>
    </form>
</div>
<script type="text/javascript">

    function loginaccount(){
        var data={account:$("#name").val(),password:$("#pass").val()}
        alert(data);
        $.post("loginadmin",data,function(d){
            if(d=="member"){
                self.location="http://localhost:8080/page_member"
            }
            alert(d)
        })
    }

function showmain(){
    $('#win').window('open');
}

    function buttonok(){
        var data={account:$("#account").val(),password:$("#password").val()}
        alert(data);
        $.post("register",data,function(d){
            alert(d)
        })
        $('#win').window('close');
    }

function buttoncancel(){
    $('#win').window('close');
}
</script>
</body>
</html>