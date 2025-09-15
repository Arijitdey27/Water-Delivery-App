package com.waterapp.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

@Entity
public class Cart {

	@EmbeddedId
	private CartId cartId;
	private String product;
    private int qty;
    private double price;

    @ManyToOne
    @MapsId("userId")
	@JoinColumn(name = "user_id")
	private User user;
	
	public Cart() {
		super();
	
	}

	public Cart(CartId cartId, String product, int qty, double price, User user) {
		super();
		this.cartId = cartId;
		this.product = product;
		this.qty = qty;
		this.price = price;
		this.user = user;
	}

	public CartId getCartId() {
		return cartId;
	}

	public void setCartId(CartId cartId) {
		this.cartId = cartId;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
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
	
	
	
}
