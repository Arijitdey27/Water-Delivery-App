package com.waterapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waterapp.entity.Cart;
import com.waterapp.entity.OrderHistory;
import com.waterapp.entity.User;
import com.waterapp.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;

	@RequestMapping(value={"/","/{id}"})
	public String home(@RequestParam(name = "id", required = false) Integer id) {
		
		return "index";
	}
	
	@RequestMapping("/order")
	public String order(@RequestParam(name = "id", required = false) Integer id,
			Model model) {
	    
		if(id==null) {
			return "order";
		}
		
		List<Cart> cartList=this.productService.getAllProduct(id);
		List<String> cartProduct=new ArrayList<String>();
		for (Cart cart : cartList) {
			cartProduct.add(cart.getProduct());
		}
		model.addAttribute("cartProduct",cartProduct);
		
		return "order";
	}
	
	@RequestMapping("/about")
	public String about(@RequestParam(name = "id", required = false) Integer id){
		
		return "about";
	}
	
	@RequestMapping("/contact")
	public String contact(@RequestParam(name = "id", required = false) Integer id) {
		return "contact";
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam(name = "id", required = false) Integer id) {
		
		return "login";
	}
	
	@RequestMapping("/cart")
	public String cart(@RequestParam(name = "id", required = false) Integer id,
			Model model ,RedirectAttributes redirectAttributes) {
		if(id==null) {
			redirectAttributes.addFlashAttribute("msg", "Login required to proceed.");
			return "redirect:/login";
		}
		List<Cart> cartList=this.productService.getAllProduct(id);
		model.addAttribute("cart",cartList);
		return "cart";
	}
	
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "redirect:/";
	}
	
	
	@RequestMapping("/orderHistory")
	public String orderHistory(HttpServletRequest request,Model model) {
		User user=(User)request.getSession().getAttribute("user");
		List<OrderHistory> orderList=this.productService.getAllOrderHistory(user.getId());
		
		model.addAttribute("orderList",orderList);
		return "orderHistory";
	}
	
}
