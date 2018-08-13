<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>
<script>
  $(function(){
    $('#adv').datagrid({
      //表格的数据来源
      url:'advertisementdata',
      pagination:'true',
      title:'广告列表',
      toolbar: [{
        iconCls: 'icon-add',
        text:'增加',
        handler: function(){showAddFrm();}
      },'-',{
        iconCls: 'icon-remove',
        text:'删除',
        handler: function(){alert('删除按钮')}

      }],
      singleSelect:true,
      columns:[[
        {field:'adno',title:'广告编号',width:100,align:'center',checkbox:"true"},
        {field:'index',title:'排位',width:100,align:'center'},
        {field:'title',title:'广告标题',width:100,align:'center'},
        {field:'picurl',title:'广告图片',width:100,align:'center',formatter:
                function(v,r,i){
                 return "<img src="+v+"height=20 />";
                }},
        {field:'url',title:'广告链接',width:100,align:'center',formatter:
                function(v,r,i){
                  return v/*"<a href="+v"></a>"*/;
                }},
        {field:'status',title:'广告状态',width:100,align:'center',formatter:
                function(v,r,i){
                  if(v==1)
                      return "启用";
                  else
                      return "禁用";
        }},
        {field:'createtime',title:'创建时间',width:150,align:'center',formatter:
                function(v,r,i){
                  var d = new Date(v);
                  return d.getFullYear()+"年"+(d.getMonth()+1)+"月"+ d.getDate()+"日"+ d.getHours()+":"+ d.getMinutes()+":"+ d.getSeconds();
                }
        },
        {
          field: 'edit', title: '编辑详情', width: 100, align: 'center', formatter:
                function (v, r, i) {
                    return "<a href='javascript:showWindow("+ r.adno+")'>编辑详情</a>";
                }
        }
      ]]
    });
    var p = $('#adv').datagrid('getPager');
    $(p).pagination({
      beforePageText: '第',//页数文本框前显示的汉字
      afterPageText: '页    共 {pages} 页',
      displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    });
  })

  function showWindow(adno){
    $("#editAdv").window({
      width:680,
      height:420,
      title:"编辑广告",
      modal:true,
      collapsible:false,
      minimizable:false,
      maximizable:false,
      onClose:function(){
        $("#adv").datagrid("reload");
      }
    })
    $("#contentbody").attr("src","advertisementbyid?id="+adno)
  }

  //显示弹出添加的对话框
  function showAddFrm() {
    $("#addDiv").css("display", "block");
    $("#addDiv").dialog({
      width: 550,
      height: 400,
      modal: true,
      title: "添加广告信息",
      collapsible: true,
      minimizable: true,
      maximizable: true,
      resizable: true,
      buttons: [{
        id: 'btnAdd',
        text: '添加',
        iconCls: 'icon-add',
        handler: function () {

          addAds();
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

  function addAds(){
    alert("点击了提交按钮")
    if($("#fs").val()==""){
      var data = {
        index: $("#index").val(),
        title: $("#title").val(),
        url: $("#url").val(),
        createtime:$("#createtime"),
        status: $("input:checked").val()
      }
      $.post("addads",data,function(d){
        alert(d)
      });
    }else {
      $("#uploadpic").ajaxSubmit({
        success: function (url) {
          //alert("服务器响应的数据是"+data);
          var data = {
            index: $("#index").val(),
            title: $("#title").val(),
            url: $("#url").val(),
            createtime:$("#createtime"),
            picurl: url,
            status: $("input:checked").val()
          }
          $.post("addads", data, function (d) {
            alert(d);
          })
        }
      });
    }
  }


</script>
<div id="content" region="center" split="true" style="padding:5px;">
  <table id="adv"></table>

  <div id="editAdv">
    <iframe id="contentbody" src="" width="680" height="420" scrolling="no" frameborder="0"></iframe>
  </div>
</div>

<div id="addDiv">
  <table>
    <tr>
      <td>广告排位：</td>
      <td><input id="index" name="" /></td>
    </tr>
    <tr>
      <td>广告标题：</td>
      <td><input id="title" name="price" /></td>
    </tr>
    <tr>
      <td>广告链接：</td>
      <td>
        <input id="url" name="oldprice" />
      </td>
    </tr>
    <tr>
      <td>广告创建时间：</td>
      <td>
        <input id="createtime" name="stock"/>
      </td>
    </tr>
    <tr>
      <td  valign="top">广告图片:</td>
      <td align="right">
        <form id="uploadpic" action="uploadpic" method="post" enctype="multipart/form-data">
          <label id="file_pic">
            <input type="file" id="fs" name="fs" style="display: none;" />
            <img src="" width="400" height="150" >
          </label>
        </form>
      </td>
    </tr>
    <tr>
      <td>广告状态:</td>
      <c:choose>
        <%--<c:when test="${adv.status==1}">--%>
        <td align="right"><input type="radio" name="status" value="1" />
          启用 |
          <input checked type="radio" name="status" value="0"/>
          禁用</td>
        <%-- </c:when>--%>
        <%--<c:otherwise>
          <td align="right" width="20"><input type="radio" name="status" checked value="0"/>
            启用 |
            <input  type="radio" name="status" value="1"/>
            禁用</td>
        </c:otherwise>--%>
      </c:choose>
    </tr>
  </table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>

