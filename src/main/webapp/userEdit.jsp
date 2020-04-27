<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>修改员工信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%-- 引入layui样式文件--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all"/>
    <script src="layui/layui.js"></script>
</head>
<body>
<div align="center">
    <h1>修改员工信息</h1>
</div>
<br>
<form class="layui-form" action="/userUpdate" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">员工编号：</label>
        <div class="layui-input-block">
            <input type="text" name="id" value="${uEdit.id}" required  lay-verify="required"  autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工姓名：</label>
        <div class="layui-input-block">
            <input type="text" name="username" value="${uEdit.username}" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">照片：</label>
        <div class="layui-input-block">
            <input type="text" name="photo" value="${uEdit.photo}" required  lay-verify="required"  autocomplete="off" class="layui-input" readonly="true">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别：</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男">
            <input type="radio" name="sex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身份证：</label>
        <div class="layui-input-block">
            <input type="text" name="idnumber" value="${uEdit.idnumber}" required  lay-verify="required|identity" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话：</label>
        <div class="layui-input-block">
            <input type="text" name="phone" value="${uEdit.phone}" required  lay-verify="required|phone" autocomplete="off" class="layui-input">
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
            <input type="password" name="password" value="${uEdit.password}" required lay-verify="required|pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">重复密码</label>
        <div class="layui-input-block">
            <input type="password" name="repassword"  lay-verify="required|repassword" placeholder="请输入密码" autocomplete="off" class="layui-input" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注：</label>
        <div class="layui-input-block">
            <input type="text" name="intro" value="${uEdit.intro}" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">入职时间：</label>
        <div class="layui-input-block">
            <input type="text" name="entrytime" value="${uEdit.entrytime}" required  lay-verify="required" autocomplete="off" class="layui-input" id="test">
        </div>
    </div>
    <div class="layui-form-item">
        <div align="left" style="float: left">
            <a class="layui-btn layui-btn-primary" href="${ctx}/userList">返回上一页</a>
        </div>
        <div class="layui-input-block" align="center">
            <button class="layui-btn" lay-submit lay-filter="formDemo">确定修改</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    //Demo
    layui.use(['form','laydate'], function(){
        var form = layui.form;
        var laydate=layui.laydate;

            laydate.render({
                elem: '#test' //指定元素
                ,trigger:'click'
            });

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
