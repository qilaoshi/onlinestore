package com.cm.service;

import com.cm.model.Goods;
import com.cm.model.ShoppingCar;

import java.util.List;

public interface GoodsService {
    void save(Goods goodsModel);

    List<Goods> getAllGoods();

    List<Goods> category(Goods goodsModel);

    List<Goods> goodsInfo(Goods goodsModel);

    List<Goods> goodsSearch(Goods goodsModel);

    void updateNumber(Goods goodsModel);

    List<Goods> getAllPageGoods(int page, int limit);

    List<Goods> getUserGoods(Goods goods);

    void DeleteGoods(Goods goods);

    void UpdateGoodsinfo(Goods goods);

    List<Goods> getGoodsById(Goods goods);
}
