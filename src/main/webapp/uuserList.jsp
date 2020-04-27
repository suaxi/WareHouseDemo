<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: Suaxi
  Date: 2019/12/17
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户中心</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--  引入layui的默认样式-->
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <!--  引入layui的拓展样式-->
    <link rel="stylesheet" href="layui/static/style/admin.css" media="all">
    <link rel="stylesheet" href="layui/static/style/template.css" media="all">
    <!--引入layui的js文件-->
    <script src="layui/layui.js"></script>
</head>
<body>
<div align="center"><h1>用户中心</h1></div>
<div class="layui-fluid layadmin-maillist-fluid">
    <div class="layui-row layui-col-space15">
        <c:forEach var="u" items="${uuserinfo}">
            <div class="layui-col-md4 layui-col-sm6">
                <div class="layadmin-contact-box" >
                    <div class="layui-col-md4 layui-col-sm6">
                        <a href="javascript:;">
                            <div class="layadmin-text-center">
                                <img src="${u.photo}">
                                <div class="layadmin-maillist-img layadmin-font-blod">${u.intro}</div>
                            </div>
                        </a>
                    </div>

                    <div class="layui-col-md8 layadmin-padding-left20 layui-col-sm6">
                        <a href="javascript:;">
                            <h3 class="layadmin-title">
                                <strong>${u.username}</strong>
                            </h3>
                            <p class="layadmin-textimg">
                                <i class="layui-icon layui-icon-location"></i>
                                ${u.address}
                            </p>
                        </a>
                        <div class="layadmin-address">
                            <a href="javascript:;">
                                <strong>简介：</strong>
                                <br>
                                性别: ${u.sex}
                                <br>
                                <addr title="phone">Tel:</addr>
                                    ${u.phone}
                                <br>
                                入职时间：<fmt:formatDate value='${u.entrytime}' pattern='yyyy-MM-dd'></fmt:formatDate>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div align="left" style="float: left">
    <a class="layui-btn layui-btn-primary" href="${ctx}/userIndex">返回上一页</a>
</div>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>

