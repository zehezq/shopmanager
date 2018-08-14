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
        handler: function(){doDelete();}

      }],
      //singleSelect:true,
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
          addGoods();
          //initTable();
          $('#goods').datagrid("reload");
          //关闭对话框，刷新表
     //     $("#addDiv").dialog("close");
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

  function addGoods(){
    if ($("#fs").val() == "") {
      var data = {
        code: $("#code").val(),
        caption: $("#caption").val(),
        price: $("#price").val(),
        oldprice: $("#oldprice").val(),
        stock: $("#stock").val(),
        description: $("#description").val(),
        praisenum: $("#praisenum").val(),
        status: $("input:checked").val()
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
            status: $("input:checked").val(),
            picurl:url
          }
          $.post("insertgoods", data, function (d) {
            alert(d);
          });
        }
      });
    }
  }

  //删除用户数据
  function doDelete() {
    //把你选中的 数据查询出来。
    var selectRows = $('#goods').datagrid("getSelections");
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
          id = selectRows[i].goodid;
          $.post("deletegoods", {goodid:id}, function (data) {
            if (data == "ok") {
              //刷新表格，去掉选中状态的 那些行。
              alert("删除成功");
              $('#goods').datagrid("reload");
              $('#goods').datagrid("clearSelections");
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
      <td>商品类别：</td>
      <td><input id="code" name="code" /></td>
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
    <tr>
      <td>商品状态：</td>
      <c:choose>
        <td align="right"><input type="radio" name="status" value="1" />
          在售 |
          <input checked type="radio" name="status" value="0"/>
          下架</td>
      </c:choose>
    </tr>
  </table>
</div>


<jsp:include page="common/foot.jsp"></jsp:include>
