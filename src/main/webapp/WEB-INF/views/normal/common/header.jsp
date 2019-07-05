<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="layui-layout layui-layout-admin fly-header ">
<div class="layui-header "   >
<ul class="layui-nav fly-header " lay-filter="">
    <li  class="to_index layui-nav-item layui-this li-right"><a href="/to_index">首页</a></li>
    <li  class="category layui-nav-item to_category layui-hide-xs" >
    <a>商品分类</a>
    <dl class="layui-nav-child to_category"> <!-- 二级菜单 -->
        <dd><a href="/to_category?goodsCategory=服装" >服装</a></dd>
        <dd><a href="/to_category?goodsCategory=食品" >食品</a></dd>
        <dd><a href="/to_category?goodsCategory=生活用品" >生活用品</a></dd>
        <dd><a href="/to_category?goodsCategory=电子产品" >电子产品</a></dd>
        <dd><a href="/to_category?goodsCategory=其他" >其他</a></dd>
    </dl>
</li>


    <li class="layui-nav-item " style="margin-left: 40px">
        <div class="layui-input-inline">
            <input id="input" type="text" name="goodsName"  class="layui-input" placeholder="搜索"/>
            <a id="a-search" href=""><i class="layui-icon layui-icon-search" style="position: absolute;top:-7px;right: 8px;font-size: 30px;color:black"></i></a>
        </div>
    </li>


        <c:if test="${user==null}">
            <li  class="to_login layui-nav-item float-right" >
                <a href="/to_login" class="username">登录</a>
            </li>
        </c:if>
        <c:if test="${user!=null}">
            <li  class="my_home shopping_car layui-nav-item  float-right" >
                <a class="username">${user.username}</a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a href="/logout" class="a1">注销</a></dd>
                    <dd><a href="/my_home" class="a2">我的主页</a></dd>
                </dl>
            </li>
        </c:if>
</ul>
</div>
</div>

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
    });
    var id;
    var href = location.href;
    if(href.lastIndexOf("?")==-1&&href.lastIndexOf("#")==-1){
        id=href.substring(href.lastIndexOf("/") + 1, href.length);
        console.log(id);
    }else if(href.lastIndexOf("#")!=-1){
        id=href.substring(href.lastIndexOf("/") + 1, href.lastIndexOf("#"));
        console.log(id);
    }else{
        id=href.substring(href.lastIndexOf("/") + 1, href.lastIndexOf("?"));
        console.log(id);
    }
    if (id=="") {
        id = "to_index";
    }
    var ids = ["to_login","mine","to_category","my_home","shopping_cart","to_index"];
    for (var i = 0; i < ids.length; i++) {
        if (id==ids[i]) {
            $("." + id).addClass("layui-this");
        } else {
            $("." + ids[i]).removeClass("layui-this");
        }
    }

    $("#a-search").click(function () {
        var goodsName=$("#input").val();
        $("#a-search").attr("href","/search?goodsName="+goodsName);
    });





</script>
