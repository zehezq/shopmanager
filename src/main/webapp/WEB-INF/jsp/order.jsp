<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>
<script>
    $(function(){
        initialdatagrid("orderdata",null)
        $("#selectord").panel({width:"100%",height:65,title:"搜索选项"});
        $("searchbutton").linkbutton;
    })

    //初始表格
    function initialdatagrid(path,parameter){
        $("#ord").datagrid({
            columns:[[
                {field:' ',title:' ',width:30,align:'center',checkbox:true},
                {field:'id',title:'订单编号',width:70,align:'center'},
                {field:'userid',title:'用户编号',width:70,align:'center'},
                {field:'price',title:'订单价格',width:70,align:'center'},
                {field:'status',title:'订单状态',width:70,align:'center',formatter: function(value,row,index){
                    if (value==1){
                        return "已支付";
                    } else {
                        return "未支付";
                    }
                }},
                {field:'ordertime',title:'创建时间',width:100,align:'center',formatter: function(value,row,index){
                    var d=new Date(value);
                    return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+ d.getDate()+"-"+ d.getHours()+":" +d.getMinutes()+":"+ d.getSeconds();
                }},
                {field:'edit',title:'编辑',width:70,align:'center',formatter: function(value,row,index){
                    return "<a href='javascript:showWindow("+row.id+")'>编辑详情</a>";
                }}
            ]],
            url:path,
            title:"订单列表",
            singleSelect:true,
            queryParams:parameter,
            pagination:true,
            toolbar:[{
                iconCls: 'icon-add',
                text:"增加",
                handler: function()
                {showords()}
            },'-',{
                iconCls: 'icon-remove',
                text:"删除",
                handler: function()
                {
                    deleteorder();
                    //alert("delete");
                }
            }]
        });
        var p = $('#ord').datagrid('getPager');
        $(p).pagination({
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [10, 20, 30],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
        });
    }

    //编辑窗口
    function showWindow(id){
        $("#editorder").window({
            width:600,
            height:400,
            title:"编辑",
            modal:true,
            collapsible:false,
            minimizable:false,
            maximizable:false,
            onClose:function(){
                $("#ord").datagrid("reload");
            }
        })
        $("#contentbody").attr("src","orderbyid?id="+id)
    }

    //添加窗口
    function showords() {
        $("#addord").css("display", "block");
        $("#addord").dialog({
            width: 300,
            height: 170,
            modal: true,
            title: "添加订单",
            collapsible: true,
            minimizable: true,
            maximizable: true,
            resizable: true,
            buttons: [{
                id: 'btnAdd',
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    addorder();
                    //initTable();
                    $('#ord').datagrid("reload");
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

    //添加方法
    function addorder(){
        alert("点击了提交按钮")
        var data={userid:$("#userid").val(),price:$("#price").val(),status:$("input:checked").val()}
        $.post("addorders",data,function(d){
            alert(d)
        })
    }

    //删除数据
    function deleteorder() {
        //把选中的数据查询出来。
        var selectRows = $('#ord').datagrid("getSelections");
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
                    $.post("deleteorders", {id:id}, function (data) {
                        if (data = "success") {
                            //刷新表格，去掉选中状态的 那些行。
                            alert("删除成功");
                            $('#ord').datagrid("reload");
                            $('#ord').datagrid("clearSelections");
                        } else {
                            $.messager.alert("删除失败", data);
                        }
                    });
                }
            }
        });
    }

    //查询方法
    function dosearch(){
        var data={userid:$("#uid").val(),status:$("#sta").combobox("getValue")}
        initialdatagrid("selectbyuidorstatus",data);
    }
</script>

<div id="content" region="center" split="true" style="padding:3px;">
    <div id="selectord" style="padding:3px">
        <span>用户编号:</span>
        <input id="uid" style="line-height:26px;border:1px solid #ccc">
        <span>支付状态:</span>
        <select id="sta" name="zhuangtai" class="easyui-combobox" panelHeight="auto" style="line-height:26px;border:1px solid #ccc">
            <option value="">请选择</option>
            <option value="1">已支付</option>
            <option value="0">未支付</option>
        </select>
        <a id="searchbutton" href="#" class="easyui-linkbutton" plain="true" onclick="dosearch()">Search</a>
    </div>
    <table id="ord"></table>
    <div id="editorder" style="overflow: hidden;">
        <iframe id="contentbody" src="" width="600px" height="400px" frameborder="0"></iframe>
    </div>
</div>

<div id="addord">
<table align="center" cellpadding="3" cellspacing="3">
    <tr>
        <td align="right">用户编号:</td>
        <td align="left"><input id="userid" name="userid" /></td>
    </tr>
    <tr>
        <td align="right">订单价格:</td>
        <td align="left"><input id="price" name="price" /></td>
    </tr>
    <tr>
        <td align="right">订单状态:</td>
        <c:choose>
                <td align="left"><input type="radio" name="status" value="1" />
                    已支付 |
                    <input checked type="radio" name="status" value="0" />
                    未支付</td>
        </c:choose>
    </tr>
</table>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>