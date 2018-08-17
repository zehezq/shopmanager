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
    initTable("categorydata",null);
    //
    $("#selectmem").panel({width:"100%",height:80,title:"搜索选项"});
    $("#searchbtn").linkbutton();

  })

  function initTable(path,paramter){
    $('#category').datagrid({
      //表格的数据来源
      url:path,
      pagination:'true',
      queryParams:paramter,
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
  }

  //编辑
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
    var data={id:$("#id").val(),caption:$("#caption").val(),status:$("#input:checked").val()};
    $.post("addcategory",data,function(){
      alert("提交成功");
    })
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
        var id;
        for (var i = 0; i < selectRows.length; i++) {
          id = selectRows[i].code;
          $.post("deletecate", {code:id}, function (data) {
            if (data == "ok") {
              //刷新表格，去掉选中状态的 那些行。
              $.messager.alert("删除成功！");;
              $('#category').datagrid("reload");
              $('#category').datagrid("clearSelections");
            } else {
              $.messager.alert("删除失败！");
            }
          });
        }
       /*
        $.messager.confirm("确认消息", "您确定要删除信息吗？", function (r) {
        if (r) {
        //真删除了  1,3,4
        //var codes = [];
        var id;
        for (var i = 0; i < selectRows.length; i++) {
        id = selectRows[i].code;
        codes.push(id);
        }
       var pa = $.param(codes, true);
        $.post("deletecateogry", pa, function (data) {
          alert("删除");
            if (data == "ok") {
            //刷新表格，去掉选中状态的 那些行。
            $('#category').datagrid("reload");
            $('#category').datagrid("clearSelections");
          } else {
            $.messager.alert("删除失败~~", data);
          }
        });*/
      }
    });
  }

  function doSearch(){
    var data = {caption:$("#mingchen").combobox("getText"),status:$("#zhuangtai").combobox("getValue")};
    initTable("categorypartdata",data);

  }

</script>

<div id="content" region="center" split="true" style="padding:5px;">
  <div id="selectmem" style="padding:10px">
    <span>类别名称:</span>
    <input id="mingchen" name="mingchen" class="easyui-combobox"
           data-options="valueField:'code',textField:'caption',url:'categoryall'" style="line-height:26px;border:1px solid #ccc">
    <span>商品状态:</span>
    <select id="zhuangtai" name="zhuangtai" class="easyui-combobox" style="line-height:26px;border:1px solid #ccc">
      <option value="">请选择</option>
      <option value="1">启用</option>
      <option value="0">禁用</option>
    </select>
    <a id="searchbtn" href="#" plain="true" onclick="doSearch()">Search</a>
  </div>
  <table id="category"></table>


<div id="editCategory"  style="overflow: hidden">
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
      <td>类别状态：</td>
      <c:choose>
        <td align="right"><input type="radio" name="status" value="1" />
          启用 |
          <input checked type="radio" name="status" value="0"/>
          禁用</td>
      </c:choose>
    </tr>
  </table>
</div>


<jsp:include page="common/foot.jsp"></jsp:include>