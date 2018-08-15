<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<%--<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>--%>
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
                {deleteArt();}
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
            width: 340,
            height: 355,
            modal: true,
            title: "添加文章信息",
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
        var data={title:$("#title").val(),content:$("#contents").val(),picurl:$("#picurl").val(),readcount:$("#readcount").val()}
        $.post("addarticle",data,function(d){
            alert(d)
        })
    }


    //删除数据
    function deleteArt() {
        //把你选中的 数据查询出来。
        var selectRows = $('#art').datagrid("getSelections");
        if (selectRows.length < 1) {
            $.messager.alert("提示消息", "请选中要删的数据!");
            return;
        }

        //真删除数据
        //提醒用户是否是真的删除数据
        $.messager.confirm("确认消息", "您确定要删除信息吗？", function (r) {
            if (r) {
                var id;
                for (var i = 0; i < selectRows.length; i++) {
                    id = selectRows[i].articleid;
                    $.post("deletearticle", {articleid:id}, function (data) {
                        if (data = "success") {
                            //刷新表格，去掉选中状态的 那些行。
                            alert("删除成功");
                            $('#art').datagrid("reload");
                            $('#art').datagrid("clearSelections");
                        } else {
                            $.messager.alert("删除失败", data);
                        }
                    });
                }
            }
        });
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
            <td align="right" valign="top">文章内容:</td>
            <td align="right">
                <input type="text" id="contents" name="contents" style="width: 172px; height: 170px"/></td>
        </tr>
        <tr>
            <td align="right">图片地址:</td>
            <td align="left"><input id="picurl" name="picurl" /></td>
        </tr>
        <tr>
            <td align="right">阅读量:</td>
            <td align="left"><input id="readcount" name="readcount" /></td>
        </tr>
    </table>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>
