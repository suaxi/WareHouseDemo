<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>修改个人信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%-- 引入layui样式文件--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all"/>
    <script src="layui/layui.js"></script>
    <script src="layui/js/jquery.min.js"></script>
    <script src="layui/js/area.js" type="text/javascript"></script>
    <script src="layui/js/select.js" type="text/javascript"></script>
</head>
<body>
<div align="center">
    <h1>修改个人信息</h1>
</div>
<br>
<form class="layui-form" action="/uuserUpdate" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">员工编号：</label>
        <div class="layui-input-block">
            <input type="text" name="username" value="${uuEdit.id}" required  lay-verify="required" placeholder="请输入员工姓名" autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工姓名：</label>
        <div class="layui-input-block">
            <input type="text" name="username" value="${uuEdit.username}" required  lay-verify="required" placeholder="请输入员工姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别：</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男">
            <input type="radio" name="sex" value="女" title="女" checked>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身份证：</label>
        <div class="layui-input-block">
            <input type="text" name="idnumber" value="${uuEdit.idnumber}" required  lay-verify="required|identity" placeholder="请输入身份证" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话：</label>
        <div class="layui-input-block">
            <input type="text" name="phone" value="${uuEdit.phone}" required  lay-verify="required|phone" placeholder="请输入电话" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址:</label>
        <div class="layui-input-block">
        <div class="layui-inline">
            <select name="address" id="province" lay-verify="required" lay-search lay-filter="province">
                <option value="">省份</option>
            </select>
        </div>
        <div class="layui-inline">
            <select name="address" id="city" lay-verify="required" lay-search lay-filter="city">
                <option value="">地级市</option>
            </select>
        </div>
        <div class="layui-inline">
            <select name="address" id="district" lay-verify="required" lay-search>
                <option value="">县/区</option>
            </select>
        </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码：</label>
        <div class="layui-input-block">
            <input type="password" name="password" value="${uuEdit.password}" required lay-verify="required|pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">重复密码</label>
        <div class="layui-input-block">
            <input type="password" name="repassword"  lay-verify="required|repassword" placeholder="请输入密码" autocomplete="off" class="layui-input" />
        </div>
    </div>
    <div class="layui-form-item">
        <div align="left" style="float: left">
            <a class="layui-btn layui-btn-primary" href="${ctx}/uuserList">返回上一页</a>
        </div>
        <div class="layui-input-block" align="center">
            <button class="layui-btn" lay-submit lay-filter="formDemo">确定修改</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repassword:function (value) {
                var pvalue = $("input[name='password']").val();
                if (pvalue!=value){
                    return "两次输入的密码不一致！";
                }
            }
        });
    });
</script>
<%--引入底部版权--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
