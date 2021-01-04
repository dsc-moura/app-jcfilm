package br.com.app.jcfilm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.app.jcfilm.model.Acesso;
import br.com.app.jcfilm.service.AcessoService;

@RestController
@RequestMapping("/api")
public class AcessoQueryController {
	
	@Autowired
	AcessoService acessoService;
	
	@GetMapping("/acesso")
	public ModelAndView acesso(Acesso acesso) {
		ModelAndView model = new ModelAndView("tela-cadastro-acessos");
		
		return model;
	}
	
	@GetMapping("/acesso/pesquisa/{parametro}")
	public ModelAndView findByNomeEmail(@PathVariable String parametro){
		ModelAndView model = new ModelAndView("tabela-lista-funcionarios-acesso");
		
		if(parametro.equalsIgnoreCase("0")) {
			model.addObject("acessos", acessoService.findAll());
		}else {
			model.addObject("acessos", acessoService.findByNomeEmail(parametro));
		}	
		return model;
	}
	
	@GetMapping("/acesso/dados/{id}")
	public ResponseEntity<Acesso> findAcessoById(@PathVariable int id){
		Acesso acesso = acessoService.findAcessoById(id);
		
		if(acesso == null) {
			return ResponseEntity.badRequest().build();
		}		
		return ResponseEntity.ok(acesso);			
	}
	
}
