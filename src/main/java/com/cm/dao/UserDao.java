package com.cm.dao;


import com.cm.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

	List<User> getAllUser();

	void insertUser(User userModel);

	void deleteUserById(User userModel);

	List<User> login(User userModel);

	List<User> getUser();

	List<User> register(User userModel);

	void updateUser(User userModel);




}

