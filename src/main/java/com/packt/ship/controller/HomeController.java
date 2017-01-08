package com.packt.ship.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String greeting(Model model, HttpServletRequest request) {
		model.addAttribute("session", request.getRemoteUser());
		return "welcome";
	}
	
	@RequestMapping("/contact")
	public String contact(Model model, HttpServletRequest request) {
		model.addAttribute("session", request.getRemoteUser());
		return "contact";
	}
}