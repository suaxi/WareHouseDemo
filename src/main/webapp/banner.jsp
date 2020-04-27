<%--
  Created by IntelliJ IDEA.
  User: Suaxi
  Date: 2019/12/17
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>轮播图</title>
</head>
<body>
<!-- 轮播图页面 start-->

<!--banner图建议使用 1920*400的效果最佳-->
<div class="layui-carousel" id="test1" style="margin-bottom: 20px;">
    <div carousel-item>
        <div style="background-image: url('banner/1.jpg');background-size:100% 100%; "></div>
        <div style="background-image: url('banner/2.jpg');background-size:100% 100%; "></div>
        <div style="background-image: url('banner/3.jpg');background-size:100% 100%; "></div>
        <div style="background-image: url('banner/4.jpg');background-size:100% 100%; "></div>
    </div>
</div>
<!-- 条目中可以是任意内容，如：<img src=""> -->
<script>
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            , width: '100%' //设置容器宽度
            , arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
</script>
<!-- 轮播图页面 end-->
</body>
</html>
