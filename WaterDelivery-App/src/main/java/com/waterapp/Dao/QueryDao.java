package com.waterapp.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.waterapp.entity.Query;

@Repository
public class QueryDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public void newQuery(Query query) {
		this.hibernateTemplate.save(query);
		
	}
}
