package com.waterapp.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@Column(unique = true)
	private long mobile;
	private String password;
    @Column(unique = true)
    private String email;
	private String buldingNo;
	private String city;
	private String state;
	private int pin;
	
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
	private Set<OrderHistory> orderHistory;
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
	private Set<Cart> cart;

	public User() {
		super();
	}
	
	public User(int id, String name, long mobile, String password, String email, String buldingNo, String city,
			String state, int pin, Set<OrderHistory> orderHistory, Set<Cart> cart) {
		super();
		this.id = id;
		this.name = name;
		this.mobile = mobile;
		this.password = password;
		this.email = email;
		this.buldingNo = buldingNo;
		this.city = city;
		this.state = state;
		this.pin = pin;
		this.orderHistory = orderHistory;
		this.cart = cart;
	}


	public Set<OrderHistory> getOrderHistory() {
		return orderHistory;
	}


	public void setOrderHistory(Set<OrderHistory> orderHistory) {
		this.orderHistory = orderHistory;
	}


	public Set<Cart> getCart() {
		return cart;
	}


	public void setCart(Set<Cart> cart) {
		this.cart = cart;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBuldingNo() {
		return buldingNo;
	}
	public void setBuldingNo(String buldingNo) {
		this.buldingNo = buldingNo;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}

	
	
}
