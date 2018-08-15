<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>
<script>
    $(function(){
        $("#art").datagrid({
            columns:[[
                {field:' ',title:' ',width:30,align:'center',checkbox:true},
                {field:'articleid',title:'文章编号',width:70,align:'center'},
                {field:'title',title:'文章标题',width:70,align:'center'},
                {field:'content',title:'文章内容',width:70,align:'center'},
                {field:'picurl',title:'图片地址',width:70,align:'center'},
                {field:'readcount',title:'阅读量',width:70,align:'center'},
                {field:'createtime',title:'创建时间',width:100,align:'center',formatter: function(value,row,index){
                    var d=new Date(value);
                    return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+ d.getDate()+"- "+ d.getHours()+":" +d.getMinutes()+":"+ d.getSeconds();
                }},
                {field:'updatetime',title:'修改时间',width:100,align:'center'},
                {field:'edit',title:'编辑',width:70,align:'center',formatter: function(value,row,index){
                    return "<a href='javascript:showWindow("+row.articleid+")'>编辑详情</a>";
                }}
            ]],
            url:"articledata",
            title:"文章列表",
            singleSelect:true,
            pagination:true,
            toolbar:[{
                iconCls: 'icon-add',
                text:"增加",
                handler: function()
                {addWindow();}
            },'-',{
                iconCls: 'icon-cancel',
                text:"删除",
                handler: function()
                {alert('删除按钮')}
            },'-',{
                text: '文章编号<input id="itemid" style="line-height:14px;border:1px solid #ccc"/>'
            },{
                id: 'btnAddPeopleSetId',
                iconCls:'icon-search',
                text: '搜索',
                handler: function(){
                    inputToobar();
                }
            }]
        });
        var p = $('#art').datagrid('getPager');
        $(p).pagination({
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [10, 20, 30],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
        });
    })

    function showWindow(id){
        $("#editarticle").window({
            width:600,
            height:400,
            title:"编辑",
            modal:true,
            collapsible:false,
            minimizable:false,
            maximizable:false,
            onClose:function(){
                $("#art").datagrid("reload");
            }
        })
        $("#contentbody").attr("src","articlebyid?id="+id)
    }

    function addWindow() {
        $("#addart").css("display", "block");
        $("#addart").dialog({
            width: 360,
            height: 350,
            modal: true,
            title: "添加会员信息",
            collapsible: true,
            minimizable: true,
            maximizable: true,
            resizable: true,
            buttons: [{
                id: 'btnAdd',
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    addarts();
                    $('#art').datagrid("reload");
                }
            }, {
                id: 'btnCancelAdd',
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#addart").dialog("close");
                }
            }]
        });
    }

    function addarts(){
        alert("点击了提交按钮")
        var data={articleid:$("#articleid").val(),title:$("#title").val(),picurl:$("#picurl").val(),readcount:$("#readcount").val(),updatetime:$("#updatetime").val()}
        $.post("addarticle",data,function(d){
            alert(d)
        })
    }

</script>
<div id="content" region="center" split="true" title="" style="padding:3px;">
    <table id="art"></table>
    <div id="editarticle" style="overflow:hidden;">
        <iframe id="contentbody" src="" width="600px" height="400px" frameborder="0" ></iframe>
    </div>
</div>
<div id="addart">
    <table align="center" cellpadding="3" cellspacing="3">
        <tr>
            <td align="right">文章标题:</td>
            <td align="left"><input id="title" name="title" /></td>
        </tr>
        <tr>
            <td align="right">图片地址:</td>
            <td align="left"><input id="picurl" name="picurl" /></td>
        </tr>
        <tr>
            <td align="right">阅读量:</td>
            <td align="left"><input id="readcount" name="readcount" /></td>
        </tr>
        <tr>
            <td align="right">修改时间:</td>
            <td align="right"><input id="updatetime" name="updatetime" /></td>
        </tr>
    </table>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>
