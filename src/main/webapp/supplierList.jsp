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
        <td>操作</td>
    </tr>
    <c:forEach var="s" items="${supplier}">
        <tr>
            <td>${s.id}</td>
            <td>${s.suppliername}</td>
            <td>${s.supplier}</td>
            <td>${s.phone}</td>
            <td>${s.intro}</td>
            <td><a class="layui-btn layui-btn-warm" href="${ctx}/supplierEdit?id=${s.id}">修改</a>
                <a class="layui-btn layui-btn-danger" href="${ctx}/supplierDelete?id=${s.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div>
    <div align="left" style="float: left">
        <a class="layui-btn layui-btn-lg layui-btn-primary" href="${ctx}/adminIndex">返回上一页</a>
    </div>
    <div align="center">
        <a class="layui-btn layui-btn-lg layui-btn-normal" href="${ctx}/supplierAdd.jsp">添加供应商</a>
    </div>
</div>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
