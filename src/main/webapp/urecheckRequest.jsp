<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>工单处理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%-- 引入layui样式文件--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all"/>
    <script src="layui/layui.js"></script>
</head>
<body>
<div align="center">
    <h1>${urec.operating}工单重新处理</h1>
</div>
<br>
<form class="layui-form" action="/urequestSave" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">工单编号：</label>
        <div class="layui-input-block">
            <input type="text" name="id" value="${urec.id}" required  lay-verify="required" autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称：</label>
        <div class="layui-input-block">
            <input type="text" name="productname" value="${urec.productname}" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属仓库：</label>
        <div class="layui-input-block">
            <input type="text" name="warehousename" value="${urec.warehousename}" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属供应商：</label>
        <div class="layui-input-block">
            <input type="text" name="suppliername" value="${urec.suppliername}" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格：</label>
        <div class="layui-input-block">
            <input type="text" name="price" value="${urec.price}" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数量：</label>
        <div class="layui-input-block">
            <input type="text" name="amount" value="${urec.amount}" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出/入库操作</label>
        <div class="layui-input-block">
            <input type="radio" name="operating" value="入库" title="入库">
            <input type="radio" name="operating" value="出库" title="出库">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类别：</label>
        <div class="layui-input-inline">
            <input type="text" name="intro" value="${urec.intro}" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注：</label>
        <div class="layui-input-inline">
            <input type="text" name="msg" value="${urec.msg}" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div align="left" style="float: left">
            <a class="layui-btn layui-btn-primary" href="${ctx}/urequestList">返回上一页</a>
        </div>
        <div class="layui-input-block" align="center">
            <button class="layui-btn" lay-submit lay-filter="formDemo">重新提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
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
