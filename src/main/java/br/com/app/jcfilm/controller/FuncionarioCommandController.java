package br.com.app.jcfilm.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.app.jcfilm.model.Usuario;
import br.com.app.jcfilm.service.AcessoService;
import br.com.app.jcfilm.service.UsuarioService;

@RestController
@RequestMapping("/api")
public class FuncionarioCommandController {
	
	@Autowired
	UsuarioService usuarioService;
	
	@Autowired
	AcessoService acessoService;
	
	@PostMapping("/funcionario/save")
	public ResponseEntity<String> save(@Valid Usuario usuario) {	
				
		if(usuario.getId() == 0) {			
					
			if(usuarioService.save(usuario) == null) {				
				return ResponseEntity.badRequest().body("Não foi possível efetuar o cadastro");
			}
			
			//Adiciono o funcionario na tabela de acessos
			acessoService.save(usuario);
			
			return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro efetuado com Sucesso");			
			
		}else {
						
			if(usuarioService.update(usuario) == null) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível alterar o cadastro");				
			}
				
			return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro alterado com Sucesso");				
		}		
	}
	
	@DeleteMapping("funcionario/{id}")
	public ResponseEntity<String> DeleteFuncionario(@PathVariable int id){
		Usuario usuario = usuarioService.findById(id);		
		
		if(usuario == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível excluir o cadastro!");	
		}
		
		usuarioService.delete(usuario);		
			
		return ResponseEntity.ok().body("Funcionario excluído com sucesso");		
	}
	
}
