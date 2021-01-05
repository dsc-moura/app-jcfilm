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

import br.com.app.jcfilm.model.Produto;
import br.com.app.jcfilm.service.ProdutoService;

@RestController
@RequestMapping("/api")
public class ProdutoCommandController {

	@Autowired
	ProdutoService produtoService;
	
	@PostMapping("/produto/save")
	public ResponseEntity<String> save(@Valid Produto produto) {	
				
		if(produto.getId() == 0) {			
			Produto verifica = produtoService.findByNome(produto.getNome());
			
			if(verifica == null) {
				produto.setNome(produto.getNome().toUpperCase());
				
				if(produtoService.save(produto) == null) {				
					return ResponseEntity.badRequest().body("Não foi possível efetuar o cadastro!");
				}
				
				return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro efetuado com Sucesso!");			
			}
			
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Produto já cadastrada!");
		}else {
						
			if(produtoService.update(produto) == null) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível alterar o cadastro!");				
			}
				
			return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro alterado com Sucesso!");				
		}		
	}
	
	@DeleteMapping("produto/{id}")
	public ResponseEntity<String> DeleteProduto(@PathVariable int id){
		Produto produto = produtoService.findById(id);
		if(produto == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível excluir o cadastro!");	
		}
		
		produtoService.delete(produto);
		
		return ResponseEntity.ok().body("Marca excluída com sucesso!");
	}
}
