<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>饰品销售管理台</title>
  <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
  <script type="text/javascript" src="easyui/js/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="easyui/js/ajaxform.js"></script>
  <style type="text/css">
    <!--
    .title {
      border:1px solid #95b8e7;
      font-family:微软雅黑;
      font-size:12px;
      width:600px;
      height:400px;
      margin-top: 0px;
      margin-right: auto;
      margin-bottom: 0px;
      margin-left: auto;
      text-align: center;
    }
    input[type='text']{
      border:1px solid #95b8e7;
      font-family:微软雅黑;
      width:400px;
    }
    body,table,tr,td{font-family:微软雅黑;font-size:12px; border:0px solid red}
    *{ margin:0px; padding:0px;}
    -->
  </style>
</head>
<body>
<fieldset class="title">
  <legend>管理员信息管理</legend>
  <table>
    <tr>
      <td width="87" align="right">管理员账号:</td>
      <td width="100" align="right"><input id="account" type="text" name="account" value="${admin.account}" /></td>
    </tr>
    <tr>
      <td align="right">管理员身份:</td>
      <c:choose>
        <c:when test="${admin.style==1}">
          <td align="right"><input type="radio" name="style"  value="1" />
            超级管理员 |
            <input checked type="radio" name="style"  value="0" />
            普通管理员</td>
        </c:when>
        <c:otherwise>
          <td align="right" width="20"><input type="radio" name="style" checked  value="1" />
            超级管理员 |
            <input checked type="radio" name="style"  value="0" />
            普通管理员</td>
        </c:otherwise>
      </c:choose>
    </tr>
    <tr>
      <td height="50">&nbsp;</td>
      <td align="right" valign="bottom"><a  onclick="edit()" value="提交" class="easyui-linkbutton">提交</a></td>
    </tr>
  </table>
</fieldset>
<script>
  function edit(){
    var data = {
      account:$("#account").val(),
      style: $("input:checked").val()
    };
    $.post("updatestyle",data,function(d){
      alert(d);
    });
  }
</script>
</body>

</html>