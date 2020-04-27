<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>出库操作</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%-- 引入layui样式文件--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all"/>
    <script src="layui/layui.js"></script>
</head>
<body>
<div align="center">
    <h1>出库操作</h1>
</div>
<br>
<form class="layui-form" action="/uproductSave1" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">编号：</label>
        <div class="layui-input-block">
            <input type="text" name="id" value="${uout.id}" required  lay-verify="required" autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">货品名称：</label>
        <div class="layui-input-block">
            <input type="text" name="productname" value="${uout.productname}" required  lay-verify="required" autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属仓库：</label>
        <div class="layui-input-block">
            <input type="text" name="warehousename" value="${uout.warehousename}" required  lay-verify="required" autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属供应商：</label>
        <div class="layui-input-block">
            <input type="text" name="suppliername" value="${uout.suppliername}" required  lay-verify="required" autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格：</label>
        <div class="layui-input-inline">
            <input type="text" name="price" value="${uout.price}" required  lay-verify="required" autocomplete="off" class="layui-input" readonly="true">
        </div>
        <div class="layui-form-mid layui-word-aux">单位：元</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数量：</label>
        <div class="layui-input-inline">
            <input type="text" name="amount" value="${uout.amount}" required  lay-verify="required" autocomplete="off" class="layui-input" readonly="true">
        </div>
        <div class="layui-form-mid layui-word-aux">单位：件</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类别：</label>
        <div class="layui-input-block">
            <input type="text" name="intro" value="${uout.intro}" required lay-verify="required" autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">工单状态：</label>
        <div class="layui-input-block">
            <input type="radio" name="status" value="-1" title="出库" checked>
        </div>
    </div>
    <div class="layui-form-item">
        <div align="left" style="float: left">
            <a class="layui-btn layui-btn-primary" href="${ctx}/urequestList">返回上一页</a>
        </div>
        <div class="layui-input-block" align="center">
            <button class="layui-btn" lay-submit lay-filter="formDemo">确认提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<fieldset class="layui-elem-field layui-field-title">
    <legend>注意：</legend>
</fieldset>

&nbsp;&nbsp;&nbsp;&nbsp;出库操所提交的内容为审核通过后的工单信息，该界面内容不可编辑，如有其他需求，可填写备注
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

    });
</script>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
