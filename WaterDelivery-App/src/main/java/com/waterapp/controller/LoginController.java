package com.waterapp.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.waterapp.entity.User;
import com.waterapp.service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/signUp")
	public String signUp() {
		
		return "signUp";
	}
	
	@RequestMapping(value="/registration", method = RequestMethod.POST)
	public String addUser(@ModelAttribute User newUser,
			Model model, HttpServletRequest request) {	
		boolean existMobile=this.userService.checkMobile(newUser.getMobile());
		boolean existEmail=this.userService.checkEmail(newUser.getEmail());
		if(existMobile) {
			model.addAttribute("mobile","Mobile number is already exist");
			return "signUp";
		}
		if(existEmail) {
			model.addAttribute("email","Email is already exist");
			return "signUp";
		}
		int userId=this.userService.addUser(newUser);
		model.addAttribute("userId",userId);
		request.getSession().setAttribute("user", newUser);
		return "redirect:/id=?"+userId;
	}
	
	@RequestMapping("/userLogin")
	public RedirectView userLogin(@RequestParam("mobile") long mobile,
			@RequestParam("password") String password, 
			Model model,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		RedirectView rv=new RedirectView();
		User user= this.userService.checkUser(mobile,password);
		if(user!=null) {
			model.addAttribute("user",user);
			request.getSession().setAttribute("user", user);
			redirectAttributes.addFlashAttribute("send", "Successfully Login!!");
		    rv.setUrl(request.getContextPath() + "?id="+user.getId());
		} 
		else {
			redirectAttributes.addFlashAttribute("send", "Check your mobile Number or password!!");
		    rv.setUrl(request.getContextPath() + "/login");
		}
		 
		return rv;
	}
	
}
