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
    initTable("advertisementdata")
    $("#selectmem").panel({width:"100%",height:80,title:"搜索选项"});
    $("#searchbtn").linkbutton();
  })

  function initTable(path,paramter){
    $('#adv').datagrid({
      //表格的数据来源
      url:path,
      queryParams:paramter,
      pagination:'true',
      title:'广告列表',
      toolbar: [{
        iconCls: 'icon-add',
        text:'增加',
        handler: function(){showAddFrm();}
      },'-',{
        iconCls: 'icon-remove',
        text:'删除',
        handler: function(){doDelete();}

      }],
      //singleSelect:true,
      columns:[[
        {field:'adno',title:'广告编号',width:100,align:'center',checkbox:"true"},
        {field:'index',title:'排位',width:100,align:'center'},
        {field:'title',title:'广告标题',width:100,align:'center'},
        {field:'picurl',title:'广告图片',width:100,align:'center',formatter: function(value,row,index){
          return "<img src="+value+" height=20px />";
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
  }

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
          //$("#addDiv").dialog("close");
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

  //删除用户数据
  function doDelete() {
    //把你选中的 数据查询出来。
    var selectRows = $('#adv').datagrid("getSelections");
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
          id = selectRows[i].adno;
          $.post("deleteadv", {adno:id}, function (data) {
            if (data == "ok") {
              //刷新表格，去掉选中状态的 那些行。
              $('#adv').datagrid("reload");
              $('#adv').datagrid("clearSelections");
            } else {
              $.messager.alert("删除失败~~", data);
            }
          });
        }
      }
    });
  }


  function readFile() {
    var file = this.files[0];
    if (!/image\/\w+/.test(file.type)) {
      alert("请上传图片！");
      return false;
    }
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e) {
      showImg.getElementsByTagName("img")[0].src = this.result;
    }
  }

  function doSearch(){
    var data = {title:$("#mingchen3").val(),status:$("#zhuangtai3").combobox("getValue")};
    initTable("findadvselect",data);

  }

</script>
<div id="content" region="center" split="true" style="padding:5px;">
  <div id="selectmem" style="padding:10px">
    <span>广告名称:</span>
    <input id="mingchen3" name="mingchen3" style="line-height:26px;border:1px solid #ccc">
    <span>广告状态:</span>
    <select id="zhuangtai3" name="zhuangtai3" class="easyui-combobox" style="line-height:26px;border:1px solid #ccc">
      <option value="">请选择</option>
      <option value="1">启用</option>
      <option value="0">禁用</option>
    </select>
    <a id="searchbtn" href="#" plain="true" onclick="doSearch()">Search</a>
  </div>
  <table id="adv"></table>

  <div id="editAdv" style="overflow: hidden">
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
    <td><input id="title" name="title" /></td>
  </tr>
    <tr>
      <td>广告链接：</td>
      <td>
        <input id="url" name="url" />
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
      <td>广告状态：</td>
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

