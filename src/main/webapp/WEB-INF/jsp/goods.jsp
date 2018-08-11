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
        handler: function(){alert('增加按钮')}
      },'-',{
        iconCls: 'icon-remove',
        text:'删除',
        handler: function(){alert('删除按钮')}

      }],
      singleSelect:true,
      columns:[[
        {field:'goodid',title:'商品编号',width:100,align:'center',checkbox:"true"},
        {field:'caption',title:'商品名称',width:100,align:'center'},
        {field:'picurl',title:'图片链接',width:100,align:'center'},
        {field:'price',title:'售价',width:70,align:'center'},
        {field:'oldprice',title:'旧价',width:70,align:'center'},
        {field:'stock',title:'库存',width:70,align:'center'},
        {field:'status',title:'状态',width:70,align:'center',formatter:
                function(v,r,i){
                  if(v==1)
                    return "启用";
                  else
                    return "禁用";
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
      width:680,
      height:400,
      title:"编辑商品",
      modal:true,
      fit:"true"
    })
    $("#contentbody").attr("src","goodsbyid?id="+id)
  }
</script>
<div id="content" region="center" split="true" style="padding:5px;">
  <table id="goods">

  </table>
  <div id="editGoods">
    <iframe id="contentbody" src="" width="680" height="400" scrolling="no" frameborder="0"></iframe>
  </div>

</div>

<jsp:include page="common/foot.jsp"></jsp:include>
