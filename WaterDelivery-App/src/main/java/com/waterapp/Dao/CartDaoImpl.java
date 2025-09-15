package com.waterapp.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.waterapp.entity.Cart;
import com.waterapp.entity.CartId;

@Component
public class CartDaoImpl implements CartDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Override
	@Transactional
	public void addProduct(Cart cart) {
		this.hibernateTemplate.save(cart);
		
	}

	@Override
	public List<Cart> getAllProduct(int userId) {
		String hql = "from Cart c where c.cartId.userId = :uid";
	    List<Cart> cartList = (List<Cart>) this.hibernateTemplate.findByNamedParam(hql, "uid", userId);
		return cartList;
	}
	
	@Override
	@Transactional
	public void increaseCartProduct(int userId, int serialId) {
		CartId cartId=new CartId(userId,serialId);
		Cart cart=this.hibernateTemplate.get(Cart.class, cartId);
		double price=cart.getPrice()/cart.getQty();
		int qty=cart.getQty()+1;
		cart.setQty(qty);
		cart.setPrice(price*qty);
		this.hibernateTemplate.save(cart);
		
	}
	
	
	@Override
	@Transactional
	public void decreaseCartProduct(int userId, int serialId) {
		CartId cartId=new CartId(userId,serialId);
		Cart cart=this.hibernateTemplate.get(Cart.class, cartId);
		double price=cart.getPrice()/cart.getQty();
		int qty=cart.getQty()-1;
		if(qty==0) {
			this.hibernateTemplate.delete(cart);
			return;
		}
		cart.setQty(qty);
		cart.setPrice(price*qty);
		this.hibernateTemplate.save(cart);
		
	}


	
	
	@Override
	@Transactional
	public void deleteProduct(int userId, int serialId) {
		CartId cartId=new CartId(userId,serialId);
		Cart cart=this.hibernateTemplate.get(Cart.class, cartId);
		this.hibernateTemplate.delete(cart);
		
	}

	

	
}
