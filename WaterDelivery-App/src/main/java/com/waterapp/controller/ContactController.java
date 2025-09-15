package com.waterapp.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waterapp.Dao.QueryDao;
import com.waterapp.entity.Query;


@Controller
public class ContactController {

	@Autowired
	private QueryDao queryDao;
	
	@RequestMapping(value="/query" , method = RequestMethod.POST)
	public String query(@ModelAttribute Query query, RedirectAttributes redirectAttributes,
			@RequestParam(name = "id", required = false) Integer id) {
	    if(id==null) {
	    	redirectAttributes.addFlashAttribute("send", "Login required to proceed.");
		    return "redirect:/login";
	    }
	    this.queryDao.newQuery(query);
	    redirectAttributes.addFlashAttribute("send", "Submit Successfully!");
	    return "redirect:/?id=" + id;
	}
}
