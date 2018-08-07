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
    $('#system').datagrid({
      //表格的数据来源
      url:'datagrid_data.json',
      columns:[[
        {field:'code',title:'系统设置',width:100,align:'center'}
      ]]
    });
    $('#system').datagrid('load', {
      name: 'easyui',
      address: 'ho'
    });
  })
</script>
<div id="content" region="center" split="true" style="padding:5px;">
  <table id="system">

  </table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>