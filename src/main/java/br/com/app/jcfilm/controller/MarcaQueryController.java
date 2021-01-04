package br.com.app.jcfilm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import br.com.app.jcfilm.model.Marca;
import br.com.app.jcfilm.service.MarcaService;


@RestController
@RequestMapping("/api")
public class MarcaQueryController {
	
	@Autowired
	MarcaService marcaService;
	
	@GetMapping("/marca")
	public ModelAndView marca(Marca marca) {
		ModelAndView model = new ModelAndView("tela-cadastro-marca");
		return model;
	}
	
	@GetMapping("/marca/pesquisa/{parametro}")
	public ModelAndView findByNomeMarca(@PathVariable String parametro) {
		ModelAndView model = new ModelAndView("tabela-lista-marcas");
		if(parametro.equalsIgnoreCase("0")) {
			model.addObject("marcas",marcaService.findAll());	
		}else {
			model.addObject("marcas",marcaService.findByName(parametro));		
		}
		
		return model;
	}
}
