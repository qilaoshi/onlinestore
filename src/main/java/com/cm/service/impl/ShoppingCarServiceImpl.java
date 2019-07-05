package com.cm.service.impl;

import com.cm.dao.ShoppingCarDao;
import com.cm.model.ShoppingCar;
import com.cm.service.ShoppingCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ShoppingCarServiceImpl implements ShoppingCarService {
    @Autowired
    ShoppingCarDao shoppingCarDao;

    public ShoppingCarDao getShoppingCarDao() {
        return shoppingCarDao;
    }

    public void setShoppingCarDao(ShoppingCarDao shoppingCarDao) {
        this.shoppingCarDao = shoppingCarDao;
    }

    @Override
    public void AddCar(ShoppingCar shoppingCar) {
        shoppingCarDao.AddCar(shoppingCar);
    }

    @Override
    public List<ShoppingCar> SelectUserCar(ShoppingCar shoppingCar) {
        return shoppingCarDao.SelectUserCar(shoppingCar);
    }

    @Override
    public void deleteCarGoods(ShoppingCar shoppingCar) {
        shoppingCarDao.deleteCarGoods(shoppingCar);
    }

    @Override
    public void totalCar(ShoppingCar shoppingCar) {
        shoppingCarDao.total(shoppingCar);
    }
}
