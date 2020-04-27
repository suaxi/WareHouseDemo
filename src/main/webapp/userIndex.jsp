<%--
  Created by IntelliJ IDEA.
  User: Suaxi
  Date: 2020/1/7
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
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
            <span>您好，${user.username}</span>
        </c:if>
        &nbsp;&nbsp;<a href="/quit">退出</a>
    </legend>
</fieldset>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li style="font-size: 19px">仓库信息</li>
        <li style="font-size: 19px">供应商信息</li>
        <li style="font-size: 19px">库存信息</li>
        <li style="font-size: 19px">出/入库信息</li>
        <li style="font-size: 19px">工单管理</li>
        <li style="font-size: 19px">用户中心</li>
        <li style="font-size: 19px">信息反馈</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <a href="${ctx}/uwareHouseList"><button type="button" class="layui-btn">查看仓库信息</button></a>
        </div>
        <div class="layui-tab-item">
            <a href="${ctx}/usupplierList"><button type="button" class="layui-btn layui-btn-normal">查看供应商信息</button></a>
        </div>
        <div class="layui-tab-item">
            <a href="${ctx}/ustockList"><button type="button" class="layui-btn layui-btn-warm">查看库存信息</button></a>
        </div>
        <div class="layui-tab-item">
            <a href="${ctx}/uproductList"><button type="button" class="layui-btn layui-btn-normal">查看出/入库信息</button></a>
        </div>
        <div class="layui-tab-item">
            <a href="${ctx}/urequestList"><button type="button" class="layui-btn layui-btn-danger">工单信息</button></a>
        </div>
        <div class="layui-tab-item">
            <a href="${ctx}/uuserList"><button type="button" class="layui-btn layui-btn-warm">员工信息</button></a>
            <br><br><a href="${ctx}/uuserEdit?id=${user.id}"><button type="button" class="layui-btn layui-btn-warm">修改个人信息</button></a>
        </div>
        <div class="layui-tab-item">
            <form class="layui-form" action="/msgSave" method="post">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">请输入意见或建议：</label>
                    <div class="layui-input-block">
                        <textarea name="msg" placeholder="请输入内容,250字之内" required lay-verify="required|check" autocomplete="off" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item" align="center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>员工操作指南：</legend>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        1.查询仓库、供应商、库存、出/入库等信息</span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        2.工单管理：填写工单→管理员审核→出/入库操作</span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        3.用户中心→修改个人信息</span>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px">
        4.提交建议反馈</span>
</fieldset>
<script>
    layui.use('element', function() {
        element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        form.verify({
            check:function (value) {
                if (value==null){
                    return "内容不能为空！";
                }
            }
        });
    });
</script>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
