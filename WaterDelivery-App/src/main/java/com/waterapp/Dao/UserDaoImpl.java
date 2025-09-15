package com.waterapp.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.waterapp.entity.User;

@Component
public class UserDaoImpl implements UserDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	
	//add new user
	
	@Override
	@Transactional
	public int addUser(User user) {
		int userId=(Integer) this.hibernateTemplate.save(user);
		return userId;
	}

	
	//used for check user login
	
	@Override
	public User checkUser(long mobile) {
	    List<User> users = (List<User>) hibernateTemplate.execute(session -> {
	        return session.createQuery("from User where mobile = ?1", User.class)
	                      .setParameter(1, mobile)
	                      .list();
	    });

	    if (users.isEmpty()) {
	        return null;
	    }
	    User user = users.get(0);
	    return user;
	}

	
	
	//getting single user using user id
	
	 @Override
	 @Transactional(readOnly = true)
	 public User getUserWithOrdersAndCart(int id) {
		 return hibernateTemplate.execute(session ->
		 session.createQuery(
	                "SELECT DISTINCT u FROM User u " +
	                "LEFT JOIN FETCH u.orderHistory " +
	                "LEFT JOIN FETCH u.cart " +
	                "WHERE u.id = :id", User.class
				 )
	            .setParameter("id", id)
	            .uniqueResult()
	        );
	    }


	 @Override
	 public User getUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	 }


	 @Override
	 public User checkEmail(String email) {
		 List<User> users = (List<User>) hibernateTemplate.execute(session -> {
		        return session.createQuery("from User where email = ?1", User.class)
		                      .setParameter(1, email)
		                      .list();
		    });

		    if (users.isEmpty()) {
		        return null;
		    }
		    User user = users.get(0);
		    return user;
	 }

}
