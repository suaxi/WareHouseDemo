<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>修改仓库信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%-- 引入layui样式文件--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all"/>
    <script src="layui/layui.js"></script>
</head>
<body>
<div align="center">
    <h1>修改仓库信息</h1>
</div>
<br>
<form class="layui-form" action="/wareHouseUpdate" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">仓库编号：</label>
        <div class="layui-input-block">
            <input type="text" name="id" value="${whEdit.id}" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">照片：</label>
        <div class="layui-input-block">
            <input type="text" name="photo" value="${whEdit.photo}" required  lay-verify="required"  autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">仓库名称：</label>
        <div class="layui-input-block">
            <input type="text" name="warehousename" value="${whEdit.warehousename}" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数量：</label>
        <div class="layui-input-block">
            <input type="text" name="amount" value="${whEdit.amount}" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注：</label>
        <div class="layui-input-inline">
            <input type="text" name="intro" value="${whEdit.intro}" required lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建时间：</label>
        <div class="layui-input-block">
            <input type="text" name="createtime" value="${whEdit.createtime}" required  lay-verify="required"  autocomplete="off" class="layui-input" id="test">
        </div>
    </div>
    <div class="layui-form-item">
        <div align="left" style="float: left">
            <a class="layui-btn layui-btn-primary" href="${ctx}/wareHouseList">返回上一页</a>
        </div>
        <div class="layui-input-block" align="center">
            <button class="layui-btn" lay-submit lay-filter="formDemo">确认提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    //Demo
    layui.use(['form','laydate'], function(){
        var form = layui.form;
        var laydate=layui.laydate;

            laydate.render({
                elem: '#test' //指定元素
                ,trigger:'click'
                ,type:'datetime'
            });
    });
</script>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
