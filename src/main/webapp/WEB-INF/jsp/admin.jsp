<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/17
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script>
  $(function(){
    initTable("admindata",null);
    //
    $("#selectmem").panel({width:"100%",height:80,title:"搜索选项"});
    $("#searchbtn").linkbutton();

  })

  function initTable(path,paramter){
    $('#admin').datagrid({
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
        {field:'password',title:'',width:100,align:'center',checkbox:"true"},
        {field:'account',title:'管理员账号',width:100,align:'center'},
        {field:'style',title:'身份',width:100,align:'center',formatter:
                function(v,r,i){
                  if(v==1)
                    return "超级管理员";
                  else
                    return "普通管理员";
                }},
        {
          field: 'edit', title: '编辑', width: 100, align: 'center', formatter:
                function (v, r, i) {
                  return "<a href='javascript:showWindow("+ r.account+")'>编辑详情</a>";
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

  function showAddFrm() {
    $("#addDiv").css("display", "block");
    $("#addDiv").dialog({
      width: 400,
      height: 300,
      modal: true,
      title: "添加管理员信息",
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
          $('#admin').datagrid("reload");
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
    var data={account:$("#acc").val(),password:$("#password").val(),style:0};
    $.post("addadmin",data,function(d){
      alert(d);
    })
  }

  function showWindow(account) {
    $("#editStyle").window({
      width: 600,
      height: 300,
      title: "修改管理员身份",
      modal: true,
      collapsible: false,
      minimizable: false,
      maximizable: false,
      onClose: function () {
        $("#admin").datagrid("reload");
      }
    })
    $("#contentbody").attr("src","adminbyaccount?account="+account)
  }

  function doSearch(){
    var data = {account:$("#account").combobox("getText"),style:$("#style").combobox("getValue")};
    initTable("adminpartdata",data);
  }


</script>
<div id="content" region="center" split="true" style="padding:5px;">
  <div id="selectmem" style="padding:10px">
    <span>账号:</span>
    <input id="account" name="account"  style="line-height:26px;border:1px solid #ccc">
    <span>管理员身份:</span>
    <select id="style" name="style" class="easyui-combobox" style="line-height:26px;border:1px solid #ccc">
      <option value="">请选择</option>
      <option value="0">普通管理员</option>
      <option value="1">超级管理员</option>
    </select>
    <a id="searchbtn" href="#" plain="true" onclick="doSearch()">Search</a>
  </div>
  <%--<div>
    <span>修改管理员身份: </span>
    <select onchange="$('#admin').datagrid({singleSelect:(this.value==0)})">
      <option value="0">普通管理员</option>
      <option value="1">超级管理员</option>
    </select>
  </div>--%>

  <table id="admin"></table>
  <div id="editStyle"  style="overflow: hidden">
    <iframe id="contentbody" src="" width="530" height="270" scrolling="no" frameborder="0"></iframe>
  </div>

</div>

<div id="addDiv">
  <table>
    <tr>
      <td>账号：</td>
      <td><input id="acc" name="" /></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td><input id="password" name="caption" /></td>
    </tr>
    <%--<tr>
      <td>身份：</td>
      <c:choose>
        <td align="right"><input type="radio" name="style" value="1" />
          超级管理员 |
          <input type="radio" name="style" value="0"/>
          普通管理员</td>
      </c:choose>
    </tr>--%>
  </table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>
