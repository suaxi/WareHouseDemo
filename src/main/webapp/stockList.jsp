<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <title>库存查询</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<%-- 引入layui样式文件--%>
<link rel="stylesheet" href="layui/css/layui.css"/>
<script src="layui/layui.js"></script>
<body>
<div align="center"><h1>库存查询</h1></div>
<table class="layui-table layui-table-grid">
    <tr>
        <td>编号</td>
        <td>产品名称</td>
        <td>所属仓库</td>
        <td>所属供应商</td>
        <td>价格</td>
        <td>数量</td>
        <td>类别</td>
        <td>操作</td>
    </tr>
    <c:forEach var="q" items="${qStock}">
        <tr>
            <td>${q.id}</td>
            <td>${q.name}</td>
            <td>${q.warehouseid}号仓库</td>
            <td>${q.supplierid}号供应商</td>
            <td>${q.price}</td>
            <td>${q.amount}</td>
            <td>${q.sort}</td>
            <td>
                <a class="layui-btn layui-btn-warm" href="${ctx}/stockEdit?id=${q.id}">修改</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div>
    <div align="left" style="float: left">
        <a class="layui-btn layui-btn-lg layui-btn-primary" href="${ctx}/adminIndex">返回上一页</a>
    </div>
    <div align="center">
        <a class="layui-btn layui-btn-lg layui-btn-normal" href="${ctx}/stockAdd">添加库存信息</a>
    </div>
    <div align="right">
        <a href="${ctx}/exportStock"><button type="button" class="layui-btn layui-btn-warm">导出Excel报表</button></a>
    </div>
</div>
<%--引入底部版权--%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
