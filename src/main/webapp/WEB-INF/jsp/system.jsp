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
    $('#system').datagrid({
      title:'系统设置'
    }

    $.extend($.fn.validatebox.defaults.rules, {
      /*必须和某个字段相等*/
      equalTo: {
        validator:function(value,param){
          return $(param[0]).val() == value;
        },
        message:'字段不匹配'
      }
    });


//修改密码保存
    function AdminCPwdSave() {
      $('#admincha_form').form('submit', {
        success: function (data) {

          var rt = jQuery.parseJSON(data);
          if (rt.Success) {
            $.messager.alert("保存成功", rt.Msg, "", function () {
              location.href = $("#btn_Logout").attr("href");
              $("#cPwdDlg").dialog("destroy");

            });
          }
          else {
            var msg = "";
            if (rt.MsgLsit != undefined) {
              $.each(rt.MsgLsit, function (i, val) {
                msg += "<li>" + i + ":" + val + "</li>";
              });
            }
            if (msg != "") msg = rt.Msg + "<br /> <p> 原因如下：" + "<ul>" + msg + "</ul></p>";
            else msg = rt.Msg;
            $.messager.alert("保存失败", msg, "error");
          }
        }
      });
    }
  })
</script>

<div data-options="region:'center',title:'系统设置'" style="padding:5px;">
  <div id="content" region="center" split="true" style="padding:5px;">
    <table id="system"></table>
    <div>
      <table>
        <tr>
          <td>管理员编号</td>
          <td></td>
        </tr>
        <tr>
          <td>管理员名称</td>
          <td></td>
        </tr>
      </table>
    </div>
    <div>
      <a  value="提交" class="easyui-linkbutton" onclick="ShowChangePwdDlg()">修改密码</a>
    </div>


  </div>
</div>

<%--
<!--创建修改密码窗口-->
<div id="div_pwd"&lt;%&ndash; title="修改密码" style="width: 400px;height: 250px;" data-options="collapsible:false,minimizable:false,maximizable:false,closed:true,modal:true"&ndash;%&gt;>
  <table>
    <tr>
      <td>原有密码:</td>
      <td>
        <input type="password" />
      </td>
    </tr>
    <tr>
      <td>新密码:</td>
      <td>
        <input type="password" />
      </td>
    </tr>
    <tr>
      <td>确认密码:</td>
      <td>
        <input type="password" />
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <a id="btnCon" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'">确认修改</a> &nbsp;&nbsp;&nbsp;&nbsp;
        <a id="btnCan" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
      </td>
    </tr>
  </table>
</div>
--%>

<div id="changepwd">
  <table>
    <tr>
      <td>旧密码：</td>
      <td><input id="pwd" name="password"/></td>
    </tr>
    <tr>
      <td>新密码：</td>
      <td><input id="password" name="password" validType="length[4,32]" class="easyui-validatebox" required="true" type="password" value=""/></td>
    </tr>
    <tr>
      <td>确认密码：</td>
      <td><input type="password" name="repassword" id="repassword" required="true" class="easyui-validatebox"  validType="equalTo['#password']" invalidMessage="两次输入密码不匹配"/></td>
    </tr>
  </table>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>
<script>
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
          //让表单提交
          $("#addDiv form").submit();
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
      account: $("#account").val(),
      password: $("#pwd").val()
    }
    $.post("confirmpwd", data, function (data) {
      if(data == "ok"){
        var data2 = {
          account: $("#account").val(),
          password: $("#password").val()
        }
        $.post("updatepwd", data, function (data){
          alert(data);
        })
      }else
          alert("原密码输入错误");
    });
  }
</script>