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
    <title>工单信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<%-- 引入layui样式文件--%>
<link rel="stylesheet" href="layui/css/layui.css"/>
<script src="layui/layui.js"></script>
<body>
<br>
<div align="center"><h1>工单信息</h1></div>
<br>
<table class="layui-table layui-table-grid">
    <tr>
        <td>编号</td>
        <td>名称</td>
        <td>所属仓库</td>
        <td>所属供应商</td>
        <td>价格（元）</td>
        <td>数量（件）</td>
        <td>出/入库</td>
        <td>类别</td>
        <td>备注</td>
        <td>提交时间</td>
        <td>状态</td>
        <td>处理时间</td>
        <td>工单状态</td>
        <td>操作</td>
    </tr>
    <c:forEach var="r" items="${request}">
        <tr>
            <td>${r.id}</td>
            <td>${r.productname}</td>
            <td>${r.warehousename}</td>
            <td>${r.suppliername}</td>
            <td>${r.price}</td>
            <td>${r.amount}</td>
            <td>${r.operating}</td>
            <td>${r.intro}</td>
            <td>${r.msg}</td>
            <td><fmt:formatDate value='${r.createtime}' pattern='yyyy-MM-dd HH:mm:ss'></fmt:formatDate></td>
            <td>
                <c:choose>
                    <c:when test="${r.status==null}"><span style="color: red;font-weight: bold">未处理</span></c:when>
                    <c:when test="${r.status==0}"><span style="color: green;font-weight: bold">处理中</span></c:when>
                    <c:when test="${r.status==1}"><span style="color: green;font-weight: bold">已处理</span></c:when>
                    <c:when test="${r.status==-1}"><span style="color: red;font-weight: bold">审核未通过！</span></c:when>
                    <c:when test="${r.status==2}"><span style="color: deepskyblue;font-weight: bold">撤销</span></c:when>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${r.status!=null}"><fmt:formatDate value='${r.dealtime}' pattern='yyyy-MM-dd HH:mm:ss'></fmt:formatDate></c:when>
                    <c:when test="${r.status==null}">未处理</c:when>
                </c:choose>
            </td>
            <td>
                <c:choose>
                <c:when test="${r.statuscheck==null}"><span style="font-weight: bold">未操作</span></c:when>
                <c:when test="${r.statuscheck==1}"><span style="color: green;font-weight: bold">已完成</span></c:when>
                <c:when test="${r.status==-2}"><span style="color: deepskyblue">管理员撤销操作</span></c:when>
                </c:choose>
            </td>
            <td>
                <a class="layui-btn" href="${ctx}/requestDeal?id=${r.id}">处理</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div>
    <div align="left" style="float: left">
        <a class="layui-btn layui-btn-lg layui-btn-primary" href="${ctx}/adminIndex">返回上一页</a>
    </div>
    <div align="right">
        <a href="${ctx}/exportRequest"><button type="button" class="layui-btn layui-btn-lg layui-btn-warm">导出Excel报表</button></a>
    </div>
</div>
<%--引入底部版权--%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
