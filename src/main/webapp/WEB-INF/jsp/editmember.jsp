<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电商管理平台</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <script type="text/javascript" src="easyui/js/ajaxform.js"></script>
    <script type="text/javascript" src="easyui/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
    <style type="text/css">
        <!--
        .title {
            border:1px solid #95b8e7;
            font-family:微软雅黑;
            font-size:12px;
            width:500px;
            height:300px;
            margin-top: 0px;
            margin-right: auto;
            margin-bottom: 0px;
            margin-left: auto;
            text-align: center;
        }
        input[type='text']{
            border:1px solid #95b8e7;
            font-family:微软雅黑;
            width:400px;
        }
        body,table,tr,td{font-family:微软雅黑;font-size:12px; border:0px solid red}
        *{ margin:0px; padding:0px;}
        -->
    </style>

    <script>

    </script>
</head>
<body>
<fieldset class="title">
    <legend>会员管理</legend>
    <table width="544"  align="center" cellpadding="3" cellspacing="3">
        <tr>
            <td width="87" align="right" >用户编号:</td>
            <td width="421" align="right">
                <input id="userid" type="text" value="${tbUser.userid}" /></td>
        </tr>
        <tr>
            <td align="right">用户名字:</td>
            <td align="right">
                <input type="text" id="username" value="${tbUser.username}" /></td>
        </tr>
        <tr>
            <td align="right">手机号码:</td>
            <td align="right">
                <input type="text" id="phone" value="${tbUser.phone}" /></td>
        </tr>
        <tr>
            <td align="right" valign="top">用户头像:</td>
            <td align="right">
                <form action="uploadimage" id="uploadimage"  method="post" enctype="multipart/form-data">
                <label id="file_pic">
                    <input type="file" name="fs" id="fs" style="display: none;" />
                    <img src="${tbUser.userpicture}" width="400" height="150" >
                </label>
                </form>
            </td>

        </tr>
        <tr>
            <td align="right">创建时间</td>
            <td align="right">
                <input type="text" id="createtime" name="" value="${tbUser.createtime}" /></td>
        </tr>
        <tr>
            <td height="50">&nbsp;</td>
            <td align="right" valign="bottom">
                <a id="edit" class="easyui-linkbutton" onclick="saveedit()">编辑</a></td>
        </tr>
    </table>
</fieldset>
<script>

    var showImg = document.querySelector("#file_pic");
    var getImg = document.querySelector("input[type='file']");
    if(typeof FileReader==='undefined'){
        showImg.innerHTML = "抱歉，你的浏览器不支持!";
        getImg.setAttribute('disabled','disabled');
    }else{
        getImg.addEventListener('change',readFile,false);
    }
    function readFile(){
        var file = this.files[0];
        if(!/image\/\w+/.test(file.type)){
            alert("请上传图片！");
            return false;
        }
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){
            showImg.getElementsByTagName("img")[0].src=this.result;
        }
    }

    function saveedit(){
        if($("#fs").val()==""){
            var data={userid:$("#userid").val(),username:$("#username").val(),phone:$("#phone").val(),createtime:$("#createtime").val()}
            $.post("saveupdatedata",data,function(d){
                alert(d)
            })
        }else{
            $("#uploadimage").ajaxSubmit({
                success:function(url){
                    var data={userid:$("#userid").val(),username:$("#username").val(),phone:$("#phone").val(),userpicture:url,createtime:$("#createtime").val()}
                    $.post("saveupdatedata",data,function(d){
                        alert(d)
                    })
                }
            })
        }
    }

</script>
</body>

</html>