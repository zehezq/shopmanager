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
</head>
<body>
<fieldset class="title">
    <legend>文章管理</legend>
    <table width="544"  align="center" cellpadding="3" cellspacing="3">
        <tr>
            <td width="87" align="right">文章编号:</td>
            <td width="421" align="right"><input id="articleid" type="text" value="${tbArticle.articleid}" /></td>
        </tr>
        <tr>
            <td align="right">文章标题:</td>
            <td align="right"><input type="text" id="title" value="${tbArticle.title}" /></td>
        </tr>
        <tr>
            <td align="right" valign="top">文章内容:</td>
            <td align="right">
                <form action="uploaddire" id="uploaddire"  method="post" enctype="multipart/form-data">
                    <label id="file_pic">
                    <input type="file" name="fs" id="fs" style="height: 100px;" value="${tbArticle.content}" />
                    </label>
                </form>
            </td>
        </tr>
        <tr>
            <td align="right">图片地址:</td>
            <td align="right"><input type="text" id="picurl" value="${tbArticle.picurl}" /></td>
        </tr>
        <tr>
            <td width="87" align="right">阅读量:</td>
            <td width="421" align="right"><input type="text" id="readcount" value="${tbArticle.readcount}" /></td>
        </tr>
        <tr>
            <td align="right">创建时间:</td>
            <td align="right"><input type="text" id="createtime" value="${tbArticle.createtime}" /></td>
        </tr>
        <tr>
            <td align="right">修改时间:</td>
            <td align="right"><input type="text" id="updatetime" value="${tbArticle.updatetime}" /></td>
        </tr>
        <tr>
            <td height="50">&nbsp;</td>
            <td align="right" valign="bottom"><a  value="提交" class="easyui-linkbutton" onclick="saveedit()">编辑</a></td>
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
            showImg.getElementsByTagName("img")[0].src=this.result ;
        }
    }

    function saveedit(){
        if($("#fs").val()==""){
            var data={articleid:$("#articleid").val(),title:$("#title").val(),picurl:$("#picurl").val(),readcount:$("#readcount").val(),createtime:$("#createtime").val(),updatetime:$("#updatetime").val()}
            $.post("updatearticle",data,function(d){
                alert(d)
            })
        }else{
            $("#uploaddire").ajaxSubmit({
                success:function(url){
                    var data={articleid:$("#articleid").val(),title:$("#title").val(),picurl:$("#picurl").val(),readcount:$("#readcount").val(),createtime:$("#createtime").val(),updatetime:$("#updatetime").val(),content:url}
                    $.post("updatearticle",data,function(d){
                        alert(d)
                    })
                }
            })
        }
    }
</script>
</body>

</html>