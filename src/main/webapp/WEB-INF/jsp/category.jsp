<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script>
  $(function(){
    $('#category').datagrid({
      //表格的数据来源
      url:'datagrid_data.json',
      columns:[[
        {field:'code',title:'类别编号',width:100,align:'center'},
        {field:'index',title:'序号',width:100,align:'center'},
        {field:'caption',title:'类别名称',width:100,align:'center'},
        {field:'status',title:'状态',width:100,align:'center'},
        {field:'createtime',title:'创建时间',width:100,align:'center'},
        {field:'updatetime',title:'修改时间',width:100,align:'center'}

      ]]
    });
    $('#category').datagrid('load', {
      name: 'easyui',
      address: 'ho'
    });
  })
</script>
<div id="content" region="center" split="true" style="padding:3px;">
  <table id="category">

  </table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>