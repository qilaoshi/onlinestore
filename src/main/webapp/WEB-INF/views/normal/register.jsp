<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/22/022
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/mycss.css">
    <script src="/static/lib/jquery/jquery-3.3.1.js"></script>
    <script src="/static/lib/layui/layui.js"></script>
    <style>
        .container {
            border:2px solid #a1a1a1;
            padding:10px 40px;
            width:300px;
            border-radius:25px;
            margin-top: 200px;
        }
        .login-div{
            width: 30%;
            margin: auto;
            padding: 20px;
            margin-top: 100px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<ul class="layui-nav " lay-filter="">
    <li class="layui-nav-item layui-this"><a href="">最新活动</a></li>
    <li class="layui-nav-item "><a href="">产品</a></li>
    <li class="layui-nav-item"><a href="">大数据</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">解决方案</a>
        <dl class="layui-nav-child"> <!-- 二级菜单 -->
            <dd><a href="">移动模块</a></dd>
            <dd><a href="">后台模版</a></dd>
            <dd><a href="">电商平台</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="">社区</a></li>
</ul>

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });

    var href = location.href;
    var id = href.substring(href.lastIndexOf("/") + 1, href.length);
    if (id=="") {
        id = "index";
    }
    var ids = ["index", "login", "ptj", "catagory"];
    for (var i = 0; i < ids.length; i++) {
        if (id==ids[i]) {
            $("#" + id).addClass("layui-this");
        } else {
            $("#" + ids[i]).removeClass("layui-this");
        }
    }



</script>
</body>
</html>
