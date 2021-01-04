package br.com.app.jcfilm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.app.jcfilm.model.Veiculo;
import br.com.app.jcfilm.service.MarcaService;
import br.com.app.jcfilm.service.VeiculoService;

@RestController
@RequestMapping("/api")
public class VeiculoQueryController {
	
	@Autowired
	VeiculoService veiculoService;
	
	@Autowired
	MarcaService marcaService;
	
	@GetMapping("/veiculo")
	public ModelAndView veiculo(Veiculo veiculo) {
		ModelAndView model = new ModelAndView("tela-cadastro-veiculo");
		model.addObject("marcas",marcaService.findAll());	
		return model;
	}
	
	@GetMapping("/veiculo/pesquisa/{parametro}")
	public ModelAndView findByNomeVeiculo(@PathVariable String parametro) {
		ModelAndView model = new ModelAndView("tabela-lista-veiculos");
		if(parametro.equalsIgnoreCase("0")) {
			model.addObject("veiculos",veiculoService.findAll());	
		}else {
			model.addObject("veiculos",veiculoService.findByName(parametro));		
		}
		
		return model;
	}
}
