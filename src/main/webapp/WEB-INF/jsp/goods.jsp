<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script>
  $(function(){
    $('#goods').datagrid({
      //表格的数据来源
      url:'datagrid_data.json',
      columns:[[
        {field:'code',title:'商品编号',width:100,align:'center'},
        {field:'caption',title:'商品名称',width:100,align:'center'},
        {field:'link',title:'图片链接',width:100,align:'center'},
        {field:'price',title:'售价',width:70,align:'center'},
        {field:'oldprice',title:'旧价',width:70,align:'center'},
        {field:'stock',title:'库存',width:70,align:'center'},
        {field:'status',title:'状态',width:70,align:'center'},
        {field:'description',title:'描述',width:100,align:'center'},
        {field:'likenum',title:'点赞数',width:70,align:'center'},
        {field:'createtime',title:'创建时间',width:100,align:'center'},
        {field:'updatetime',title:'修改时间',width:100,align:'center'}
      ]]
    });
    $('#goods').datagrid('load', {
      name: 'easyui',
      address: 'ho'
    });
  })
</script>
<div id="content" region="center" split="true" style="padding:3px;">
  <table id="goods">

  </table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>
