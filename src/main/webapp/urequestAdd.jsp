<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>提交工单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%-- 引入layui样式文件--%>
    <link rel="stylesheet" href="layui/css/layui.css" charset="utf-8" media="all"/>
    <script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="layui/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div align="center">
    <h1>提交工单</h1>
</div>
<br>
<form class="layui-form" action="/urequestSave" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">名称：</label>
        <div class="layui-input-block">
            <select name="productname">
                <option selected disabled="disabled">--请选择--</option>
                <c:forEach var="qstock" items="${qstockName}">
                    <option value="${qstock.name}">${qstock.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">仓库：</label>
        <div class="layui-input-block">
            <select name="warehousename">
                <option selected disabled="disabled">--请选择--</option>
                <c:forEach var="qw" items="${qwName}">
                    <option value="${qw.warehousename}">${qw.warehousename}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">供应商：</label>
        <div class="layui-input-block">
            <select name="suppliername">
                <option selected disabled="disabled">--请选择--</option>
                <c:forEach var="qs" items="${qsName}">
                    <option value="${qs.suppliername}">${qs.suppliername}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格：</label>
        <div class="layui-input-inline">
            <input type="text" name="price" required lay-verify="required" placeholder="请输入价格" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">单位：元</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数量：</label>
        <div class="layui-input-inline">
            <input type="text" name="amount" required lay-verify="required|check" placeholder="请输入数量" autocomplete="off" class="layui-input" onclick="check()">
        </div>
        <div class="layui-form-mid layui-word-aux">剩余库存：9999件</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出/入库操作</label>
        <div class="layui-input-block">
            <input type="radio" name="operating" value="入库" title="入库" checked="">
            <input type="radio" name="operating" value="出库" title="出库">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类别：</label>
        <div class="layui-input-block">
            <input type="text" name="intro" lay-verify="required" placeholder="请输入类别" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注：</label>
        <div class="layui-input-inline">
            <input type="text" name="msg" lay-verify="required" placeholder="请输入备注" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">如：其他需求说明</div>
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

&nbsp;&nbsp;&nbsp;&nbsp;<h2>提交工单时可选择库存中对应的商品，如需其他商品，请至信息反馈栏填写相应的信息，待仓库管理员审核后添加！</h2>
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
