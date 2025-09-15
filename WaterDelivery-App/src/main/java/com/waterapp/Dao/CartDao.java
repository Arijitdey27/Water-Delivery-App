package com.waterapp.Dao;

import java.util.List;

import com.waterapp.entity.Cart;

public interface CartDao {

	public void addProduct(Cart cart);

	public List<Cart> getAllProduct(int userId);

	public void deleteProduct(int userId, int serialId);

	public void increaseCartProduct(int userId, int serialId);

	public void decreaseCartProduct(int userId, int serialId);

	

}
