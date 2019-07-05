<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
    <link rel="stylesheet" href="/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="/static/lib/jquery/jquery-ui/jquery-ui.css">
    <link rel="stylesheet" href="/static/css/index.css">
    <script src="/static/lib/jquery/jquery-3.3.1.js"></script>
    <script src="/static/lib/layui/layui.js"></script>
    <script src="/static/lib/jquery/jquery-ui/jquery-ui.js"></script>
</head>
<style>
    .main-div{
        height: 85%;
        padding: 20px;
        margin-top: 50px;
        margin-left: 250px;
        margin-right: 250px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }
    #div1, #div2{
        display: inline-block;
    }
    #div2{
        margin-left: 20px;
    }
    .div3, .div4,.div5{
        display: inline-block;
    }
    .div4{
        margin-left: 20px;
    }
    .spinner{
        width: 50px;
    }



</style>
<body>
<header>
    <jsp:include page="common/header.jsp" />
</header>
<div class="main-div">
  <div class="layui-row">
    <div class="layui-col-xs6">
      <img style="margin-top: 100px" src="${goodsInfolist.goodsImagePath}" height="300" width="250">
    </div>
    <div class="layui-col-xs6" >
        <div style="margin-top: 100px">
            <div id="wrap">
                <div id="div1">
                    <h1 style="margin-top: 50px">${goodsInfolist.goodsName}</h1>
                </div>
                <div id="div2">
                  <h1 style="margin-top: 50px">${goodsInfolist.goodsPrice}元</h1>
            </div>
            </div>
            <div >
              <p style="margin-top: 50px">${goodsInfolist.goodsContent}</p>
            </div>
            <div class="div34" style="margin-top: 50px">
              <div class="div3">
                <input id="inputnum" name="num" value="1" type="text" class="spinner"/>
              </div>
                <div class="div5">
                    <p class="stock">(库存${goodsInfolist.goodsNumber}件)</p>
                </div>
              <div class="div4">
                <p class="money">${goodsInfolist.goodsPrice}元</p>
              </div>
            </div>
            <div class="layui-btn-group" style="margin-top: 50px">
                <button id="add-car"  class="layui-btn layui-btn-lg  layui-btn-dange">加入购物车</button>
            </div>
        </div>
    </div>
  </div>
</div>

<script type="text/javascript">
        $('.spinner').spinner();
        $( ".spinner" ).spinner({
            min: 1,
            max: ${goodsInfolist.goodsNumber},
            spin: function( event, ui ) {
                $(".money").html(ui.value*${goodsInfolist.goodsPrice}+"元");
            }
        });
        $("#add-car").click(function () {
            if ($("input[name='num']").val()>${goodsInfolist.goodsNumber}){
                alert("库存不足");
            }
            else {
            $.ajax({
               type:"POST",
                url:"/add_car",
                data:{"goodsId":${goodsInfolist.goodsId},"shopNumber":$("input[name='num']").val()},
                dataType:"json",
                success:function(data){
                    //请求成功时处理
                    console.log($("input[name='num']").val());
                    alert(data.msg);
                },
                error:function(){
                    //请求出错处理
                    alert("请先登录");
                }
            });
            }
        })

</script>
</body>
</html>
