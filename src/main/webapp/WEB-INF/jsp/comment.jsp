<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>
<script>
    $(function(){
        initialdatagrid("commentdata",null)
        $("#selectcom").panel({width:"100%",height:65,title:"搜索选项"});
        $("searchbutton").linkbutton;
    })

    function initialdatagrid(path,parameter){
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
            url:path,
            title:"评论列表",
            singleSelect:true,
            queryParams:parameter,
            pagination:true,
            toolbar:[{
                iconCls: 'icon-add',
                text:"增加",
                handler: function()
                {showComs()}
            },'-',{
                iconCls: 'icon-remove',
                text:"删除",
                handler: function()
                {deletecoms();}
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
    }

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

    //删除数据
    function deletecoms() {
        //把选中的数据查询出来。
        var selectRows = $('#com').datagrid("getSelections");
        if (selectRows.length < 1) {
            $.messager.alert("提示消息", "请选中要删的数据!");
            return;
        }
        //提醒用户是否是真的删除数据
        $.messager.confirm("确认消息", "您确定要删除信息吗？", function (r) {
            if (r) {
                var id;
                for (var i = 0; i < selectRows.length; i++) {
                    id = selectRows[i].id;
                    $.post("deletecomments", {id:id}, function (data) {
                        if (data == "success") {
                            //刷新表格，去掉选中状态的 那些行。
                            alert("删除成功");
                            $('#com').datagrid("reload");
                            $('#com').datagrid("clearSelections");
                        } else {
                            $.messager.alert("删除失败", data);
                        }
                    });
                }
            }
        });
    }

    function doSearch(){
         var uphone=$("#phonetxt").textbox('getValue');
         var newData=[];
         var gridData=$("#mem").datagrid('getData');
         for(var i=0;i<gridData.total;i++){
         if(gridData.rows[i].number==uphone){
         newData.push(gridData.rows[i]);
         }
         }
         $('#mem').datagrid('loadData',newData);
    }

    function dosearch(){
        var data={userid:$("#uid").val(),goodid:$("#gid").val()}
        initialdatagrid("selectbyuidorgid",data);
    }

</script>
<div id="content" region="center" split="true" title="" style="padding:3px;">
    <div id="selectart" style="padding:3px">
        <span>用户编号:</span>
        <input id="uid" style="line-height:26px;border:1px solid #ccc">
        <span>商品编号:</span>
        <input id="gid" style="line-height:26px;border:1px solid #ccc">
        <a id="searchbutton" href="#" class="easyui-linkbutton" plain="true" onclick="dosearch()">Search</a>
    </div>
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