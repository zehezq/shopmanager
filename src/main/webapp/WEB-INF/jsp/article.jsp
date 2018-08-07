<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="javascript"></script>
<script>
    $(function(){
        var i=10;
        $("#art").datagrid({
            columns:[[
                {field:'articleID',title:'文章编号',width:70,align:'center'},
                {field:'title',title:'文章标题',width:70,align:'center'},
                {field:'content',title:'文章内容',width:70,align:'center'},
                {field:'picurl',title:'文章图片地址',width:70,align:'center'},
                {field:'readcount',title:'阅读量',width:70,align:'center'},
                {field:'createtime',title:'创建时间',width:70,align:'center'},
                {field:'updatetime',title:'修改时间',width:70,align:'center'}
            ]]
        });
    })
</script>
<div id="content" region="center" split="true" title="" style="padding:5px;">
    <table id="art"></table>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>
