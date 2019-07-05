<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的主页</title>
    <link rel="stylesheet" href="/static/lib/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/index.css">
    <script src="/static/lib/jquery/jquery-3.3.1.js"></script>
    <script src="/static/lib/layui/layui.js"></script>
</head>
<style>
    #div1, #div2 {
        display: inline-block;
    }

    #div2 {
        margin-left: 10px;
    }

    .mine-div {
        height: 85%;
        padding: 20px;
        margin-top: 10px;
        margin-left: 250px;
        margin-right: 250px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    #publish-div {
        margin-left: 220px;
        margin-right: 250px;
        margin-top: 20px;
    }

    .mine-ul {
        margin-top: 65px;
        position: relative;
    }

    h1 {
        text-align: center;
    }

    h2 {
        text-align: center;
        margin-bottom: 50px;
    }

    #edit {
        margin-left: 120px;
        margin-right: 150px;
        margin-top: 20px;
    }
</style>
<body>
<header>
    <jsp:include page="../normal/common/header.jsp"/>
</header>
<div class="mine-div layui-form">
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree mine-ul" lay-filter="test">
                <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                <li id="my_info" class="layui-nav-item">
                    <dd><a href="#my_info" id="">我的信息</a></dd>
                </li>
                <c:if test="${user.position eq 'business'}">
                    <li id="my_publish" class="layui-nav-item">
                        <dd><a href="#my_publish">发布商品</a></dd>
                    </li>
                    <li id="my_goods" class="layui-nav-item ">
                        <dd><a href="#my_goods">已发布商品</a></dd>
                    </li>
                </c:if>
                <li id="my_shopping_car" class="layui-nav-item">
                    <dd><a href="#my_shopping_car" class="shoppingcar">购物车</a></dd>
                </li>
            </ul>
        </div>
    </div>

    <div id="published-div">
        <table id="goods-table" class="layui-table" lay-filter="test">
        </table>
    </div>

    <div id="mine-info-div">
        <table id="mine-info-table" class="layui-table" lay-skin="nob">
            <tr>
                <th>用户名</th>
                <th>权限</th>
                <th>电话</th>
            </tr>
            <tr>
                <td>${user.username}</td>
                <td>${user.position}</td>
                <td>${user.phone}</td>
            </tr>
        </table>
    </div>

    <div id="my-shopping-car-div">
        <table id="car-table" class="layui-table" lay-skin="nob">
            <tr>
                <th>商品名</th>
                <th>商品数量</th>
                <th>总价(元)</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${carlist}" var="carlist" varStatus="loop">
                <tr>
                    <td id="price">${carlist.goods.goodsName}</td>
                    <td id="number">${carlist.shopNumber}</td>
                    <td id="add-price">${moneylist[loop.count-1]}</td>
                    <td><a href="/delete_cargoods?shoppingCarId=${carlist.shoppingCarId}" id="delete_cargoods"
                           class="layui-btn  layui-btn-xs" lay-event="del">删除</a></td>
                </tr>
            </c:forEach>
        </table>
        <div style="margin-left: 600px">
            <div id="div1"><a id="all-money" style="font-size: 20px;text-align: center">共${allmoney}元</a></div>
            <div id="div2">
                <button id="total" class="layui-btn layui-btn-lg layui-btn-radius layui-btn-danger">结算</button>
            </div>
        </div>
    </div>


    <div id="publish-div">
        <h2>发布商品</h2>
        <div class="layui-form-item" style="margin: 10px;text-align: center">
            <a class="b" style="color: red"></a>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品名:</label>
            <div class="layui-input-block">
                <input type="text" name="goodsNamess" required lay-verify="required" placeholder="商品名"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格:</label>
            <div class="layui-input-block">
                <input type="password" name="goodsPrice" required lay-verify="required" placeholder="价格"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品分类</label>
            <div class="layui-input-block">
                <select id="goodsCategory" lay-verify="required">
                    <option value=""></option>
                    <option value="服装">服装</option>
                    <option value="食品">食品</option>
                    <option value="生活用品">生活用品</option>
                    <option value="电子产品">电子产品</option>
                    <option value="其他">其他</option>
                </select>
                <div class="layui-unselect layui-form-select layui-form-selected">
                    <div class="layui-select-title"><input type="text" placeholder="请选择" name="goodsCategory"
                                                           readonly="" class="layui-input layui-unselect">
                        <i class="layui-edge"></i></div>
                    <dl class="layui-anim layui-anim-upbit">
                        <dd lay-value="" class="layui-select-tips">请选择</dd>
                        <dd lay-value="服装" class="">服装</dd>
                        <dd lay-value="食品" class="">食品</dd>
                        <dd lay-value="生活用品" class="">生活用品</dd>
                        <dd lay-value="电子产品" class="">电子产品</dd>
                        <dd lay-value="其他" class="">其他</dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">数量:</label>
            <div class="layui-input-block">
                <input type="password" name="goodsNumber" required lay-verify="required" placeholder="数量"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品图片:</label>
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="test1">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-block">
                <textarea id="goodscontents" name="goodsContentss" placeholder="请输入内容"
                          class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="add-goods-btn" class="layui-btn">确定</button>
            </div>
        </div>
    </div>

    <div id="edit">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名:</label>
            <div class="layui-input-block">
                <input type="text" name="goodsNamesss" required lay-verify="required" placeholder="商品名"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格:</label>
            <div class="layui-input-block">
                <input type="password" name="goodsPrices" required lay-verify="required" placeholder="价格"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品分类</label>
            <div class="layui-input-block">
                <select id="goodsCategorys" lay-verify="required">
                    <option value=""></option>
                    <option value="服装">服装</option>
                    <option value="食品">食品</option>
                    <option value="生活用品">生活用品</option>
                    <option value="电子产品">电子产品</option>
                    <option value="其他">其他</option>
                </select>
                <div class="layui-unselect layui-form-select layui-form-selected">
                    <div class="layui-select-title"><input type="text" placeholder="请选择" name="goodsCategory"
                                                           readonly="" class="layui-input layui-unselect">
                        <i class="layui-edge"></i></div>
                    <dl class="layui-anim layui-anim-upbit">
                        <dd lay-value="" class="layui-select-tips">请选择</dd>
                        <dd lay-value="服装" class="">服装</dd>
                        <dd lay-value="食品" class="">食品</dd>
                        <dd lay-value="生活用品" class="">生活用品</dd>
                        <dd lay-value="电子产品" class="">电子产品</dd>
                        <dd lay-value="其他" class="">其他</dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">数量:</label>
            <div class="layui-input-block">
                <input type="password" name="goodsNumbers" required lay-verify="required" placeholder="数量"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-block">
                <textarea id="goodscontentss" name="goodsContentss" placeholder="请输入内容"
                          class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="add-goods-btns" class="layui-btn">确定修改</button>
            </div>

        </div>
    </div>

</div>
</body>
<script type="text/html" id="usernameTpl">
    <a class="layui-table-link" target="_blank">{{ d.goodsName }}</a>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;
    });

    layui.use('table', function () {
        var table = layui.table;

        //商品表格
        table.render({
            elem: '#goods-table'
            , height: 310
            , url: '/query_published_goods' //数据接口
            , cols: [[ //表头
                {field: 'goodsName', width: 80, templet: '#usernameTpl', title: '商品名'}
                , {field: 'goodsPrice', width: 80, title: '价格'}
                , {field: 'goodsContent', width: 200, title: '商品描述'}
                , {field: 'goodsCategory', width: 160, title: '商品种类'}
                , {field: 'goodsNumber', width: 80, title: '库存'}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo'}
            ]]
            , done: function () {
                $('th').css({'background-color': '#5792c6', 'color': '#ffe4c4', 'font-weight': 'bold'})
            }
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            console.log("obj is" + id)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "/delete_goods?goodsId=" + data.goodsId,
                        type: "POST",
                        success: function (data) {
                            console.log(data.code);
                        }
                    });
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 1,
                    title: "修改商品信息",
                    area: ['720px', '500px'],
                    content: $("#edit"),
                    id: data.goodsId
                });
                $("#add-goods-btns").click(function () {
                    console.log("goodsid is" + obj.data.goodsId);
                    $.ajax({
                        url: "/update_goodsinfo",
                        data: {
                            goodsName: $("input[name='goodsNamesss']").val(),
                            goodsNumber: $("input[name='goodsNumbers']").val(),
                            goodsPrice: $("input[name='goodsPrices']").val(),
                            goodsCategory: $("#goodsCategorys option:selected").text(),
                            goodsContent: $("#goodscontentss").val(),
                            goodsId: data.goodsId
                        },
                        success: function (data) {
                            alert(data.msg);
                            window.location.reload();
                        }

                    });
                    layer.closeAll();
                })
            }
        });
    });


    $(document).ready(function () {
        $("#mine-info-div").hide();
        $("#my-shopping-car-div").hide();
        $("#publish-div").hide();
        $("#edit").hide();
        $("#published-div").hide();
        $("#my_info").click(function () {
            $("#mine-info-div").show();
            $("#publish-div").hide();
            $("#published-div").hide();
            $("#my-shopping-car-div").hide();
        });
        $("#my_shopping_car").click(function () {
            $("#my-shopping-car-div").show();
            $("#publish-div").hide();
            $("#published-div").hide();
            $("#mine-info-div").hide();
        });
        $("#my_publish").click(function () {
            $("#my-shopping-car-div").hide();
            $("#published-div").hide();
            $("#mine-info-div").hide();
            $("#publish-div").show();
        });
        $("#my_goods").click(function () {
            $("#my-shopping-car-div").hide();
            $("#publish-div").hide();
            $("#mine-info-div").hide();
            $("#published-div").show();
        });

        //删除购物车商品
        $("#delete_cargoods").click(function () {
            alert("ok");
            window.location.reload();
        });

        //结算购物车
        $("#total").click(function () {
            if (${carlist.size()==0}) {
                alert("购物车为空");
            } else {
                layer.confirm('确定结算？', function () {
                    $.ajax({
                        url: '/total_car?userId=' +${user.userId},
                        success: function (data) {
                            alert(data.msg);
                            window.location.reload();
                        }
                    });
                });
            }
        });

        var zid;
        var href = location.href;
        zid = href.substring(href.lastIndexOf("#") + 1, href.length);
        console.log(zid);
        if (href.lastIndexOf("#") == -1) {
            $("#my_info").addClass("layui-this");
        }
        var zids = ["my_info", "my_publish", "my_goods", "my_shopping_car"];
        for (var i = 0; i < zids.length; i++) {
            if (zid == zids[i]) {
                console.log("layui-this:" + zid);
                $("#" + zids[i]).addClass("layui-this");
                $("#" + zids[i]).click();
            }
            else {
                $("#" + zids[i]).removeClass("layui-this");
            }
        }

    });

    layui.use('upload', function () {
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            , url: '/do_publish' //上传接口
            , field: 'image'
            , data: {
                goodsName: function () {
                    return $("input[name='goodsNamess']").val();
                },
                goodsPrice: function () {
                    return $("input[name='goodsPrice']").val();
                },
                goodsCategory: function () {
                    return $("#goodsCategory option:selected").text()
                },
                goodsNumber: function () {
                    return $("input[name='goodsNumber']").val();
                },
                goodsContent: function () {
                    return $("#goodscontents").val();
                }
            }
            , auto: false
            , bindAction: '#add-goods-btn'
            , done: function (res) {
                //alert(res.msg);
                layer.alert('发布成功！', {
                    skin: 'layui-layer-molv' //样式类名  自定义样式
                    , closeBtn: 1    // 是否显示关闭按钮
                    , anim: 1 //动画类型
                    , btn: ['确定', '取消'] //按钮
                    , icon: 6   // icon
                });
            }
            , error: function () {
                alert("false");
                //请求异常回调
            }
        });
    });
</script>
</html>
