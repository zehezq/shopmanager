<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>饰品销售管理台</title>
  <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
  <script type="text/javascript" src="easyui/js/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
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
<legend>商品管理</legend>
<table width="544"  align="center" cellpadding="3" cellspacing="3">
  <tr>
    <td width="87" align="right">商品名称:</td>
    <td width="421" align="right"><input type="text" name="Input" value="${g.caption}" /></td>
  </tr>
  <tr>
    <td align="right">商品售价:</td>
    <td align="right"><input type="text" name="Input2" value="${g.price}" /></td>
  </tr>
  <tr>
    <td align="right">商品旧价:</td>
    <td align="right"><input type="text" name="Input2" value="${g.oldprice}" /></td>
  </tr>
  <tr>
    <td align="right">商品库存:</td>
    <td align="right"><input type="text" name="Input2" value="${g.stock}" /></td>
  </tr>
  <tr>
    <td align="right">商品描述:</td>
    <td align="right"><input type="text" name="Input2" value="${g.description}" /></td>
  </tr>
  <tr>
    <td align="right">商品点赞数:</td>
    <td align="right"><input type="text" name="Input2" value="${d.praisenum}" /></td>
  </tr>
  <tr>
    <td align="right">商品创建时间:</td>
    <td align="right"><input type="text" name="Input2" value="${g.createtime}" /></td>
  </tr>
  <tr>
    <td align="right">商品更新时间:</td>
    <td align="right"><input type="text" name="Input2" value="${g.updatetime}" /></td>
  </tr>
  <tr>
    <td align="right" valign="top">商品图片:</td>
    <td align="right">
      <label id="file_pic">
        <input type="file" name="1" style="display: none;" />
        <img src="${g.picurl}" width="400" height="150" >
      </label>
    </td>

  </tr>
  <tr>
    <td align="right">广告状态:</td>
    <c:choose>
      <c:when test="${adv.status==0}">
        <td align="right"><input type="radio" name="status"  />
          启用 |
          <input checked type="radio" name="status" />
          禁用</td>
      </c:when>
      <c:otherwise>
        <td align="right" width="20"><input type="radio" name="status" checked />
          启用 |
          <input  type="radio" name="status" />
          禁用</td>
      </c:otherwise>
    </c:choose>
  </tr>
  <tr>
    <td height="50">&nbsp;</td>
    <td align="right" valign="bottom"><a  value="提交" class="easyui-linkbutton">增加</a></td>
  </tr>
</table>
</fieldset>
<script>
  var showImg = document.querySelector("#file_pic");
  var getImg = document.querySelector("input[type='file']");
  if(typeof FileReader==='undefined'){
    showImg.innerHTML = "抱歉，你的浏览器不支持!";
    getImg.setAttribute('disabled','disabled');
  }else{
    getImg.addEventListener('change',readFile,false);
  }
  function readFile(){
    var file = this.files[0];
    if(!/image\/\w+/.test(file.type)){
      alert("请上传图片！");
      return false;
    }
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(e){
      showImg.getElementsByTagName("img")[0].src=this.result ;
    }
  }
</script>
</body>

</html>