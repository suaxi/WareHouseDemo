<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>添加库存信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%-- 引入layui样式文件--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all"/>
    <script src="layui/layui.js"></script>
</head>
<body>
<div align="center">
    <h1>添加库存信息</h1>
</div>
<br>
<form class="layui-form" action="/stockUpdate" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">名称：</label>
        <div class="layui-input-block">
            <input type="text" name="name" required  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属仓库：</label>
        <div class="layui-input-block">
            <select name="warehouseid">
                <option selected disabled="disabled">--请选择--</option>
                <c:forEach var="qw" items="${qwName}">
                    <option value="${qw.id}">${qw.warehousename}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属供应商：</label>
        <div class="layui-input-block">
            <select name="supplierid">
                <option selected disabled="disabled">--请选择--</option>
                <c:forEach var="qs" items="${qsName}">
                    <option value="${qs.id}">${qs.suppliername}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格：</label>
        <div class="layui-input-block">
            <input type="text" name="price" required  lay-verify="required" placeholder="请输入价格" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">库存数量：</label>
        <div class="layui-input-block">
            <input type="text" name="amount" required  lay-verify="required" placeholder="请输入库存数量" autocomplete="off" class="layui-input" id="test">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类别：</label>
        <div class="layui-input-block">
            <input type="text" name="sort" required  lay-verify="required" placeholder="请输入类别" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div align="left" style="float: left">
            <a class="layui-btn layui-btn-primary" href="${ctx}/stockList">返回上一页</a>
        </div>
        <div class="layui-input-block" align="center">
            <button class="layui-btn" lay-submit lay-filter="formDemo">确认提交</button>
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
