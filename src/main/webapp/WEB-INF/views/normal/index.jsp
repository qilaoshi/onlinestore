<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>网上超市</title>
    <link rel="stylesheet" href="/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/indexs.css">
    <link rel="stylesheet" href="/static/css/index.css">
    <script src="/static/lib/jquery/jquery-3.3.1.js"></script>
    <script src="/static/lib/layui/layui.js"></script>
    <script src="/static/lib/vue/vue.js"></script>
    <script src="https://cdn.bootcss.com/vue-resource/1.5.1/vue-resource.js"></script>
    <style>
    </style>
</head>
<body class="bg-grey">
<header>
    <jsp:include page="common/header.jsp" />
</header>
<div class="main-content clearfix ">

<div class="post-lists">
    <div class="post-lists-body">

        <c:forEach items="${goodslist}" var="goods">
        <div class="post-list-item">
            <div id="div-mains" class="post-list-item-container">
                <div class="item-thumb bg-green" style="background-image:url(${goods.goodsImagePath});"></div>
                <a href="/to_goodsinfo?goodsId=${goods.goodsId}">
                    <div class="item-desc">
                    </div>
                </a>
                <div class="item-slant reverse-slant bg-yellow"></div>
                <div class="item-slant"></div>
                <div class="item-label">
                    <div id="goods_name" class="item-title"><a>${goods.goodsName}</a></div>
                    <div class="item-meta clearfix">
                        <div class="item-meta-date" style="color: #313131; padding-top: 10px; font-size: 13px;">
								<span id="/2018/04/23/INTRO/" class="leancloud-visitors" data-flag-title="序/INTRO">
									<span id="goods_price" class="leancloud-visitors-count">${goods.goodsPrice}</span> 元
								</span>
                        </div>
                        <div class="item-meta-cat">
                            <a id="goods_number">库存${goods.goodsNumber}件</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
    <div style="width: 50%" class="layui-box layui-laypage layui-laypage-default" id="layui-laypage">
    </div>
</div>



<script>
    var limitcount=9;
    var curnum=0;
    page(limitcount,curnum);
    function page(){
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        var href = location.href;

        //执行一个laypage实例
        laypage.render({
            elem: 'layui-laypage' //注意，这里的 test1 是 ID，不用加 # 号
            ,count:${allgoods.size()} //数据总数，从服务端得到
            ,limit:limitcount
            ,curr:${page}
            ,jump: function(obj, first){
                if(!first){
                    //do something
                    curnum = obj.curr; //得到当前页，以便向服务端请求对应页的数据。
                    limitcount = obj.limit;
                    window.location.href="/to_index?page="+(curnum-1)*limitcount+"&limit="+limitcount+"&curr="+curnum;
                }
            }
        });
    });
    }


</script>
</body>
</html>