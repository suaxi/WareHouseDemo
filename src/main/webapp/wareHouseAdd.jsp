<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>添加仓库</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%-- 引入layui样式文件--%>
    <link rel="stylesheet" href="layui/css/layui.css" media="all"/>
    <script src="layui/layui.js"></script>
</head>
<body>
<div align="center">
    <h1>添加仓库</h1>
</div>
<br>
<form class="layui-form" action="/wareHouseSave" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">仓库名称：</label>
        <div class="layui-input-block">
            <input type="text" name="warehousename" required  lay-verify="required" placeholder="请输入仓库名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">照片：</label>
            <button type="button" class="layui-btn" id="test1"><i class="layui-icon">&#xe67c;</i>选择图片</button>
            <div class="layui-inline layui-word-aux">
            限制 1MB
            </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数量：</label>
        <div class="layui-input-block">
            <input type="text" name="amount" required  lay-verify="required" placeholder="请输入数量" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注：</label>
        <div class="layui-input-inline">
            <input type="text" name="intro" required lay-verify="required" placeholder="请输入备注" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div align="left" style="float: left">
            <a class="layui-btn layui-btn-primary" href="${ctx}/wareHouseList">返回上一页</a>
        </div>
        <div class="layui-input-block" align="center">
            <button class="layui-btn" lay-submit lay-filter="formDemo" id="test2">确认提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script>
    //Demo
    layui.use(['form','upload'], function(){
        var form = layui.form,
            upload = layui.upload;

        upload.render({
            elem:'#test1',
            url:'${ctx}/whWpload',
            auto:false,
            size:1024, //限制文件大小为1MB
            bindAction:'#test2',
            done:function (res) {
                console.log(res)
            }
        });
    });
</script>
<%--引入底部版权信息--%>
<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>
