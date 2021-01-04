package br.com.app.jcfilm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.app.jcfilm.model.Produto;
import br.com.app.jcfilm.service.ProdutoService;

@RestController
@RequestMapping("/api")
public class ProdutoQueryController {

	@Autowired
	ProdutoService produtoService;
	
	@GetMapping("/produto")
	public ModelAndView produto(Produto produto) {
		ModelAndView model = new ModelAndView("tela-cadastro-produtos");
		return model;
	}
	
	@GetMapping("/produto/pesquisa/{parametro}")
	public ModelAndView findByNomeProduto(@PathVariable String parametro) {
		ModelAndView model = new ModelAndView("tabela-lista-produtos");
		if(parametro.equalsIgnoreCase("0")) {
			model.addObject("produtos",produtoService.findAll());	
		}else {
			model.addObject("produtos",produtoService.findByName(parametro));		
		}
		
		return model;
	}
	
	@GetMapping("/produto/produtos")
	public ModelAndView findAllProdutos() {
		ModelAndView model = new ModelAndView("tabela-lista-produtos-selecao-carrinho");		
		model.addObject("produtos",produtoService.findAll());		
		
		return model;
	}
}
