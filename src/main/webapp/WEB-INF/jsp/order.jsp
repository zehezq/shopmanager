<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>
<script>
    $(function(){
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
            url:"orderdata",
            title:"订单列表",
            singleSelect:true,
            pagination:true,
            toolbar:[{
                iconCls: 'icon-add',
                text:"增加",
                handler: function()
                {showords()}
            },'-',{
                iconCls: 'icon-cancel',
                text:"删除",
                handler: function()
                {alert('删除按钮')}
            },'-',{
                text: '订单编号<input id="itemid" style="line-height:14px;border:1px solid #ccc"/>'
            },{
                id: 'btnAddPeopleSetId',
                iconCls:'icon-search',
                text: '搜索',
                handler: function(){
                    inputToobar();
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
    })

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

    function addorder(){
        alert("点击了提交按钮")
        var data={userid:$("#userid").val(),price:$("#price").val(),status:$("input:checked").val()}
        $.post("addorders",data,function(d){
            alert(d)
        })
    }

</script>

<div id="content" region="center" split="true" style="padding:3px;">
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