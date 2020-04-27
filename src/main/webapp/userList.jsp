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
    <title>员工信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<%-- 引入layui样式文件--%>
<link rel="stylesheet" href="layui/css/layui.css"/>
<script src="layui/layui.js"></script>
<body>
<div align="center"><h1>员工信息</h1></div>
    <table class="layui-table layui-table-grid">
    <tr>
        <td>编号</td>
        <td>头像</td>
        <td>姓名</td>
        <td>性别</td>
        <td>身份证</td>
        <td>电话</td>
        <td>地址</td>
        <td>密码</td>
        <td>备注</td>
        <td>入职时间</td>
        <td>操作</td>
    </tr>
    <c:forEach var="u" items="${users}">
        <tr>
            <td>${u.id}</td>
            <td><img src="${u.photo}"></td>
            <td>${u.username}</td>
            <td>${u.sex}</td>
            <td>${u.idnumber}</td>
            <td>${u.phone}</td>
            <td>${u.address}</td>
            <td>${u.password}</td>
            <td>${u.intro}</td>
            <td><fmt:formatDate value='${u.entrytime}' pattern='yyyy-MM-dd'></fmt:formatDate></td>
            <td><a class="layui-btn layui-btn-warm" href="${ctx}/userEdit?id=${u.id}">修改</a>
                <a class="layui-btn layui-btn-danger" href="${ctx}/userDelete?id=${u.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div>
    <div align="left" style="float: left">
        <a class="layui-btn layui-btn-lg layui-btn-primary" href="${ctx}/adminIndex">返回上一页</a>
    </div>
    <div align="center">
        <a class="layui-btn layui-btn-lg layui-btn-normal" href="${ctx}/userAdd.jsp">添加员工</a>
    </div>
</div>
<%--引入底部版权--%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
