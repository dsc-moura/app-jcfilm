package br.com.app.jcfilm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.app.jcfilm.model.Usuario;
import br.com.app.jcfilm.service.UsuarioService;

@RestController
@RequestMapping("/api")
public class FuncionarioQueryController {
	
	@Autowired
	UsuarioService usuarioService;

	@RequestMapping("/funcionario")
	public ModelAndView funcionario(Usuario usuario) {
		ModelAndView model = new ModelAndView("tela-cadastro-funcionario");		
		return model;
	}	
	
	@GetMapping("/funcionario/pesquisa/{parametro}")
	public ModelAndView findFuncionario(@PathVariable String parametro){
		ModelAndView model = new ModelAndView("tabela-lista-funcionarios");
		if(parametro.equalsIgnoreCase("0")) {
			model.addObject("funcionarios", usuarioService.findAll());
		}else {
			model.addObject("funcionarios", usuarioService.findByNome(parametro));
		}	
		
		return model;
	}
	
	@GetMapping("/funcionario/dados/{id}")
	public ResponseEntity<Usuario> findFuncionarioById(@PathVariable int id){
		Usuario Usuario = usuarioService.findById(id);
		
		if(Usuario == null) {
			return ResponseEntity.badRequest().build();
		}		
		return ResponseEntity.ok(Usuario);			
	}
}
