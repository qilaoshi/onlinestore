package com.cm.service.impl;

import com.cm.dao.UserDao;
import com.cm.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    UserDao userDao;

    public List<User> getAllUser(){
        return userDao.getAllUser();
    }

    public void insertUser(User userModel){
        userDao.insertUser(userModel);
    }

    public void deleteUserById(User userModel){
        userDao.deleteUserById(userModel);
    }

    public List<User> login(User userModel){
        return userDao.login(userModel);
    }

    public List<User> register(User userModel){ return userDao.register(userModel);}


}
