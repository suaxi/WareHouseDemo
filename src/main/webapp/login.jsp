<%--
  Created by IntelliJ IDEA.
  User: Suaxi
  Date: 2019/12/25
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<!--  引入layui的默认样式-->
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<!--引入layui的js文件-->
<script src="layui/layui.js"></script>
<body style="background-image:url(banner/backround.jpg);background-size: 100% 100%;">
<br>
<br>
<br>
<br>
<br>
<div style="height: 150px;font-family: '方正舒体';font-size: 66px" align="center">仓库出入库管理系统</div>
<div style="margin: 0px auto;width: 400px;border-radius:20px;background: lightgoldenrodyellow;padding: 50px;">
    <div>
        <h2 style="text-align: center;color:black;">用户登录</h2>
    </div>
    <br/>
    <br/>
    <div style="margin:0px auto;">
    <form class="layui-form" action="/doLogin" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名：</label>
            <div class="layui-input-block">
                <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-block">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
        <div style="text-align:center;margin-top:15px;">
            <input type="checkbox" name="agree" lay-skin="primary" checked=""/>
            我已阅读并同意
            <a href="#" id="agreementLink">《隐私条款》</a>
        </div>
    </form>
    </div>
<script>
        //Demo
        layui.use('form', function(){
            var form = layui.form;

            //监听提交
            form.on('submit(formDemo)', function(data){
                var agreeChecked = data.field.agree;
                if(agreeChecked!="on"){
                    layer.msg("未同意隐私条款");
                    return false;//阻止表单提交
                }
            });
        });
</script>

</div>
</body>
</html>

