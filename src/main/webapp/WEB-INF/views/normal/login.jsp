<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/index.css">
    <script src="/static/lib/jquery/jquery-3.3.1.js"></script>
    <script src="/static/lib/jquery/jquery.form.js"></script>
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
<header>
    <jsp:include page="common/header.jsp" />
</header>
<div class="login-div layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this" >登录</li>
        <li >注册</li>
    </ul>
    <div class="layui-tab-content">
<div class="layui-tab-item layui-show">
        <form class="layui-form" id="login-form" action="/do_login" method="post" onsubmit="return doLogin();">
            <div class="layui-form-item" style="margin: 10px;text-align: center">
                <a class="b" style="color: red"></a>
            </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号:</label>
            <div class="layui-input-block">
                <input type="text" name="phone" required  lay-verify="required" placeholder="电话号码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码:</label>
            <div class="layui-input-block">
                <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
            </div>
        </div>
    </form>
</div>
    <div class="layui-tab-item">
        <form id="register-form" class="layui-form" action="/do_register" method="post" onsubmit="return doRegister();" >
            <div class="layui-form-item">
                <label class="layui-form-label">电话:</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" required  lay-verify="required" placeholder="电话号码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名:</label>
                <div class="layui-input-block">
                    <input type="text" name="username" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-block">
                    <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input" id="newpassword">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码:</label>
                <div class="layui-input-block">
                    <input type="password" name="repassword" required lay-verify="required" placeholder="确认密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin: 10px;text-align: center">
                <a class="a" style="color: red"></a>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="radio" name="position" value="customer" title="顾客" checked>
                    <input type="radio" name="position" value="business" title="商家">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit"  id="registers" class="layui-btn" lay-submit lay-filter="formDemo">注册</button>
                </div>
            </div>
        </form>
    </div>
    </div>
</div>

<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
    });
    layui.use('element', function(){
        var element = layui.element;
        //…
    });
    function doRegister() {
        var password = $("input[id='newpassword']").val();
        var repassword = $("input[name='repassword']").val();
        if (password == repassword) {
            $("#register-form").ajaxSubmit({
                dataType:"json",
                success:function(data){
                    if(data.code==0){
                        layer.alert('注册成功！', {
                            skin: 'layui-layer-molv' //样式类名  自定义样式
                            ,closeBtn: 1    // 是否显示关闭按钮
                            ,anim: 1 //动画类型
                            ,btn: ['确定','取消'] //按钮
                            ,icon: 6   // icon
                        });
                    }else{
                        $(".a").text(data.msg);
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown){
                    layer.open({
                        type: 1,
                        content: "未知错误"
                    });
                }
            });
            return false;
        }
        else {
            $(".a").text('两次密码不一致');
            return false;
        }
    }

    function doLogin() {
        $("#login-form").ajaxSubmit({
            dataType:"json",
            success:function (data) {
                if (data.code==0){
                    window.location.href="/to_index";
                } else {
                    $(".b").text(data.msg);
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
                layer.open({
                    type: 1,
                    content: "未知错误"
                });
            }
        });
        return false;
    }

</script>
</body>
</html>
