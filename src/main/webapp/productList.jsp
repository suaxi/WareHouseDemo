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
    <title>产品信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<%-- 引入layui样式文件--%>
<link rel="stylesheet" href="layui/css/layui.css"/>
<script src="layui/layui.js"></script>
<body>
<div align="center"><h1>出/入库信息</h1></div>
<table class="layui-table layui-table-grid">
    <tr>
        <td>编号</td>
        <td>名称</td>
        <td>所属仓库</td>
        <td>所属供应商</td>
        <td>价格（元）</td>
        <td>数量（件）</td>
        <td>备注</td>
        <td>状态</td>
        <td>操作时间</td>
        <td>操作</td>
    </tr>
    <c:forEach var="p" items="${product}">
        <tr>
            <td>${p.id}</td>
            <td>${p.productname}</td>
            <td>${p.warehousename}号仓库</td>
            <td>${p.suppliername}号供应商</td>
            <td>${p.price}</td>
            <td>${p.amount}</td>
            <td>${p.intro}</td>
            <td>
                <c:choose>
                    <c:when test="${p.status==1}"><span style="color: green">入库</span></c:when>
                    <c:when test="${p.status==-1}"><span style="color: red">出库</span></c:when>
                </c:choose>
            </td>
            <td><fmt:formatDate value='${p.createtime}' pattern='yyyy-MM-dd HH:mm:ss'></fmt:formatDate></td>
            <td>
                <a class="layui-btn layui-btn-danger" href="${ctx}/deleteProduct?id=${p.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div>
    <div align="left" style="float: left">
        <a class="layui-btn layui-btn-lg layui-btn-primary" href="${ctx}/adminIndex">返回上一页</a>
    </div>
    <div align="right">
        <a href="${ctx}/exportProduct"><button type="button" class="layui-btn layui-btn-lg layui-btn-warm">导出Excel报表</button></a>
    </div>
</div>
<%--引入底部版权--%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
