<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    $.extend($.fn.validatebox.defaults.rules, {
      /*必须和某个字段相等*/
      equalTo: {
        validator:function(value,param){
          return $(param[0]).val() == value;
        },
        message:'字段不匹配'
      }
    });
  })
</script>

<div data-options="region:'center',title:'系统设置'" style="padding:5px;">
  <div id="content" region="center" split="true" style="padding:5px;">
    <table id="system"></table>
   <%-- <div>
      <table>
        <tr>
          <td>管理员编号</td>
          <td><input style="border: 0px;outline:none;cursor: pointer;" id="account"></td>
        </tr>
        <tr>
          <td>管理员名称</td>
          <td><input style="border: 0px;outline:none;cursor: pointer;" type="text" ></td>
        </tr>
      </table>
    </div>--%>
    <div>
      <a  value="" class="easyui-linkbutton" onclick="ShowChangePwdDlg()">修改密码</a>
    </div>
    <div>
      <a  value="" class="easyui-linkbutton" onclick="confirmexit()">退出系统</a>
    </div>


  </div>
</div>

<div id="changepwd">
  <table>
    <tr>
      <td>旧密码：</td>
      <td><input id="oldpwd" name="oldpwd" type="password"/></td>
    </tr>
    <tr>
      <td>新密码：</td>
      <td><input id="newpwd" name="newpwd" validType="length[4,32]" class="easyui-validatebox" required="true" type="password" value=""/></td>
    </tr>
    <tr>
      <td>确认密码：</td>
      <td><input type="password" name="pwd" id="pwd" required="true" class="easyui-validatebox"  validType="equalTo['#newpwd']" invalidMessage="两次输入密码不匹配"/></td>
    </tr>
  </table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>
<script>

  <%request.setCharacterEncoding("utf-8");%>
  //显示修改密码窗口
  function ShowChangePwdDlg(){
    $("#changepwd").css("display", "block");
    $("#changepwd").dialog({
      width: 400,
      height: 300,
      modal: true,
      title: "修改密码",
      collapsible: true,
      minimizable: true,
      maximizable: true,
      resizable: true,
      buttons: [{
        id: 'btnConfirm',
        text: '确认',
        iconCls: 'icon-ok',
        handler: function () {
          confirmpwd();
          $("#div_pwd").dialog("close");
        }
      }, {
        id: 'btnCancelAdd',
        text: '取消',
        iconCls: 'icon-cancel',
        handler: function () {
          $("#div_pwd").dialog("close");
        }
      }]
    });
  }

  function confirmpwd(){
    var data = {
      password: $("#oldpwd").val()
    }
    alert($("#oldpwd").val())
    $.post("confirmpwd", {password: $("#oldpwd").val()}, function (data) {
      if(data == "ok"){
        var data2 = {
          password: $("#pwd").val()
        }
        $.post("updatepwd", {password: $("#pwd").val()}, function (d){
          if(d == 1)
            alert("修改密码成功！");
          else
            alert("修改密码失败！");
        })
      }else
          alert("原密码输入错误！");
    });
  }

  function confirmexit(){
    $.messager.confirm("确认消息", "您确定要退出系统吗？", function (r) {
      if (r) {
        self.location='http://localhost:8080/page_login1';
      }
    })
  }
</script>