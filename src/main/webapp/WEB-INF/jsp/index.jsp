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
      console.log("后台输出的"); //f12 console中
    })

  </script>
</head>
<body>
<div class="easyui-layout" style="width:100%;height:640px;">
  <div region="north" split="true" title="" style="height:50px;">
    <h2>电商管理项目</h2>
  </div>
  <div region="west" split="true" title="操作区" style="width:150px;">
    <ul class="easyui-tree">
      <li>
        <span>销售管理平台</span>
        <ul>
          <li>
            <span>会员管理</span>
            <ul>
              <li><span>文章管理</span></li>
              <li><span>评论管理</span></li>
              <li><span>收藏管理</span></li>
            </ul>
          </li>
          <li><span>商品管理</span></li>
          <li><span>收藏管理</span></li>
        </ul>
      </li>
    </ul>
  </div>
  <div id="content" region="center" title="" style="padding:5px;">主区域</div>
</div>
</body>
</html>
