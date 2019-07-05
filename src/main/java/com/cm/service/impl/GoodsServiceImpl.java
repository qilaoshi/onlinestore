package com.cm.service.impl;

import com.cm.dao.GoodsDao;
import com.cm.model.Goods;
import com.cm.model.ShoppingCar;
import com.cm.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsDao goodsDao;

   public GoodsDao getGoodsDao() {
       return goodsDao;
    }

    public void setGoodsDao(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    @Override
    public void save(Goods goodsModel) {
        goodsDao.save(goodsModel);
    }

    @Override
    public List<Goods> getAllGoods() {
        return goodsDao.getAllGoods();
    }

    @Override
    public List<Goods> category(Goods goodsModel) {
        return goodsDao.category(goodsModel);
    }

    @Override
    public List<Goods> goodsInfo(Goods goodsModel) {
        return goodsDao.goodsInfo(goodsModel);
    }

    @Override
    public List<Goods> goodsSearch(Goods goodsModel) {
        return goodsDao.goodsSearch(goodsModel);
    }

    @Override
    public void updateNumber(Goods goodsModel) {
       goodsDao.updateNumber(goodsModel);

    }

    @Override
    public List<Goods> getAllPageGoods(int page, int limit) {
        return goodsDao.getAllPageGoods(page,limit);
    }

    @Override
    public List<Goods> getUserGoods(Goods goods) {
        return goodsDao.getUserGoods(goods);
    }

    @Override
    public void DeleteGoods(Goods goods) {
        goodsDao.DeleteGoods(goods);
    }

    @Override
    public void UpdateGoodsinfo(Goods goods) {
        goodsDao.UpDateGoodsinfo(goods);
    }

    @Override
    public List<Goods> getGoodsById(Goods goods) {
        return goodsDao.getGoodsById(goods);
    }


}
