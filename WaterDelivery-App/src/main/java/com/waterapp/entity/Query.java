package com.waterapp.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Query {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int qId;
	private String name;
	private String email;
	private String query;
	
	public Query() {
		super();
		
	}
	
	public Query(int qId, String name, String email, String query) {
		super();
		this.qId = qId;
		this.name = name;
		this.email = email;
		this.query = query;
	}
	
	public int getQId() {
	    return qId;
	}
	public void setQId(int qId) {
	    this.qId = qId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	
	
	
}
