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
<legend>商品类别管理</legend>
<table width="544"  align="center" cellpadding="3" cellspacing="3">
  <tr>
    <td width="87" align="right">类别编号:</td>
    <td width="421" align="right"><input id="code" type="text" name="code" value="${category.code}" /></td>
  </tr>
  <tr>
    <td width="87" align="right">类别序号:</td>
    <td width="421" align="right"><input id="id" type="text" name="id" value="${category.id}" /></td>
  </tr>
  <tr>
    <td width="87" align="right">类别名称:</td>
    <td width="421" align="right"><input id="caption" type="text" name="caption" value="${category.caption}" /></td>
  </tr>
  <tr>
    <td align="right">类别状态:</td>
    <c:choose>
      <c:when test="${category.status==1}">
        <td align="right"><input type="radio" name="status"  value="1" />
          启用 |
          <input checked type="radio" name="status"  value="0" />
          禁用</td>
      </c:when>
      <c:otherwise>
        <td align="right" width="20"><input type="radio" name="status" checked  value="1" />
          启用 |
          <input checked type="radio" name="status"  value="0" />
          禁用</td>
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
      code:$("#code").val(),
      id: $("#id").val(),
      caption: $("#caption").val(),
      status: $("input:checked").val()
    };
    $.post("updatecategory",data,function(d){
      alert("修改成功！");
    });
  }
</script>
</body>

</html>