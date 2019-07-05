package com.cm.dao;

import com.cm.model.ShoppingCar;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingCarDao {
    void AddCar(ShoppingCar shoppingCar);

    List<ShoppingCar> SelectUserCar(ShoppingCar shoppingCar);

    void deleteCarGoods(ShoppingCar shoppingCar);

    void total(ShoppingCar shoppingCar);

}
