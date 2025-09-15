package com.waterapp.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waterapp.entity.Products;
import com.waterapp.entity.User;
import com.waterapp.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class OrderController {
	
	@Autowired
	private ProductService productService;
	
	
	//add product into cart
	
	@RequestMapping("/addCart/{pId}")
	public String addCart(@PathVariable("pId") int pId,
	                      HttpServletRequest request,Model model,
	                      RedirectAttributes redirectAttributes) {
		User user=(User) request.getSession().getAttribute("user");
	    if(user == null) {
	        redirectAttributes.addFlashAttribute("msg", "Login required to buy.");
	        return "redirect:/login";
	    }
	    
		this.productService.addCart(user.getId(),pId);
		return "redirect:/cart?id="+user.getId();
	}
	
	
	
	//buy now
	
	@RequestMapping("/buyProduct/{pId}")
	public String buyProduct(@PathVariable("pId") int pId,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
		User user=(User) request.getSession().getAttribute("user");
	    if(user == null) {
	        redirectAttributes.addFlashAttribute("msg", "Login required to buy.");
	        return "redirect:/login";
	    }
		
	    Products product=this.productService.getProduct(pId);
	    request.getSession().setAttribute("product",product);
	    request.getSession().setAttribute("total",product.getPrice());
	    
		return "redirect:/buyconfirm";
	}
}
