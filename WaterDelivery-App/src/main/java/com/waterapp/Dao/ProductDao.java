package com.waterapp.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.waterapp.entity.OrderHistory;
import com.waterapp.entity.Products;

@Component
public class ProductDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public Products getProduct(int pId) {
		
		return this.hibernateTemplate.get(Products.class, pId);
	}

	public List<OrderHistory> getAllOrderHistory(int userId) {
		String hql = "from OrderHistory o where o.orderHistoryId.userId = :uid";
	    return (List<OrderHistory>) this.hibernateTemplate.findByNamedParam(hql, "uid", userId);
		
	}

}
