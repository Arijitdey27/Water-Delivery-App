package com.waterapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.waterapp.entity.Cart;
import com.waterapp.entity.Products;
import com.waterapp.entity.User;
import com.waterapp.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CartController {

	@Autowired
	private ProductService productService;
	
	//buy confirm page handeller
	
	@RequestMapping("/buyconfirm")
	public String buyconfirm() {
		
		return "buyConfirmation";
	}
	
	
	//to transfer page from cart from final order section
	
	@RequestMapping("/buyCartProduct")
	public String buyCartProduct(HttpServletRequest request,Model model) {
		User user=(User) request.getSession().getAttribute("user");
		List<Cart> cartList= this.productService.getAllProduct(user.getId()); 
		
		double totalPrice=0;
		for (Cart cart : cartList) {
			totalPrice=totalPrice+cart.getPrice();
		}
		model.addAttribute("cart",cartList);
		model.addAttribute("total",totalPrice);
		request.getSession().setAttribute("cart", cartList);
		return "buyConfirmation";
	}
	
	
	//increment product
	
	@RequestMapping("/incProduct/{sId}")
	public RedirectView incrementProduct(@PathVariable("sId") int serialId,
			HttpServletRequest request) {
		
		RedirectView rv=new RedirectView();
		User user=(User)request.getSession().getAttribute("user");
		this.productService.increaseCartProduct(user.getId(),serialId);
		
		rv.setUrl(request.getContextPath()+"/cart?id="+user.getId());
		return rv;
	}
	//decrement product
	
	@RequestMapping("/decProduct/{sId}")
	public RedirectView decrementProduct(@PathVariable("sId") int serialId,
			HttpServletRequest request) {
		
		RedirectView rv=new RedirectView();
		User user=(User)request.getSession().getAttribute("user");
		this.productService.decreaseCartProduct(user.getId(),serialId);
		
		rv.setUrl(request.getContextPath()+"/cart?id="+user.getId());
		return rv;
	}
	
	
	//remove item from cart
	
	@RequestMapping("/removeProductFromCart/{sId}")
	public RedirectView removeProduct(@PathVariable("sId") int serialId,
			HttpServletRequest request) {
		
		RedirectView rv=new RedirectView();
		User user=(User)request.getSession().getAttribute("user");
		this.productService.removeCartProduct(user.getId(),serialId);
		
		rv.setUrl(request.getContextPath()+"/cart?id="+user.getId());
		return rv;
	}
	
	
	//final confirm page
	
	@RequestMapping("/confirm")
	public RedirectView confirm(HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		RedirectView rv=new RedirectView();
		User user=(User)request.getSession().getAttribute("user");
		
		// Check if order came from cart
		List<Cart> cartList = (List<Cart>) request.getSession().getAttribute("cart");
		
		 if (cartList != null && !cartList.isEmpty()) {
	        // Save order history
	        for (Cart cart : cartList) {
	            this.productService.saveOrderHistory(user, cart.getProduct(), cart.getQty(), cart.getPrice());
	        }

	        // Clear the cart
	        this.productService.clearCart(user.getId());

	        // Remove the flag
	        request.getSession().removeAttribute("cart");
	    } 
		else {
			Products product = (Products) request.getSession().getAttribute("product");
			if (product != null) {
				System.out.println(product.getpId());
	            this.productService.saveOrderHistory(user, product.getProduct(), 1, product.getPrice());
	            request.getSession().removeAttribute("product");
	            request.getSession().removeAttribute("total");
			}
		}
		
		redirectAttributes.addFlashAttribute("send","Placed Order !!");		
		rv.setUrl(request.getContextPath()+"/");
		return rv;
	}
}
