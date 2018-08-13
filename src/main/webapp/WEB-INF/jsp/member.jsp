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
            handler:function(id)
            {//window.location.href="page_addmember"
                alert("添加")
            }
        },'-',{
            iconCls: 'icon-cancel',
            text:"删除",
            handler: function(row)
            {
                //alert('删除按钮')
                remove(row);
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

    /*function remove(rowIndex){  //删除操作
        $.messager.confirm('确认','确认删除?',function(row){
            if(row){
                alert(rowIndex);
                var selectedRow = $('#mem').datagrid('getSelected');  //获取选中行

                $.ajax({
                    url:"deletedata",
                    //加了个type，作用是以后不管什么删除，都可以转到这个ashx中处理
                    success:function(){
                        $('#mem').datagrid("deleteRow", row)
                        alert('删除成功');
                    }
                });
                $("#mem").datagrid("reload");
            }
        })
    }*/


</script>
<div id="editmember" style="overflow: hidden">
    <iframe id="contentbody" src="" width="600px" height="400px" frameborder="0" ></iframe>
</div>
<div id="content" region="center" split="true" title="" style="padding:3px;">
    <table id="mem"></table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>