package com.waterapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waterapp.Dao.UserDao;
import com.waterapp.entity.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;

	public int addUser(User newUser) {
		return this.userDao.addUser(newUser);
		
	}

	public User checkUser(long mobile, String password) {
		User user=this.userDao.checkUser(mobile);
		if(user==null) {
			return null;
		}
		if (user.getPassword().equals(password)) {
	        return user;
	    }
		
		return null;
	}

	public boolean checkMobile(long mobile) {
		User user = this.userDao.checkUser(mobile);
		if(user!=null)return true;
		return false;
	}

	public boolean checkEmail(String email) {
		User user=this.userDao.checkEmail(email);
		if(user!=null)return true;
		return false;
	}
	
	
}
