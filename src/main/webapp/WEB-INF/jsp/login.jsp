<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/8
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>电商管理系统</title>
  <link href="../../content/css/page/login.css" rel="stylesheet" type="text/css" >
  <script type="text/javascript" src="../../content/js/jquery/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="../../content/js/jquery-plugin/cookie/jquery.cookie.js"></script>
  <script type="text/javascript" src="../../content/js/core/utils.js"></script>
  <script type="text/javascript" src="../../content/js/core/common.js"></script>
  <script type="text/javascript" src="../../content/js/core/knockout-3.4.1.js"></script>
  <script type="text/javascript" src="viewModel/login.js"></script>
  <script type="text/javascript">
    $(function () {
      ko.applyBindings(new viewModel());
    });
  </script>
</head>

<body>
<div class="second_body">
  <form data-bind="submit:loginClick">
    <div class="logo"></div>
    <div class="title-zh">电商管理系统</div>
    <div class="message" data-bind="html:message"></div>
    <table border="0" style="width:300px;">
      <tr>
        <td style="white-space:nowrap; padding-bottom: 5px;width:55px;">用户名：</td>
        <td colspan="2"><input type="text" id="userCode" class="login" data-bind="value:form.userCode" /></td>
      </tr>
      <tr>
        <td class="lable" style="white-space:nowrap; letter-spacing: 0.5em; vertical-align: middle">密码：</td>
        <td colspan="2"><input type="password" id="password" class="login" data-bind="value:form.password" /></td>
      </tr>
      <tr>
        <td></td>
        <td colspan="2"><input type="checkbox" data-bind="checked:form.remember" /><span>系统记住我</span></td>
      </tr>
      <tr>
        <td colspan="3" style="text-align:center">
          <input type="submit" value="登录" class="login_button" />
          <input type="button" value="重置" class="reset_botton" data-bind="click:resetClick" />
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
