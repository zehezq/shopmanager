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
	width:550px;
	height:450px;
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
    <td width="87" align="right">商品编号:</td>
    <td width="421" align="right"><input id="goodid" type="text" name="goodid" value="${goods.goodid}" /></td>
  </tr>
  <tr>
    <td width="87" align="right">商品名称:</td>
    <td width="421" align="right"><input id="caption" type="text" name="caption" value="${goods.caption}" /></td>
  </tr>
  <tr>
    <td align="right">商品售价:</td>
    <td align="right"><input id="price" type="text" name="price" value="${goods.price}" /></td>
  </tr>
  <tr>
    <td align="right">商品旧价:</td>
    <td align="right"><input id="oldprice" type="text" name="oldprice" value="${goods.oldprice}" /></td>
  </tr>
  <tr>
    <td align="right">商品库存:</td>
    <td align="right"><input id="stock" type="text" name="stock" value="${goods.stock}" /></td>
  </tr>
  <tr>
    <td align="right">商品描述:</td>
    <td align="right"><input id="description" type="text" name="description" value="${goods.description}" /></td>
  </tr>
  <tr>
    <td align="right">商品点赞数:</td>
    <td align="right"><input id="praisenum" type="text" name="praisenum" value="${goods.praisenum}" /></td>
  </tr>
  <tr>
    <td align="right">商品创建时间:</td>
    <td align="right"><input id="createtime" type="text" name="createtime" value="${goods.createtime}" /></td>
  </tr>
  <tr>
    <td align="right">商品更新时间:</td>
    <td align="right"><input id="updatetime" type="text" name="updatetime" value="${goods.updatetime}" /></td>
  </tr>
  <tr>
    <td align="right" valign="top">商品图片:</td>
    <td align="right">
      <form id="uploadgoodspic" action="uploadgoodspic" method="post" enctype="multipart/form-data">
      <label id="file_pic">
        <input type="file" id="fs" name="fs" style="display: none;" />
        <img src="${goods.picurl}" width="400" height="150" >
      </label>
      </form>
    </td>

  </tr>
  <tr>
    <td align="right">商品状态:</td>
    <c:choose>
      <c:when test="${goods.status==1}">
        <td align="right"><input type="radio" name="status"  />
          在售 |
          <input checked type="radio" name="status" />
          下架</td>
      </c:when>
      <c:otherwise>
        <td align="right" width="20"><input type="radio" name="status" checked />
          在售 |
          <input  type="radio" name="status" />
          下架</td>
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

  function edit() {
    alert("点击了提交按钮1");
    if ($("#fs").val() == "") {
      var data = {
        code: $("#code").val(),
        caption: $("#caption").val(),
        price: $("#price").val(),
        oldprice: $("#oldprice").val(),
        stock: $("#stock").val(),
        description: $("#description").val(),
        praisenum: $("#praisenum").val(),
        createtime: $("#createtime").val(),
        updatetime: $("#updatetime").val(),
        status: $("input:checked").val()
      }
      $.post("updategoods", data, function (d) {
        alert(d);
      });
      alert("点击了提交按钮2");
    } else {
      $("#uploadgoodspic").ajaxSubmit({
        success: function (url) {
          //alert("服务器响应的数据是"+data);
          var data = {
            code: $("#code").val(),
            caption: $("#caption").val(),
            price: $("#price").val(),
            oldprice: $("#oldprice").val(),
            stock: $("#stock").val(),
            description: $("#description").val(),
            praisenum: $("#praisenum").val(),
            createtime: $("#createtime").val(),
            updatetime: $("#updatetime").val(),
            status: $("input:checked").val(),
            picurl:url
          }
          $.post("updategoods", data, function (d) {
            alert(d);
          });
          alert("点击了提交按钮3");
        }
      });
    }
  }
</script>
</body>

</html>