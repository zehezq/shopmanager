<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="javascript"></script>
<script>
  $(function(){
    var i=10;
    $("#adv").datagrid({
/*
      url:'datagrid_data.json',
*/
      columns:[[
        {field:'adno',title:'广告编号',width:70,align:'center'},
        {field:'index',title:'广告标题',width:70,align:'center'},
        {field:'status',title:'广告状态',width:70,align:'center'},
        {field:'createtime',title:'创建时间',width:70,align:'center'},
        {field:'picurl',title:'图片',width:70,align:'center'},
        {field:'url',title:'连接',width:70,align:'center'}
      ]]
    });

    /*$('#adv').datagrid('load', {
      adno: '1',
      index: 'easyui',
      status: '1',
      createtime: '1',
      picurl: '1',
      url: '1'
    });

    $('#adv').datagrid('reload');*/
  })
</script>
<div id="content" region="center" split="true" title="" style="padding:5px;">
  <table id="adv"></table>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>
