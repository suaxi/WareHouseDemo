<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: Suaxi
  Date: 2020/1/7
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>仓库出入库管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--  引入layui的默认样式-->
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <!--引入layui的js文件-->
    <script src="layui/layui.js"></script>
</head>
<body>
<br>
<br>
<h1 align="center" style="font-size: 36px">仓库出入库管理系统</h1>
<br>
<jsp:include page="banner.jsp"></jsp:include>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>
            <c:if test="${!empty user}">
                <span>管理员：${user.username}</span>
            </c:if>
            &nbsp;&nbsp;<a href="${ctx}/quit">退出</a>
        </legend>
    </fieldset>

    <c:choose>
        <c:when test="${count!=0}"><a href="${ctx}/requestList">&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-notice">提醒：您有${count}条工单消息未处理！</i></a></c:when>
    </c:choose>
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li style="font-size: 19px">仓库管理</li>
            <li style="font-size: 19px">供应商管理</li>
            <li style="font-size: 19px">库存管理</li>
            <li style="font-size: 19px">出/入库明细</li>
            <li style="font-size: 19px">工单管理<span class="layui-badge">${count}</span></li>
            <li style="font-size: 19px">用户管理</li>
            <li style="font-size: 19px">信息反馈管理</li>
            <li style="font-size: 19px">系统日志</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <a href="${ctx}/wareHouseList"><button type="button" class="layui-btn">仓库信息</button></a>
                <br><br><a href="${ctx}/wareHouseAdd.jsp"><button type="button" class="layui-btn layui-btn-normal">添加仓库</button></a>
            </div>
            <div class="layui-tab-item">
                <a href="${ctx}/supplierList"><button type="button" class="layui-btn layui-btn-normal">供应商信息</button></a>
                <br><br><a href="${ctx}/supplierAdd.jsp"><button type="button" class="layui-btn layui-btn-warm">添加供应商</button></a>
            </div>
            <div class="layui-tab-item">
                <a href="${ctx}/stockList"><button type="button" class="layui-btn layui-btn-warm">库存查询</button></a>
            </div>
            <div class="layui-tab-item">
                <a href="${ctx}/productList"><button type="button" class="layui-btn layui-btn-normal">查看出/入库信息</button></a>
            </div>
            <div class="layui-tab-item">
                <a href="${ctx}/requestList"><button type="button" class="layui-btn layui-btn-danger">工单信息</button></a>
            </div>
            <div class="layui-tab-item">
                <a href="${ctx}/userList"><button type="button" class="layui-btn layui-btn-warm">员工信息</button></a>
                <br><br><a href="${ctx}/userAdd.jsp"><button type="button" class="layui-btn layui-btn-warm">添加员工</button></a>
            </div>
            <div class="layui-tab-item">
                <a href="${ctx}/msgList"><button type="button" class="layui-btn layui-btn-normal">建议反馈</button></a>
            </div>
            <div class="layui-tab-item">
                <a href="${ctx}/logList"><button type="button" class="layui-btn layui-btn-normal">系统日志</button></a>
            </div>
        </div>
    </div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>管理员操作指南：</legend>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        1.对仓库、供应商、库存、出/入库等信息进行管理</span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        2.工单管理：员工提交工单→管理员审核→出/入库操作</span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        3.管理用户信息</span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        4.查看建议反馈</span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        5.管理系统后台日志</span>
</fieldset>
<script>
    layui.use('element', function() {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    });
</script>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
