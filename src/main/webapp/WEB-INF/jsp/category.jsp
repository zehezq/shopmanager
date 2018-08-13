<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script>
  $(function(){
    $('#category').datagrid({
      //表格的数据来源
      url:'categorydata',
      pagination:'true',
      title:'商品类别列表',
      toolbar: [{
        iconCls: 'icon-add',
        text:'增加',
        handler: function(){showAddFrm();}
      },'-',{
        iconCls: 'icon-remove',
        text:'删除',
        handler: function(){doDelete();}

      }],
      columns:[[
        {field:'code',title:'类别编号',width:100,align:'center',checkbox:"true"},
        {field:'id',title:'序号',width:100,align:'center'},
        {field:'caption',title:'类别名称',width:100,align:'center'},
        {field:'status',title:'状态',width:100,align:'center',formatter:
                function(v,r,i){
                  if(v==1)
                    return "启用";
                  else
                    return "禁用";
                }},
        {field:'createtime',title:'创建时间',width:100,align:'center',formatter:
                function(v,r,i){
                  var d = new Date(v);
                  return d.getFullYear()+"年"+(d.getMonth()+1)+"月"+ d.getDate()+"日"+ d.getHours()+":"+ d.getMinutes()+":"+ d.getSeconds();
                }},
        {field:'updatetime',title:'修改时间',width:100,align:'center',formatter:
                function(v,r,i){
                  var d = new Date(v);
                  return d.getFullYear()+"年"+(d.getMonth()+1)+"月"+ d.getDate()+"日"+ d.getHours()+":"+ d.getMinutes()+":"+ d.getSeconds();
                }},
        {
          field: 'edit', title: '编辑详情', width: 100, align: 'center', formatter:
                function (v, r, i) {
                  return "<a href='javascript:showWindow("+ r.code+")'>编辑详情</a>";
                }
        }
      ]]
    });
    var p = $('#category').datagrid('getPager');
    $(p).pagination({
      beforePageText: '第',//页数文本框前显示的汉字
      afterPageText: '页    共 {pages} 页',
      displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    });

  })

  function showWindow(code){
    $("#editCategory").window({
      width:600,
      height:400,
      title:"编辑商品类别",
      modal:true,
      collapsible:false,
      minimizable:false,
      maximizable:false,
      onClose:function(){
        $("#category").datagrid("reload");
      }
    })
    $("#contentbody").attr("src","categorybyid?id="+code)
  }

  //显示弹出添加的对话框
  function showAddFrm() {
    $("#addDiv").css("display", "block");
    $("#addDiv").dialog({
      width: 400,
      height: 300,
      modal: true,
      title: "添加商品类别信息",
      collapsible: true,
      minimizable: true,
      maximizable: true,
      resizable: true,
      buttons: [{
        id: 'btnAdd',
        text: '添加',
        iconCls: 'icon-add',
        handler: function () {
          addCate();
          //initTable();
          $('#category').datagrid("reload");
          //关闭对话框，刷新表
          $("#addDiv").dialog("close");
        }
      }, {
        id: 'btnCancelAdd',
        text: '取消',
        iconCls: 'icon-cancel',
        handler: function () {
          $("#addDiv").dialog("close");
        }
      }]
    });
  }

  function addCate(){

    var data={id:$("#id").val(),caption:$("#caption").val(),status:$("#status").val(),createtime:$("#cretetime").val()};
    $.post("addcategory",data,function(){
      alert("提交成功");
    })
  }

  function myformatter(date){
     var y = date.getFullYear();
     var m = date.getMonth()+1;
     var d = date.getDate();
     return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
     }
   function myparser(s){
     if (!s) return new Date();
     var ss = (s.split('-'));
     var y = parseInt(ss[0],10);
     var m = parseInt(ss[1],10);
     var d = parseInt(ss[2],10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
       return new Date(y,m-1,d);
       }else{
       return new Date();
       }
     }

  //删除用户数据
  function doDelete() {
    //把你选中的 数据查询出来。
    var selectRows = $('#category').datagrid("getSelections");
    if (selectRows.length < 1) {
      $.messager.alert("提示消息", "请选中要删的数据!");
      return;
    }

    //真删除数据
    //提醒用户是否是真的删除数据
    $.messager.confirm("确认消息", "您确定要删除信息吗？", function (r) {
      if (r) {
        //真删除了  1,3,4
        var strIds = "";
        for (var i = 0; i < selectRows.length; i++) {
          strIds += selectRows[i].ID + ",";
        }
        strIds = strIds.substr(0, strIds.length - 1);
        //alert(strIds);
        $.post("/Administrator/DelBy", {ids: strIds}, function (data) {
            if (data == "ok") {
            //刷新表格，去掉选中状态的 那些行。
            $('#category').datagrid("reload");
            $('#category').datagrid("clearSelections");
          } else {
            $.messager.alert("删除失败~~", data);
          }
        });
      }
    });
  }



</script>

<div id="content" region="center" split="true" style="padding:5px;">
  <table id="category"></table>


<div id="editCategory">
  <iframe id="contentbody" src="" width="600" height="400" scrolling="no" frameborder="0"></iframe>
</div>
</div>

<div id="addDiv">
  <table>
    <tr>
      <td>排位：</td>
      <td><input id="id" name="" /></td>
    </tr>
    <tr>
      <td>类别名称：</td>
      <td><input id="caption" name="caption" /></td>
    </tr>
    <tr>
      <td>状态：</td>
      <td>
        <input id="status" name="status" />
      </td>
    </tr>
    <tr>
      <td>创建时间：</td>
      <td>
        <input id="cretetime" name="createtime" />
        <%--class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"--%>
      </td>
    </tr>
  </table>
</div>


<jsp:include page="common/foot.jsp"></jsp:include>