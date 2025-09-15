package com.waterapp.entity;

import java.time.LocalDate;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

@Entity
public class OrderHistory {

	@EmbeddedId
	private OrderHistoryId orderHistoryId;
	private int qty;
	private String product;
	private double price;
	private LocalDate date;
	@ManyToOne
	@MapsId("userId")
	@JoinColumn(name="userId")
	private User user;
	
	
	public OrderHistoryId getOrderHistoryId() {
		return orderHistoryId;
	}
	public void setOrderHistoryId(OrderHistoryId orderHistoryId) {
		this.orderHistoryId = orderHistoryId;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	
	
	public OrderHistory(OrderHistoryId orderHistoryId, int qty, String product, double price, LocalDate date,
			User user) {
		super();
		this.orderHistoryId = orderHistoryId;
		this.qty = qty;
		this.product = product;
		this.price = price;
		this.date = date;
		this.user = user;
	}
	
	public OrderHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
