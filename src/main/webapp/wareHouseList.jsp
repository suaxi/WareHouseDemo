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
    <title>仓库信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<%-- 引入layui样式文件--%>
<link rel="stylesheet" href="layui/css/layui.css"/>
<script src="layui/layui.js"></script>
<body>
<div align="center"><h1>仓库信息</h1></div>
<table class="layui-table layui-table-grid">
    <tr>
        <td>编号</td>
        <td>仓库名称</td>
        <td>照片</td>
        <td>数量</td>
        <td>备注</td>
        <td>创建时间</td>
        <td>操作</td>
    </tr>
    <c:forEach var="w" items="${wareHouse}">
        <tr>
            <td>${w.id}</td>
            <td>${w.warehousename}</td>
            <td><img src="${w.photo}"></td>
            <td>${w.amount}</td>
            <td>${w.intro}</td>
            <td><fmt:formatDate value='${w.createtime}' pattern='yyyy-MM-dd'></fmt:formatDate></td>
            <td><a class="layui-btn layui-btn-warm" href="/wareHouseEdit?id=${w.id}">修改</a>
                <a class="layui-btn layui-btn-danger" href="/wareHouseDelete?id=${w.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div>
    <div align="left" style="float: left">
        <a class="layui-btn layui-btn-lg layui-btn-primary" href="${ctx}/adminIndex">返回上一页</a>
    </div>
    <div align="center">
        <a class="layui-btn layui-btn-lg layui-btn-normal" href="${ctx}/wareHouseAdd.jsp">添加仓库</a>
    </div>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>仓库信息概要：</legend>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        1号仓库：大宗物品
    </span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        2号仓库：工业用品
    </span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        3号仓库：五金工具
    </span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        4号仓库：普通家用物品
    </span>
</fieldset>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
