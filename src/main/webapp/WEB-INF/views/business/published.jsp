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
    .mine-div{
        height: 85%;
        padding: 20px;
        margin-top: 50px;
        margin-left: 250px;
        margin-right: 250px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }
    #publish-div{
        margin-left: 220px;
        margin-right: 250px;
        margin-top: 20px;
    }
    .mine-ul{
        margin-top: 65px;
        position:relative;
    }
    h1{
        text-align: center;
    }
    h2{
        text-align: center;
        margin-bottom: 50px;
    }
    #edit{
        margin-left: 120px;
        margin-right: 150px;
        margin-top: 20px;
    }
</style>
<body>
<header>
    <jsp:include page="../normal/common/header.jsp" />
</header>

<div class="mine-div layui-form">
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree mine-ul" lay-filter="test">
                <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                <li id="mine-nav" class="layui-nav-item ">
                    <dd><a href="javascript:;" id="">我的信息</a></dd>
                </li>
                <li class="layui-nav-item">
                    <dd><a href="javascript:;" class="publish" >发布商品</a></dd>
                </li>
                <li id="nav-published" class="layui-nav-item layui-this ">
                    <dd><a href="javascript:;" class="published">已发布商品</a></dd>
                </li>
                <li class="layui-nav-item">
                    <dd><a href="javascript:;" class="shoppingcar">购物车</a></dd>
                </li>
            </ul>
        </div>
    </div>

    <div id="published-div">
        <table id="goods-table" class="layui-table" lay-filter="test">
        </table>
    </div>

    <div id="edit">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名:</label>
            <div class="layui-input-block">
                <input type="text" name="goodsNamesss" required  lay-verify="required" placeholder="商品名" autocomplete="off" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格:</label>
            <div class="layui-input-block">
                <input type="password" name="goodsPrices" required lay-verify="required" placeholder="价格" autocomplete="off" class="layui-input">
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
                    <div class="layui-select-title"><input type="text" placeholder="请选择" name="goodsCategory" readonly="" class="layui-input layui-unselect">
                        <i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit">
                    <dd lay-value="" class="layui-select-tips">请选择</dd>
                    <dd lay-value="服装" class="">服装</dd>
                    <dd lay-value="食品" class="">食品</dd>
                    <dd lay-value="生活用品" class="">生活用品</dd>
                    <dd lay-value="电子产品" class="">电子产品</dd>
                    <dd lay-value="其他" class="">其他</dd></dl></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">数量:</label>
            <div class="layui-input-block">
                <input type="password" name="goodsNumbers" required lay-verify="required" placeholder="数量" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-block">
                <textarea id="goodscontentss" name="goodsContentss" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="add-goods-btns" class="layui-btn" >确定修改</button>
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

    $(document).ready(function () {
        $("#edit").hide();
    })

    layui.use('table', function(){
        var table = layui.table;
        //商品表格
        table.render({
            elem: '#goods-table'
            ,height: 310
            ,url: '/query_published_goods' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field:'goodsName',width:80, templet: '#usernameTpl', title: '商品名'}
                ,{field:'goodsPrice', width:80, title: '价格'}
                ,{field: 'goodsContent',width:200, title: '商品描述'}
                ,{field:'goodsCategory', width:160, title: '商品种类' }
                ,{field: 'goodsNumber',width:80,  title: '库存'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,done: function () {
                $('th').css({'background-color': '#5792c6', 'color': '#ffe4c4','font-weight':'bold'})
            }
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var id=data.goodsId;
            console.log("obj is"+id)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url:"/delete_goods?goodsId="+data.goodsId,
                        type:"POST",
                        success:function (data) {
                            console.log(data.code);
                        }
                    });
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type: 1,
                    title: "修改商品信息",
                    area: ['720px', '500px'],
                    content: $("#edit"),
                    id:data.goodsId
                });
                $("#add-goods-btns").click(function () {
                    var gid=obj.data.goodsId;
                    console.log("goodsid is" + obj.data.goodsId);
                    $.ajax({
                        url: "/update_goodsinfo",
                        data: {
                            goodsName: $("input[name='goodsNamesss']").val(),
                            goodsNumber: $("input[name='goodsNumbers']").val(),
                            goodsPrice: $("input[name='goodsPrices']").val(),
                            goodsCategory: $("#goodsCategorys option:selected").text(),
                            goodsContent: $("#goodscontentss").val(),
                            goodsId: gid
                        },
                        success: function (data) {
                            alert(data.msg);
                            window.location.reload();
                        }

                    })
                    obj.update({
                        goodsName: $("input[name='goodsNamesss']").val(),
                        goodsNumber: $("input[name='goodsNumbers']").val(),
                        goodsPrice: $("input[name='goodsPrices']").val(),
                        goodsCategory: $("#goodsCategorys option:selected").text(),
                        goodsContent: $("#goodscontentss").val()
                    });
                    layer.closeAll();
                })
            }
        });
    });
</script>
</html>
