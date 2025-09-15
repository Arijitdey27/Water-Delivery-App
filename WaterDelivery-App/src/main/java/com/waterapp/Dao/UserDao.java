package com.waterapp.Dao;

import com.waterapp.entity.User;

public interface UserDao {
	public int addUser(User user);

	public User checkUser(long mobile);

	public User getUser(int userId);
	public User getUserWithOrdersAndCart(int id);

	public User checkEmail(String email);
}
