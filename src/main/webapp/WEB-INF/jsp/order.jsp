<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="javascript"></script>
<script>
    $(function(){
        var i=10;
        $("#ord").datagrid({
            columns:[[
                {field:'orderID',title:'序号',width:70,align:'center'},
                {field:'id',title:'订单编号',width:70,align:'center'},
                {field:'userID',title:'用户编号',width:70,align:'center'},
                {field:'price',title:'订单价格',width:70,align:'center'},
                {field:'status',title:'订单状态',width:70,align:'center'},
                {field:'ordertime',title:'创建时间',width:70,align:'center'}
            ]]
        });
    })
</script>
<div id="content" region="center" split="true" title="" style="padding:5px;">
    <table id="ord"></table>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>