<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: Suaxi
  Date: 2019/12/24
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息反馈详情</title>
    <meta charset="UTF-8">
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
<div class="layui-container">
    <h1 style="text-align: center;">信息反馈详情</h1>
    <div style="height: 50px;"></div>
    <div class="layui-fluid layadmin-message-fluid">
        <div class="layui-row">
            <div class="layui-col-md12">
                <form class="layui-form" action="#" method="post">
                    <div class="layui-form-item layui-form-text">
                        <div class="layui-input-block">
                            <textarea type="text" name="content" placeholder="管理员端功能开发中，敬请期待！" class="layui-textarea"></textarea>
                        </div>
                    </div>

                    <div class="layui-form-item" style="overflow: hidden;">
                        <div class="layui-input-block layui-input-right">
                            <button class="layui-btn" lay-submit lay-filter="formDemo">发表</button>
                        </div>
                        <div class="layadmin-messag-icon">
                            <a href="javascript:;"><i class="layui-icon layui-icon-face-smile-b"></i></a>
                            <a href="javascript:;"><i class="layui-icon layui-icon-picture"></i></a>
                            <a href="javascript:;"><i class="layui-icon layui-icon-link"></i></a>
                        </div>
                    </div>
                </form>
            </div>
            <div class="layui-col-md12 layadmin-homepage-list-imgtxt message-content">
                <c:forEach var="m" items="${msg}">
                    <div class="media-body">
                        <a href="javascript:;" class="media-left" style="float: left;">
                            <img src="layui/images/head.jpg" height="46px" width="46px">
                        </a>
                        <div class="pad-btm">
                            <p class="fontColor"><a href="javascript:;">第${m.id}条</a></p>
                            <p class="min-font">
              <span>
                <a href="javascript:;" class="layui-icon layui-icon-cellphone"></a>
                <a href="javascript:;">iphone客户端</a>
                <a href="javascript:;">11分钟前</a>
                <fmt:formatDate value='${m.createtime}' pattern='yyyy-MM-dd HH:mm:ss'></fmt:formatDate>
              </span>
                            </p>
                        </div>
                        <p class="message-text">${m.msg}</p>
                    </div>
                </c:forEach>
                <div align="left" style="float: left">
                    <a class="layui-btn layui-btn-primary" href="${ctx}/adminIndex">返回上一页</a>
                </div>
                <div class="layui-row message-content-btn">
                    <a href="javascript:;" class="layui-btn">更多</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="height: 50px;"></div>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
