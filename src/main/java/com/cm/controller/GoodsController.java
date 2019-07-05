package com.cm.controller;

import com.cm.model.Goods;
import com.cm.model.ShoppingCar;
import com.cm.result.CommonJson;
import com.cm.service.GoodsService;
import com.cm.service.ShoppingCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class GoodsController {
    @Autowired
    GoodsService goodsService;
    @Autowired
    ShoppingCarService shoppingCarService;

    //删除货物
    @RequestMapping("/delete_goods")
    public Object DeleteGoods(Goods goods){
        System.out.println("goods id is"+goods.getGoodsId());
        goodsService.DeleteGoods(goods);
        CommonJson commonJson=new CommonJson();
        commonJson.setCode(0);
        return commonJson;
    }

    //修改商品信息
    @RequestMapping("/update_goodsinfo")
    @ResponseBody
    public Object UpdateGoodsInfo(Goods goods){
        System.out.println(goods.getGoodsName());
        System.out.println("goods id is"+goods.getGoodsId());
        goodsService.UpdateGoodsinfo(goods);
        CommonJson commonJson=new CommonJson();
        commonJson.setMsg("修改成功");
        return commonJson;
    }

    //删除购物车商品
    @RequestMapping("/delete_cargoods")
    public Object deleteCarGoods(ShoppingCar shoppingCar){
        System.out.println("shopcarid is"+shoppingCar.getShoppingCarId());
        shoppingCarService.deleteCarGoods(shoppingCar);
        CommonJson commonJson=new CommonJson();
        commonJson.setMsg("sucess");
        return  "redirect:/my_home#my_shopping_car";
    }

    @RequestMapping("/total_car")
    @ResponseBody
    public Object totalCar(ShoppingCar shoppingCar){
        shoppingCarService.totalCar(shoppingCar);
        CommonJson commonJson=new CommonJson();
        commonJson.setMsg("成功");
        return commonJson;
    }

}
