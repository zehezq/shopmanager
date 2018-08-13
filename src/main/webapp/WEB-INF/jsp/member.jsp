<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>
<script>
    $(function(){
        //
        $("#mem").datagrid({
            columns:[[
                {field:' ',title:' ',width:30,align:'center',checkbox:true},
                {field:'userid',title:'用户编号',width:70,align:'center'},
                {field:'username',title:'用户名',width:70,align:'center'},
                {field:'phone',title:'手机号码',width:100,align:'center'},
                {field:'userpicture',title:'用户头像',width:70,align:'center',formatter: function(value,row,index){
                    return "<img src="+value+" height=20px />";
                }},
                {field:'createtime',title:'创建时间',width:140,align:'center',formatter: function(value,row,index){
                    var d=new Date(value);
                    return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+ d.getDate()+"- "+ d.getHours()+":" +d.getMinutes()+":"+ d.getSeconds();
                }},
                {field:'edit',title:'编辑',width:70,align:'center',formatter: function(value,row,index){
                    return "<a href='javascript:showWindow("+row.userid+")'>编辑详情</a>";
                }}
            ]],
            url:"memberdata",
            title:"会员列表",
            singleSelect:true,
            pagination:true,//显示分页工具栏
            toolbar:[{
            iconCls: 'icon-add',
            text:"增加",
            handler:function()
            {//window.location.href="page_addmember"
                addWindow();
            }
        },'-',{
            iconCls: 'icon-cancel',
            text:"删除",
            id:"test",
            handler: function()
            {
                //alert('删除按钮')
                remove();
            }
        },'-',{
                text: '用户编号<input id="itemid1" style="line-height:14px;border:1px solid #ccc"/>'
            },{
                text: '用户名字<input id="itemid2" style="line-height:14px;border:1px solid #ccc"/>'
            },{
                id: 'btnAddPeopleSetId',
                iconCls:'icon-search',
                text: '搜索',
                handler: function(){
                    inputToobar();
                }
            }]

    });
        var p = $('#mem').datagrid('getPager');
        $(p).pagination({
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [10, 20, 30],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
        });
    })

    function showWindow(id){
        $("#editmember").window({
            width:600,
            height:400,
            title:"会员编辑",
            modal:true,
            collapsible:false,
            minimizable:false,
            maximizable:false,
            onClose:function(){
                $("#mem").datagrid("reload");
            }
        })
        $("#contentbody").attr("src","memberbyid?id="+id)
    }

    function addWindow() {
        $("#addmember").css("display", "block");
        $("#addmember").dialog({
            width: 600,
            height: 400,
            modal: true,
            title: "添加会员信息",
            collapsible:false,
            minimizable:false,
            maximizable:false,
            buttons: [{
                id: 'btnAdd',
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    addmems();
                    $('#mem').datagrid("reload");
                    //关闭对话框，刷新表
                    $("#addmember").dialog("close");
                }
            }, {
                id: 'btnCancelAdd',
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#addmember").dialog("close");
                }
            }]
        });
    }

    function addmems(){
        alert("点击了提交按钮")
        if($("#fs").val()==""){
            var data={userid:$("#userid").val(),username:$("#username").val(),phone:$("#phone").val(),createtime:$("#createtime").val()}
            $.post("adddata",data,function(d){
                alert(d)
            })
        }else{
            $("#uploadimage").ajaxSubmit({
                success:function(url){
                    var data={userid:$("#userid").val(),username:$("#username").val(),phone:$("#phone").val(),userpicture:url,createtime:$("#createtime").val()}
                    $.post("adddata",data,function(d){
                        alert(d)
                    })
                }
            })
        }
    }

    function remove() {
        var row = $('#mem').datagrid('getSelected');
        if (row) {
            var rowIndex = $('#mem').datagrid('getRowIndex', row);
            $('#mem').datagrid('deleteRow', rowIndex);
            alert("删除成功")
        }
    }

   /* function remove() {
        var row = $('#mem').datagrid('getSelected');
        if (row) {
            $.messager.confirm('confirm', 'Are you sure you want to delete this user?', function (r) {
                if (r) {
                    $.post('deletedata', {userid:row.userid}, function (result) {
                        if (result.success) {
                            $('#mem').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({   // show error message
                                title: 'error',
                                msg: result.errorMsg
                            });
                        }
                    });
                }
            });
        }
    }*/

</script>
<div id="editmember" style="overflow: hidden">
    <iframe id="contentbody" src="" width="600px" height="400px" frameborder="0" ></iframe>
</div>
<div id="content" region="center" split="true" title="" style="padding:3px;">
    <table id="mem"></table>
</div>

<div id="addmember">
    <table width="544"  align="center" cellpadding="3" cellspacing="3">
        <tr>
            <td width="87" align="right" >用户编号:</td>
            <td width="421" align="left">
                <input id="userid" type="text" /></td>
        </tr>
        <tr>
            <td align="right">用户名字:</td>
            <td align="left">
                <input type="text" id="username" /></td>
        </tr>
        <tr>
            <td align="right">手机号码:</td>
            <td align="left">
                <input type="text" id="phone" /></td>
        </tr>
        <tr>
            <td align="right" valign="top">用户头像:</td>
            <td align="left">
                <form action="uploadimage" id="uploadimage"  method="post" enctype="multipart/form-data">
                    <label id="file_pic">
                        <input type="file" name="fs" id="fs" style="display: none;" />
                        <img src="" width="400" height="150" >
                    </label>
                </form>
            </td>

        </tr>
        <tr>
            <td align="right">创建时间</td>
            <td align="left">
                <input type="text" id="createtime" name="" /></td>
        </tr>
    </table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>