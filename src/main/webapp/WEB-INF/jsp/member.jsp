<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>
<script>
    var showImg,getImg;
    $(function(){
        showImg = document.querySelector("#file_pic");
        getImg = document.querySelector("input[type='file']");
        if(typeof FileReader==='undefined'){
            showImg.innerHTML = "抱歉，你的浏览器不支持!";
            getImg.setAttribute('disabled','disabled');
        }else{
            getImg.addEventListener('change',readFile,false);
        }

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

   /* function initiadatagrid();*/

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
            width: 340,
            height: 310,
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
                    addmems();
                   $("#mem").datagrid("reload");
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
            var data={username:$("#username").val(),phone:$("#phone").val()}
            $.post("adddata",data,function(d){
                alert(d)
            })
        }else{
            $("#uploadimage").ajaxSubmit({
                success:function(url){
                    var data={username:$("#username").val(),phone:$("#phone").val(),userpicture:url}
                    $.post("adddata",data,function(d){
                        alert(d)
                    })
                }
            })
        }
    }


    function readFile(){
     var file = this.files[0];
     if(!/image\/\w+/.test(file.type)){
     alert("请上传图片！");
     return false;
     }
     var reader = new FileReader();
     reader.readAsDataURL(file);
     reader.onload = function(e){
     showImg.getElementsByTagName("img")[0].src=this.result;
     }
     }
</script>
<div id="editmember" style="overflow: hidden">
    <iframe id="contentbody" src="" width="600px" height="400px" frameborder="0" ></iframe>
</div>
<div id="content" region="center" split="true" title="" style="padding:3px;">
    <div id="selectmem" style="padding:3px">
        <span>用户名字:</span>
        <input id="name" style="line-height:26px;border:1px solid #ccc">
        <span>用户电话:</span>
        <input id="telphone" style="line-height:26px;border:1px solid #ccc">
        <a href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()">Search</a>
    </div>
    <table id="mem"></table>
</div>

<div id="addmember">
    <table align="center" cellpadding="3" cellspacing="3">
        <tr>
            <td align="right">用户名字:</td>
            <td align="left">
                <input id="username" name="username" /></td>
        </tr>
        <tr>
            <td align="right">手机号码:</td>
            <td align="left">
                <input id="phone" name="phone" /></td>
        </tr>
        <tr>
            <td align="right" valign="top">用户头像:</td>
            <td align="left">
                <form action="uploadimage" id="uploadimage"  method="post" enctype="multipart/form-data">
                    <label id="file_pic">
                        <input type="file" name="fs" id="fs" style="display: none;" />
                        <img src="" width="173" height="150" >
                    </label>
                </form>
            </td>
        </tr>
    </table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>