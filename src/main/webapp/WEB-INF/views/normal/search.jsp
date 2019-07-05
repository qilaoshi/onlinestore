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
    <style>
    </style>
</head>
<body class="bg-grey">
<header>
    <jsp:include page="common/header.jsp" />
</header>
<c:if test="${searchlist.size()==0}">
    <a>空空如也</a>
</c:if>
<c:if test="${searchlist!=null}">
<div class="main-content clearfix ">
    <div class="post-lists">
        <div class="post-lists-body">
            <c:forEach items="${searchlist}" var="goods">
                <div class="post-list-item">
                    <div class="post-list-item-container">
                        <div class="item-thumb bg-green" style="background-image:url(${goods.goodsImagePath});"></div>
                        <a href="/to_goodsinfo?goodsId=${goods.goodsId}">
                            <div class="item-desc">
                            </div>
                        </a>
                        <div class="item-slant reverse-slant bg-yellow"></div>
                        <div class="item-slant"></div>
                        <div class="item-label">
                            <div class="item-title"><a href="/2018/04/23/INTRO/">${goods.goodsName}</a></div>
                            <div class="item-meta clearfix">
                                <div class="item-meta-date" style="color: #313131; padding-top: 10px; font-size: 13px;">
								<span id="/2018/04/23/INTRO/" class="leancloud-visitors" data-flag-title="序/INTRO">
									<span class="leancloud-visitors-count">${goods.goodsPrice}</span> Yuan
								</span>
                                </div>
                                <div class="item-meta-cat">
                                    <a href="/categories/杂谈/">${goods.goodsNumber}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</c:if>


<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });


</script>
</body>
</html>
