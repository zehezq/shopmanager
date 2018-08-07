<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="javascript"></script>
<script>
    $(function(){
        var i=10;
        $("#mem").datagrid({
            columns:[[
                {field:'userID',title:'用户编号',width:70,align:'center'},
                {field:'username',title:'用户名',width:70,align:'center'},
                {field:'phone',title:'用户手机号码',width:70,align:'center'},
                {field:'userpicture',title:'用户头像',width:70,align:'center'},
                {field:'createtime',title:'创建时间',width:70,align:'center'}
            ]]
        });
    })
</script>
<div id="content" region="center" split="true" title="" style="padding:5px;">
    <table id="mem"></table>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>