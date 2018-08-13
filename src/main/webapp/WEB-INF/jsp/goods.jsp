<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/7
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/head.jsp"></jsp:include>
<script>
  $(function(){
    $('#goods').datagrid({
      //表格的数据来源
      url:'goodsdata',
      pagination:'true',
      title:'商品列表',
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
        {field:'goodid',title:'商品编号',width:100,align:'center',checkbox:"true"},
        {field:'code',title:'类别编号',width:100,align:'center'},
        {field:'caption',title:'商品名称',width:100,align:'center'},
        {field:'picurl',title:'商品图片',width:100,align:'center'},
        {field:'price',title:'售价',width:70,align:'center'},
        {field:'oldprice',title:'旧价',width:70,align:'center'},
        {field:'stock',title:'库存',width:70,align:'center'},
        {field:'status',title:'状态',width:70,align:'center',formatter:
                function(v,r,i){
                  if(v==1)
                    return "在售";
                  else
                    return "下架";
                }},
        {field:'description',title:'描述',width:100,align:'center'},
        {field:'praisenum',title:'点赞数',width:70,align:'center'},
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
                  return "<a href='javascript:showWindow("+ r.goodid+")'>编辑详情</a>";
                }
        }
      ]]
    });
    var p = $('#goods').datagrid('getPager');
    $(p).pagination({
      beforePageText: '第',//页数文本框前显示的汉字
      afterPageText: '页    共 {pages} 页',
      displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    });
  })

  function showWindow(id){
    $("#editGoods").window({
      width:600,
      height:500,
      title:"编辑商品",
      modal:true,
      fit:"true",
      collapsible:false,
      minimizable:false,
      maximizable:false,
      onClose:function(){
        $("#goods").datagrid("reload");
      }
    });
    $("#contentbody").attr("src","goodsbyid?id="+id);
  }

  //显示弹出添加的对话框
  function showAddFrm() {
    $("#addDiv").css("display", "block");
    $("#addDiv").dialog({
      width: 550,
      height: 500,
      modal: true,
      title: "添加商品信息",
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
          $('#goods').datagrid("reload");
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
    if ($("#fs").val() == "") {
      var data = {
        code: $("#code").val(),
        caption: $("#caption").val(),
        price: $("#price").val(),
        oldprice: $("#oldprice").val(),
        stock: $("#stock").val(),
        description: $("#description").val(),
        praisenum: $("#praisenum").val(),
        createtime: $("#createtime").val(),
        updatetime: $("#updatetime").val(),
        status: $("status").val()
      }
      $.post("insertgoods", data, function (d) {
        alert(d);
      });
    } else {
      $("#uploadgoodspic").ajaxSubmit({
        success: function (url) {
          //alert("服务器响应的数据是"+data);
          var data = {
            code: $("#code").val(),
            caption: $("#caption").val(),
            price: $("#price").val(),
            oldprice: $("#oldprice").val(),
            stock: $("#stock").val(),
            description: $("#description").val(),
            praisenum: $("#praisenum").val(),
            createtime: $("#createtime").val(),
            updatetime: $("#updatetime").val(),
            status: $("status").val(),
            picurl:url
          }
          $.post("insertgoods", data, function (d) {
            alert(d);
          });
        }
      });
    }
  }

  var showImg = document.querySelector("#file_pic");
  var getImg = document.querySelector("input[type='file']");
  if(typeof FileReader==='undefined'){
    showImg.innerHTML = "抱歉，你的浏览器不支持!";
    getImg.setAttribute('disabled','disabled');
  }else{
    getImg.addEventListener('change',readFile,false);
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

</script>
<div id="content" region="center" split="true" style="padding:5px;">
  <table id="goods"></table>

  <div id="editGoods">
    <iframe id="contentbody" src="" width="600" height="500" scrolling="no" frameborder="0"></iframe>
  </div>
</div>

<div id="addDiv">
  <table>
    <tr>
      <td>商品名称：</td>
      <td><input id="caption" name="" /></td>
    </tr>
    <tr>
      <td>商品售价：</td>
      <td><input id="price" name="price" /></td>
    </tr>
    <tr>
      <td>商品旧价：</td>
      <td>
        <input id="oldprice" name="oldprice" />
      </td>
    </tr>
    <tr>
      <td>商品库存：</td>
      <td>
        <input id="stock" name="stock"/>
      </td>
    </tr>
    <tr>
      <td>商品状态：</td>
      <td>
        <input id="status" name="status"/>
      </td>
    </tr>
    <tr>
      <td>商品描述：</td>
      <td>
        <input id="description" name="description"/>
      </td>
    </tr>
    <tr>
      <td>点赞数：</td>
      <td>
        <input id="praisenum" name="praisenum"/>
      </td>
    </tr>
    <tr>
      <td>创建时间：</td>
      <td>
        <input id="cretetime" name="createtime"/>
      </td>
    </tr>
    <tr>
      <td>修改时间：</td>
      <td>
        <input id="updatetime" name="updatetime"/>
      </td>
    </tr>
    <tr>
      <td  valign="top">商品图片:</td>
      <td align="right">
        <form id="uploadgoodspic" action="uploadgoodspic" method="post" enctype="multipart/form-data">
          <label id="file_pic">
            <input type="file" id="fs" name="fs" style="display: none;" />
            <img src="" width="400" height="150" >
          </label>
        </form>
      </td>
    </tr>
  </table>
</div>


<jsp:include page="common/foot.jsp"></jsp:include>
