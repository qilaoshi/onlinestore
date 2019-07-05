package com.cm.service;


import com.cm.model.ShoppingCar;

import java.util.List;


public interface ShoppingCarService{
    void AddCar(ShoppingCar shoppingCar);

    List<ShoppingCar> SelectUserCar(ShoppingCar shoppingCar);

    void deleteCarGoods(ShoppingCar shoppingCar);

    void totalCar(ShoppingCar shoppingCar);
}
