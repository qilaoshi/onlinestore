package com.cm.dao;

import com.cm.model.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsDao {

    void save(Goods goodsModel);

    List<Goods> getAllGoods();

    List<Goods> getAllPageGoods(@Param("arg0") int arg0, @Param("arg1") int arg1);

    List<Goods> category(Goods goodsModel);

    List<Goods> goodsInfo(Goods goodsModel);

    List<Goods> goodsSearch(Goods goodsModel);

    List<Goods> getUserGoods(Goods goods);

    void DeleteGoods(Goods goods);

    void UpDateGoodsinfo(Goods goods);

    void updateNumber(Goods goodsModel);

    List<Goods> getGoodsById(Goods goods);

}
