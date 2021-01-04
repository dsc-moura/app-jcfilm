package br.com.app.jcfilm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@GetMapping(value="/index")	
	public ModelAndView loginForm() {	
		ModelAndView modelAndView = new ModelAndView("index");		
		return modelAndView;		
	}
	
}
