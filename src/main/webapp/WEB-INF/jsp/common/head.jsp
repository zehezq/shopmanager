<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>电商管理系统</title>
  <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
  <script type="text/javascript" src="easyui/js/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
  <script>
    //开始编写JavaScript代码
    $(function(){
      //alert("Hello World"); //输出方法，浏览器弹出一个输出的对话框
      //console.log("后台输出的"); //f12 console中
    })
  </script>
</head>
<body>
<div class="easyui-layout" style="width:100%;height:640px;">
  <div region="north" split="true" title="" style="height:70px;">
    <h2>电商管理项目</h2>
  </div>
  <div region="west" split="true" title="操作区" style="width:150px;">
    <ul class="easyui-tree">
      <li>
        <span>销售管理平台</span>
        <ul>
          <li><span><a href="tomember">会员管理</a></span></li>
          <li><span><a href="toarticle">文章管理</a></span></li>
          <li><span><a href="tocomment">评论管理</a></span></li>
          <li><span><a href="toorder">订单管理</a></span></li>
          <li><span><a href="togoods">商品管理</a></span></li>
          <li><span><a href="advertise">广告管理</a></span></li>
          <li><span><a href="tocategory">类别管理</a></span></li>
          <li><span><a href="tosystem">系统设置</a></span></li>
        </ul>
      </li>
    </ul>
  </div>


