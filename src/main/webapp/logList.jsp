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
    <title>系统操作日志</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<%-- 引入layui样式文件--%>
<link rel="stylesheet" href="layui/css/layui.css"/>
<script src="layui/layui.js"></script>
<body>
<div align="center"><h1>系统操作日志</h1></div>
<table class="layui-table layui-table-grid">
    <tr>
        <td>编号</td>
        <td>用户名</td>
        <td>操作</td>
        <td>方法描述</td>
        <td>参数</td>
        <td>IP地址</td>
        <td>操作时间</td>
    </tr>
    <c:forEach var="l" items="${logs}">
        <tr>
            <td>${l.id}</td>
            <td>${l.username}</td>
            <td>${l.operation}</td>
            <td>${l.method}</td>
            <td>${l.params}</td>
            <td>${l.ip}</td>
            <td>${l.createtime}</td>
        </tr>
    </c:forEach>
</table>
<div>
    <div align="left" style="float: left">
        <a class="layui-btn layui-btn-primary" href="${ctx}/adminIndex">返回上一页</a>
    </div>
</div>
<%--引入底部版权--%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
