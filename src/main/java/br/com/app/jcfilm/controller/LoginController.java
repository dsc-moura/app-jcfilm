package br.com.app.jcfilm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.app.jcfilm.model.Usuario;
import br.com.app.jcfilm.service.AcessoService;
import br.com.app.jcfilm.service.UsuarioService;

@Controller
public class LoginController {
	
	@Autowired
	UsuarioService usuarioService;
	
	@Autowired
	AcessoService acessoService;
	
	@GetMapping(value="/index")	
	public ModelAndView loginForm() {	
		ModelAndView modelAndView = new ModelAndView("index");	
		
		return modelAndView;		
	}
	
}
