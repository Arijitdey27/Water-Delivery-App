package com.waterapp.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waterapp.Dao.CartDao;
import com.waterapp.Dao.ProductDao;
import com.waterapp.Dao.UserDao;
import com.waterapp.entity.Cart;
import com.waterapp.entity.CartId;
import com.waterapp.entity.OrderHistory;
import com.waterapp.entity.OrderHistoryId;
import com.waterapp.entity.Products;
import com.waterapp.entity.User;

@Service
public class ProductService {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CartDao cartDao;
	
	//add product into cart
	
	public void addCart(int userId, int pId) {
		User user=this.userDao.getUserWithOrdersAndCart(userId);
		Products product=this.productDao.getProduct(pId);
		
		Integer maxSerial = (Integer) hibernateTemplate.execute(session ->
        session.createQuery("select max(c.id.serialId) from Cart c where c.id.userId = :userId", Integer.class)
               .setParameter("userId", userId)
               .uniqueResult()
		);
		
		int nextSerialId = (maxSerial == null ? 1 : maxSerial + 1);
		
		CartId cartId = new CartId(userId, nextSerialId);
	    Cart cart = new Cart(cartId, product.getProduct(), 1, product.getPrice(), user);
		System.out.println(cart);
		this.cartDao.addProduct(cart);
	}

	
	//increase product qty in cart
	
	public void increaseCartProduct(int userId, int serialId) {
		this.cartDao.increaseCartProduct(userId,serialId);
		
	}
	
	
	//decrease product qty in cart
	
	public void decreaseCartProduct(int userId, int serialId) {
		this.cartDao.decreaseCartProduct(userId,serialId);
		
	}
	
	
	
	//delete product from cart
	public void removeCartProduct(int userId, int serialId) {
			this.cartDao.deleteProduct(userId,serialId);
			
		}
	
	
	
	//get all cart value
	
	public List<Cart> getAllProduct(int userId) {
		List<Cart> cartList=this.cartDao.getAllProduct(userId);
		return cartList;
	}

	
	
	//get single product 
	
	public Products getProduct(int pId) {
		Products product=this.productDao.getProduct(pId);
		return product;
	}
	
	
	

	 // Save a confirmed order into OrderHistory
	@Transactional
    public void saveOrderHistory(User user, String product, int qty, double price) {
        // find max oId for this user
		Integer maxOId = hibernateTemplate.execute(session ->
	        session.createQuery(
	                "select max(oh.orderHistoryId.oId) from OrderHistory oh where oh.user.id = :userId",
	                Integer.class
	        )
	        .setParameter("userId", user.getId())
	        .uniqueResult()
	    );
		
		int nextOId = (maxOId != null ? maxOId + 1 : 1);

        OrderHistoryId id = new OrderHistoryId(nextOId, user.getId());

        OrderHistory history = new OrderHistory();
        history.setOrderHistoryId(id);
        history.setUser(user);
        history.setProduct(product);
        history.setQty(qty);
        history.setPrice(price);

        // Save only date (no time part)
        history.setDate(LocalDate.now());

        hibernateTemplate.save(history);
    }

    // Clear cart after confirm
    @Transactional
    public void clearCart(int userId) {
        // Load cart items by user and delete them
       
    	 hibernateTemplate.execute(session -> {
    	        session.createQuery("delete from Cart c where c.user.id = :userId")
    	               .setParameter("userId", userId)
    	               .executeUpdate();
    	        return null;
    	    });
    }

    
    //get all order

	public List<OrderHistory> getAllOrderHistory(int userId) {
		List<OrderHistory> orderHistory= this.productDao.getAllOrderHistory(userId);
		return orderHistory;
	}


	


	


	
	
}
