<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>电商销售管理台</title>
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
	width:500px;
	height:300px;
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
<legend>广告管理</legend>

<table width="544"  align="center" cellpadding="3" cellspacing="3">
  <tr>
    <td width="87" align="right">广告编号:</td>
    <td width="421" align="right"><input id="adno" type="text" name="Input" value="${adv.adno}" /></td>
  </tr>
  <tr>
    <td width="87" align="right">广告排位:</td>
    <td width="421" align="right"><input id="index" type="text" name="Input" value="${adv.index}" /></td>
  </tr>
  <tr>
    <td width="87" align="right">广告标题:</td>
    <td width="421" align="right"><input id="title" type="text" name="Input" value="${adv.title}" /></td>
  </tr>
  <tr>
    <td align="right">连接地址:</td>
    <td align="right"><input id="url" type="text" name="Input2" value="${adv.url}" /></td>
  </tr>
  <%--<tr>
    <td align="right">创建时间:</td>
    <td align="right"><input type="text" name="Input2" value="${adv.cretetime}" /></td>
  </tr>--%>
  <tr>
    <td align="right" valign="top">广告图片:</td>
    <td align="right">
      <form id="uploadpic" action="uploadpic" method="post" enctype="multipart/form-data">
      <label id="file_pic">
      <input id="fs" type="file" name="fs" style="display: none;" />
      <img src="${adv.picurl}" width="400" height="150" >
      </label>
      </form>
    </td>

  </tr>
  <tr>
    <td align="right">广告状态:</td>
    <c:choose>
      <c:when test="${adv.status==1}">
        <td align="right"><input type="radio" name="status" value="1" />
          启用 |
          <input checked type="radio" name="status" value="0"/>
          禁用</td>
      </c:when>
      <c:otherwise>
        <td align="right" width="20"><input type="radio" name="status" checked value="0"/>
          启用 |
          <input  type="radio" name="status" value="1"/>
          禁用</td>
      </c:otherwise>
    </c:choose>
  </tr>
  <tr>
    <td height="50">&nbsp;</td>
    <td align="right" valign="bottom"><a onclick="edit()" value="提交" class="easyui-linkbutton">提交</a></td>
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

  function edit(){
    alert("点击了提交按钮")
    if($("#fs").val()==""){
      var data = {
        adno:$("#adno").val(),
        index: $("#index").val(),
        title: $("#title").val(),
        url: $("#url").val(),
        status: $("input:checked").val()
      }
      $.post("updateadv",data,function(d){
        alert(d)
      })
    }else {
      $("#uploadpic").ajaxSubmit({
        success: function (url) {
          //alert("服务器响应的数据是"+data);
          var data = {
            adno:$("#adno").val(),
            index: $("#index").val(),
            title: $("#title").val(),
            picurl: url,
            url: $("#url").val(),
            status: $("input:checked").val()
          }
          $.post("updateadv", data, function (d) {
            alert(d);
          })
        }
      });
    }

  }
</script>
</body>

</html>