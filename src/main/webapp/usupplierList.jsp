<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: Suaxi
  Date: 2020/1/8
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>供应商信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<%-- 引入layui样式文件--%>
<link rel="stylesheet" href="layui/css/layui.css"/>
<script src="layui/layui.js"></script>
<body>
<div align="center"><h1>供应商信息</h1></div>
<table class="layui-table layui-table-grid">
    <tr>
        <td>编号</td>
        <td>供应商名称</td>
        <td>联系人</td>
        <td>电话</td>
        <td>备注</td>
    </tr>
    <c:forEach var="us" items="${usupplier}">
        <tr>
            <td>${us.id}</td>
            <td>${us.suppliername}</td>
            <td>${us.supplier}</td>
            <td>${us.phone}</td>
            <td>${us.intro}</td>
        </tr>
    </c:forEach>
</table>
<div align="left" style="float: left">
    <a class="layui-btn layui-btn-lg layui-btn-primary" href="${ctx}/userIndex">返回上一页</a>
</div>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
