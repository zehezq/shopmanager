<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>
<script>
    $(function(){
        $("#com").datagrid({
            columns:[[
                {field:' ',title:' ',width:30,align:'center',checkbox:true},
                {field:'id',title:'评论编号',width:70,align:'center'},
                {field:'userid',title:'用户编号',width:70,align:'center'},
                {field:'goodid',title:'商品编号',width:70,align:'center'},
                {field:'content',title:'评论内容',width:150,align:'center'},
                {field:'commenttime',title:'发布时间',width:170,align:'center'},
                {field:'edit',title:'编辑',width:70,align:'center',formatter: function(value,row,index){
                    return "<a href='javascript:showWindow("+row.id+")'>编辑详情</a>";
                }}
            ]],
            url:"commentdata",
            title:"评论列表",
            singleSelect:true,
            pagination:true,
            toolbar:[{
                iconCls: 'icon-add',
                text:"增加",
                handler: function()
                {showComs()}
            },'-',{
                iconCls: 'icon-cancel',
                text:"删除",
                handler: function()
                {alert('删除按钮')}
            },'-',{
                text: '评论编号<input id="itemid" style="line-height:14px;border:1px solid #ccc"/>'
            },{
                id: 'btnAddPeopleSetId',
                iconCls:'icon-search',
                text: '搜索',
                handler: function(){
                    inputToobar();
                }
            }]
        });
        var p = $('#com').datagrid('getPager');
        $(p).pagination({
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [10, 20, 30],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
        });
    })

    function showWindow(id){
        $("#editcomment").window({
            width:600,
            height:400,
            title:"编辑",
            modal:true,
            collapsible:false,
            minimizable:false,
            maximizable:false,
            onClose:function(){
                $("#com").datagrid("reload");
            }
        })
        $("#contentbody").attr("src","commentbyid?id="+id)
    }

    function showComs() {
        $("#addcom").css("display", "block");
        $("#addcom").dialog({
            width: 350,
            height: 220,
            modal: true,
            title: "添加评论信息",
            collapsible: true,
            minimizable: true,
            maximizable: true,
            resizable: true,
            buttons: [{
                id: 'btnAdd',
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    addcomment();
                    //initTable();
                    $('#com').datagrid("reload");
                }
            }, {
                id: 'btnCancelAdd',
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#addcom").dialog("close");
                }
            }]
        });
    }

    function addcomment(){
        alert("点击了提交按钮")
        var data={userid:$("#userid").val(),goodid:$("#goodid").val(),content:$("#contents").val(),commenttime:$("#commenttime").val()}
        $.post("addcomments",data,function(d){
            alert(d)
        })
    }

</script>
<div id="content" region="center" split="true" title="" style="padding:3px;">
    <table id="com"></table>
    <div id="editcomment" style="overflow:hidden;">
        <iframe id="contentbody" src="" width="600px" height="400px" frameborder="0"></iframe>
    </div>
</div>

<div id="addcom">
    <table align="center" cellpadding="3" cellspacing="3">
        <tr>
            <td align="right">用户编号:</td>
            <td align="left"><input id="userid" name="userid" /></td>
        </tr>
        <tr>
            <td align="right">商品编号:</td>
            <td align="left"><input id="goodid" name="goodid" /></td>
        </tr>
        <tr>
            <td align="right" valign="top">评论内容:</td>
            <td align="left"><input id="contents" name="contents" /></td>
        </tr>
        <tr>
            <td align="right">发布时间:</td>
            <td align="left"><input id="commenttime" name="commenttime"/></td>
        </tr>
    </table>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>