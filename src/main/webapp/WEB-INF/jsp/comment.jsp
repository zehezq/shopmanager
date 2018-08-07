<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="javascript"></script>
<script>
    $(function(){
        var i=10;
        $("#com").datagrid({
            columns:[[
                {field:'id',title:'评论编号',width:70,align:'center'},
                {field:'userID',title:'用户编号',width:70,align:'center'},
                {field:'goodID',title:'商品编号',width:70,align:'center'},
                {field:'content',title:'评论内容',width:70,align:'center'},
                {field:'commenttime',title:'发布时间',width:70,align:'center'}
            ]]
        });
    })
</script>
<div id="content" region="center" split="true" title="" style="padding:5px;">
    <table id="com"></table>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>