<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>电商管理系统</title>
    <link href="../../content/css/page/login.css" rel="stylesheet" type="text/css" >
    <script type="text/javascript" src="easyui/js/ajaxform.js"></script>
</head>

<body>
<div class="second_body">
    <form action="loginbyid" method="post">
        <div class="logo"></div>
        <div class="title-zh">电商管理系统</div>
        <div class="message"></div>
        <table border="0" style="width:300px;">
            <tr>
                <td style="white-space:nowrap; padding-bottom: 5px;width:55px;">用户名：</td>
                <td colspan="2"><input type="text" id="userCode" class="login" /></td>
            </tr>
            <tr>
                <td class="lable" style="white-space:nowrap; letter-spacing: 0.5em; vertical-align: middle">密码：</td>
                <td colspan="2"><input type="password" id="password" class="login"  /></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><input type="checkbox"  /><span>系统记住我</span></td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <input type="submit" value="登录" class="login_button" onclick="click()"/>
                    <input type="button" value="重置" class="reset_botton"  />
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    function click(){
        var data={account:$("#userCode").val(),password:$("#password")}
        $.post("loginbyid",data,function(d){
            alert(d)
        })
    }
</script>
</body>
</html>